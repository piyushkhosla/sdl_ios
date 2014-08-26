//  FMCAppLinkProtocol.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCJsonEncoder.h>
#import <AppLink/FMCFunctionID.h>

#import "FMCRPCRequest.h"
#import "FMCAppLinkProtocol.h"
#import "FMCAppLinkProtocolHeader.h"
#import "FMCAppLinkV2ProtocolHeader.h"
#import "FMCAppLinkProtocolMessageDisassembler.h"
#import "FMCApplinkProtocolRecievedMessageRouter.h"
#import "FMCRPCPayload.h"
#import "FMCDebugTool.h"


const NSUInteger MAX_TRANSMISSION_SIZE = 512;
const UInt8 MAX_VERSION_TO_SEND = 3;

@interface FMCAppLinkProtocol () {
    UInt32 _messageID;
    dispatch_queue_t _recieveQueue;
    dispatch_queue_t _sendQueueDefaultPriority;
    dispatch_queue_t _sendQueueHighPriority;
}

@property (assign) UInt8 version;
@property (assign) UInt8 maxVersionSupportedByHeadUnit;
@property (assign) UInt8 sessionID;
@property (strong) NSMutableData *recieveBuffer;
@property (strong) FMCApplinkProtocolRecievedMessageRouter *messageRouter;

- (void)sendDataToTransport:(NSData *)data;
- (void)sendDataToTransportWithHighPriority:(NSData *)data;
- (void)logRPCSend:(FMCAppLinkProtocolMessage *)message;

@end


@implementation FMCAppLinkProtocol

- (id)init {
	if (self = [super init]) {
        _version = 1;
        _messageID = 0;
        _sessionID = 0;
        _recieveQueue = dispatch_queue_create("com.ford.applink.recieve", DISPATCH_QUEUE_SERIAL);
        _sendQueueDefaultPriority = dispatch_queue_create("com.ford.applink.send.defaultpriority", DISPATCH_QUEUE_SERIAL);
        _sendQueueHighPriority = dispatch_queue_create("com.ford.applink.send.highpriority", DISPATCH_QUEUE_SERIAL);
        dispatch_set_target_queue(_sendQueueDefaultPriority, _sendQueueHighPriority);

        self.messageRouter = [[FMCApplinkProtocolRecievedMessageRouter alloc] init];
        self.messageRouter.delegate = self;
	}
	return self;
}


- (void)sendStartSessionWithType:(FMCServiceType)serviceType {

    FMCAppLinkProtocolHeader *header = [FMCAppLinkProtocolHeader headerForVersion:1];
    header.frameType = FMCFrameType_Control;
    header.serviceType = serviceType;
    header.frameData = FMCFrameData_StartSession;

    FMCAppLinkProtocolMessage *message = [FMCAppLinkProtocolMessage messageWithHeader:header andPayload:nil];

    [self sendDataToTransport:message.data];
}

- (void)sendEndSessionWithType:(FMCServiceType)serviceType sessionID:(Byte)sessionID {

	FMCAppLinkProtocolHeader *header = [FMCAppLinkProtocolHeader headerForVersion:self.version];
    header.frameType = FMCFrameType_Control;
    header.serviceType = serviceType;
    header.frameData = FMCFrameData_StartSession;
    header.sessionID = self.sessionID;

    FMCAppLinkProtocolMessage *message = [FMCAppLinkProtocolMessage messageWithHeader:header andPayload:nil];

    [self sendDataToTransport:message.data];

}

// FMCRPCRequest in from app -> FMCAppLinkProtocolMessage out to transport layer.
- (void)sendRPCRequest:(FMCRPCRequest *)rpcRequest {

    NSData *jsonData = [[FMCJsonEncoder instance] encodeDictionary:[rpcRequest serializeAsDictionary:self.version]];
    NSData* messagePayload = nil;

    if(self.version == 1) {
        messagePayload = jsonData;
    } else if (self.version == 2) {
        // Serialize the RPC data into an NSData
        FMCRPCPayload *rpcPayload = [[FMCRPCPayload alloc] init];
        rpcPayload.rpcType = 0;
        rpcPayload.functionID = [[[[FMCFunctionID alloc] init] getFunctionID:[rpcRequest getFunctionName]] intValue];
        rpcPayload.correlationID = [rpcRequest.correlationID intValue];
        rpcPayload.jsonData = jsonData;
        rpcPayload.binaryData = rpcRequest.bulkData;
        messagePayload = rpcPayload.data;
    }

    //
    // Build the protocol level header & message
    //
    FMCAppLinkProtocolHeader *header = [FMCAppLinkProtocolHeader headerForVersion:self.version];
    header.frameType = FMCFrameType_Single;
    header.serviceType = FMCServiceType_RPC;
    header.frameData = FMCFrameData_SingleFrame;
    header.sessionID = self.sessionID;
    header.bytesInPayload = (UInt32)messagePayload.length;

    // V2+ messages need to have message ID property set.
    if (self.version >= 2) {
        [((FMCAppLinkV2ProtocolHeader*)header) setMessageID:++_messageID];
    }
    

    FMCAppLinkProtocolMessage *message = [FMCAppLinkProtocolMessage messageWithHeader:header andPayload:messagePayload];


    //
    // See if the message is small enough to send in one transmission.
    // If not, break it up into smaller messages and send.
    //
    if (message.size < MAX_TRANSMISSION_SIZE)
    {
        [self logRPCSend:message];
        [self sendDataToTransport:message.data];
    }
    else
    {
        NSArray *messages = [FMCAppLinkProtocolMessageDisassembler disassemble:message withLimit:MAX_TRANSMISSION_SIZE];
        for (FMCAppLinkProtocolMessage *smallerMessage in messages) {
            [self logRPCSend:message];
            [self sendDataToTransport:smallerMessage.data];
        }
        
    }

}

- (void)logRPCSend:(FMCAppLinkProtocolMessage *)message {
    NSString *logMessage = [NSString stringWithFormat:@"Sending : %@", message];
    [FMCDebugTool logInfo:logMessage withType:FMCDebugType_Protocol toOutput:FMCDebugOutput_File|FMCDebugOutput_DeviceConsole];
}

// Use for normal messages
- (void)sendDataToTransport:(NSData *)data {
    dispatch_async(_sendQueueDefaultPriority, ^{
        [self.transport sendData:data];
    });
}

// Use for critical messages, will jump ahead of any already queued normal priority messages.
- (void)sendDataToTransportWithHighPriority:(NSData *)data {
    dispatch_suspend(_sendQueueDefaultPriority);
    dispatch_async(_sendQueueHighPriority, ^{
        [self.transport sendData:data];
        dispatch_resume(_sendQueueDefaultPriority);
    });
}

//
// Turn recieved bytes into message objects.
//
- (void)handleBytesFromTransport:(NSData *)recievedData {

    NSMutableString *logMessage = [[NSMutableString alloc]init];//
    [logMessage appendFormat:@"Received: %ld", (long)recievedData.length];

    // Initialize the recieve buffer which will contain bytes while messages are constructed.
    if (self.recieveBuffer == nil) {
        self.recieveBuffer = [NSMutableData dataWithCapacity:(4 * MAX_TRANSMISSION_SIZE)];
    }

    // Save the data
    [self.recieveBuffer appendData:recievedData];
    [logMessage appendFormat:@"(%ld) ", (long)self.recieveBuffer.length];

    // Get the version
    UInt8 incomingVersion = [FMCAppLinkProtocolMessage determineVersion:self.recieveBuffer];

    // If we have enough bytes, create the header.
    FMCAppLinkProtocolHeader* header = [FMCAppLinkProtocolHeader headerForVersion:incomingVersion];
    NSUInteger headerSize = header.size;
    if (self.recieveBuffer.length >= headerSize) {
        [header parse:self.recieveBuffer];
    } else {
        // Need to wait for more bytes.
        [logMessage appendString:@"header incomplete, waiting for more bytes."];
        [FMCDebugTool logInfo:logMessage withType:FMCDebugType_Protocol toOutput:FMCDebugOutput_File|FMCDebugOutput_DeviceConsole];
        return;
    }

    // If we have enough bytes, finish building the message.
    FMCAppLinkProtocolMessage *message = nil;
    NSUInteger payloadSize = header.bytesInPayload;
    NSUInteger messageSize = headerSize + payloadSize;
    if (self.recieveBuffer.length >= messageSize) {
        NSUInteger payloadOffset = headerSize;
        NSUInteger payloadLength = payloadSize;
        NSData *payload = [self.recieveBuffer subdataWithRange:NSMakeRange(payloadOffset, payloadLength)];
        message = [FMCAppLinkProtocolMessage messageWithHeader:header andPayload:payload];
        [logMessage appendFormat:@"message complete. %@", message];
        [FMCDebugTool logInfo:logMessage withType:FMCDebugType_Protocol toOutput:FMCDebugOutput_File|FMCDebugOutput_DeviceConsole];
    } else {
        // Need to wait for more bytes.
        [logMessage appendFormat:@"header complete. message incomplete, waiting for %ld more bytes. Header:%@", (long)(messageSize - self.recieveBuffer.length), header];
        [FMCDebugTool logInfo:logMessage withType:FMCDebugType_Protocol toOutput:FMCDebugOutput_File|FMCDebugOutput_DeviceConsole];
        return;
    }


    // Need to maintain the recieveBuffer, remove the bytes from it which we just processed.
    self.recieveBuffer = [[self.recieveBuffer subdataWithRange:NSMakeRange(messageSize, self.recieveBuffer.length - messageSize)] mutableCopy];


    // Pass on ultimate disposition of the message to the message router.
    dispatch_async(_recieveQueue, ^{
        [self.messageRouter handleRecievedMessage:message];
    });

}

- (void)sendHeartbeat {
	FMCAppLinkProtocolHeader *header = [FMCAppLinkProtocolHeader headerForVersion:self.version];
    header.frameType = FMCFrameType_Control;
    header.serviceType = 0;
    header.frameData = FMCFrameData_Heartbeat;
    header.sessionID = self.sessionID;

    FMCAppLinkProtocolMessage *message = [FMCAppLinkProtocolMessage messageWithHeader:header andPayload:nil];

    [self sendDataToTransport:message.data];

}


#pragma mark - FMCProtocolListener Implementation
- (void)handleProtocolSessionStarted:(FMCServiceType)serviceType sessionID:(Byte)sessionID version:(Byte)version {
    self.sessionID = sessionID;
    self.maxVersionSupportedByHeadUnit = version;
    self.version = MIN(self.maxVersionSupportedByHeadUnit, MAX_VERSION_TO_SEND);

    if (self.version >= 3) {
        // start hearbeat
    }

    [self.protocolDelegate handleProtocolSessionStarted:serviceType sessionID:sessionID version:version];
}

- (void)onProtocolMessageReceived:(FMCAppLinkProtocolMessage *)msg {
    [self.protocolDelegate onProtocolMessageReceived:msg];
}

- (void)onProtocolOpened {
    [self.protocolDelegate onProtocolOpened];
}

- (void)onProtocolClosed {
    [self.protocolDelegate onProtocolClosed];
}

- (void)onError:(NSString *)info exception:(NSException *)e {
    [self.protocolDelegate onError:info exception:e];
}


@end
