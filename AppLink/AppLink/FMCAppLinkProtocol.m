//  FMCAppLinkProtocol.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <objc/runtime.h>
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
#import "FMCPrioritizedObjectCollection.h"
#import "FMCDataStreamHandlingDelegate.h"


const NSUInteger MAX_TRANSMISSION_SIZE = 1024;
const UInt8 MAX_VERSION_TO_SEND = 3;

@interface FMCAppLinkProtocol () {
    UInt32 _messageID;
    dispatch_queue_t _recieveQueue;
    dispatch_queue_t _sendQueue;
    FMCPrioritizedObjectCollection *_prioritizedCollection;
    NSMutableDictionary *_sessionIDs;
    BOOL _alreadyDestructed;
}

@property (assign) UInt8 version;
@property (assign) UInt8 maxVersionSupportedByHeadUnit;
@property (strong) NSMutableData *recieveBuffer;
@property (strong) FMCApplinkProtocolRecievedMessageRouter *messageRouter;

- (void)sendDataToTransport:(NSData *)data withPriority:(NSInteger)priority;
- (void)logRPCSend:(FMCAppLinkProtocolMessage *)message;

@end


@implementation FMCAppLinkProtocol

- (id)init {
	if (self = [super init]) {
        _alreadyDestructed = NO;
        _version = 1;
        _messageID = 0;
        _recieveQueue = dispatch_queue_create("com.ford.applink.protocol.recieve", DISPATCH_QUEUE_SERIAL);
        _sendQueue = dispatch_queue_create("com.ford.applink.protocol.send", DISPATCH_QUEUE_SERIAL);
        _prioritizedCollection = [FMCPrioritizedObjectCollection new];
        _sessionIDs = [NSMutableDictionary new];

        self.messageRouter = [[FMCApplinkProtocolRecievedMessageRouter alloc] init];
        self.messageRouter.delegate = self;
	}
	return self;
}

- (void)storeSessionID:(UInt8)sessionID forServiceType:(FMCServiceType)serviceType {
    [_sessionIDs setObject:[NSNumber numberWithUnsignedChar:sessionID] forKey:[NSNumber numberWithUnsignedChar:serviceType]];
}

- (UInt8)retrieveSessionIDforServiceType:(FMCServiceType)serviceType {

    NSNumber *number = [_sessionIDs objectForKey:[NSNumber numberWithUnsignedChar:serviceType]];
    if (!number) {
        NSString *logMessage = [NSString stringWithFormat:@"Warning: Tried to retrieve sessionID for serviceType %i, but no sessionID is saved for that service type.", serviceType];
        [FMCDebugTool logInfo:logMessage withType:FMCDebugType_Protocol toOutput:FMCDebugOutput_File|FMCDebugOutput_DeviceConsole toGroup:self.debugConsoleGroupName];
    }

    return number?[number unsignedIntegerValue]:0;
}

- (void)sendStartSessionWithType:(FMCServiceType)serviceType {

    FMCAppLinkProtocolHeader *header = [FMCAppLinkProtocolHeader headerForVersion:1];
    header.frameType = FMCFrameType_Control;
    header.serviceType = serviceType;
    header.frameData = FMCFrameData_StartSession;

    FMCAppLinkProtocolMessage *message = [FMCAppLinkProtocolMessage messageWithHeader:header andPayload:nil];

    [self sendDataToTransport:message.data withPriority:serviceType];
}

- (void)sendEndSessionWithType:(FMCServiceType)serviceType {

	FMCAppLinkProtocolHeader *header = [FMCAppLinkProtocolHeader headerForVersion:self.version];
    header.frameType = FMCFrameType_Control;
    header.serviceType = serviceType;
    header.frameData = FMCFrameData_StartSession;
    header.sessionID = [self retrieveSessionIDforServiceType:serviceType];

    FMCAppLinkProtocolMessage *message = [FMCAppLinkProtocolMessage messageWithHeader:header andPayload:nil];

    [self sendDataToTransport:message.data withPriority:serviceType];

}

// FMCRPCRequest in from app -> FMCAppLinkProtocolMessage out to transport layer.
- (void)sendRPCRequest:(FMCRPCRequest *)rpcRequest {

    NSData *jsonData = [[FMCJsonEncoder instance] encodeDictionary:[rpcRequest serializeAsDictionary:self.version]];
    NSData* messagePayload = nil;

    NSString *logMessage = [NSString stringWithFormat:@"%@", rpcRequest];
    [FMCDebugTool logInfo:logMessage withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];


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
    header.sessionID = [self retrieveSessionIDforServiceType:FMCServiceType_RPC];
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
        [self sendDataToTransport:message.data withPriority:FMCServiceType_RPC];
    }
    else
    {
        NSArray *messages = [FMCAppLinkProtocolMessageDisassembler disassemble:message withLimit:MAX_TRANSMISSION_SIZE];
        for (FMCAppLinkProtocolMessage *smallerMessage in messages) {
            [self logRPCSend:smallerMessage];
            [self sendDataToTransport:smallerMessage.data withPriority:FMCServiceType_RPC];
        }
        
    }

}

- (void)logRPCSend:(FMCAppLinkProtocolMessage *)message {
    NSString *logMessage = [NSString stringWithFormat:@"Sending : %@", message];
    [FMCDebugTool logInfo:logMessage withType:FMCDebugType_Protocol toOutput:FMCDebugOutput_File|FMCDebugOutput_DeviceConsole toGroup:self.debugConsoleGroupName];
}

// Use for normal messages
- (void)sendDataToTransport:(NSData *)data withPriority:(NSInteger)priority {

    [_prioritizedCollection addObject:data withPriority:priority];

    dispatch_async(_sendQueue, ^{

        NSData *dataToTransmit = nil;
        while(dataToTransmit = (NSData *)[_prioritizedCollection nextObject])
        {
            [self.transport sendData:dataToTransmit];
        };

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

    [self processMessages];
}

- (void)processMessages {
    //NSMutableString *logMessage = [[NSMutableString alloc]init];
    
    // Get the version
    UInt8 incomingVersion = [FMCAppLinkProtocolMessage determineVersion:self.recieveBuffer];
    
    // If we have enough bytes, create the header.
    FMCAppLinkProtocolHeader* header = [FMCAppLinkProtocolHeader headerForVersion:incomingVersion];
    NSUInteger headerSize = header.size;
    if (self.recieveBuffer.length >= headerSize) {
        [header parse:self.recieveBuffer];
    } else {
        // Need to wait for more bytes.
        /*[logMessage appendString:@"header incomplete, waiting for more bytes."];
        [FMCDebugTool logInfo:logMessage withType:FMCDebugType_Protocol toOutput:FMCDebugOutput_File|FMCDebugOutput_DeviceConsole toGroup:self.debugConsoleGroupName];*/
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
        /*[logMessage appendFormat:@"message complete. %@", message];
        [FMCDebugTool logInfo:logMessage withType:FMCDebugType_Protocol toOutput:FMCDebugOutput_File|FMCDebugOutput_DeviceConsole toGroup:self.debugConsoleGroupName];*/
    } else {
        // Need to wait for more bytes.
        /*[logMessage appendFormat:@"header complete. message incomplete, waiting for %ld more bytes. Header:%@", (long)(messageSize - self.recieveBuffer.length), header];
        [FMCDebugTool logInfo:logMessage withType:FMCDebugType_Protocol toOutput:FMCDebugOutput_File|FMCDebugOutput_DeviceConsole toGroup:self.debugConsoleGroupName];*/
        return;
    }
    
    // Need to maintain the recieveBuffer, remove the bytes from it which we just processed.
    self.recieveBuffer = [[self.recieveBuffer subdataWithRange:NSMakeRange(messageSize, self.recieveBuffer.length - messageSize)] mutableCopy];
    
    // Pass on ultimate disposition of the message to the message router.
    dispatch_async(_recieveQueue, ^{
        [self.messageRouter handleRecievedMessage:message];
    });
    
    // Call recursively until the buffer is empty or incomplete message is encountered
    if (self.recieveBuffer.length > 0)
        [self processMessages];
}

- (void)sendHeartbeat {
	FMCAppLinkProtocolHeader *header = [FMCAppLinkProtocolHeader headerForVersion:self.version];
    header.frameType = FMCFrameType_Control;
    header.serviceType = 0;
    header.frameData = FMCFrameData_Heartbeat;

    FMCAppLinkProtocolMessage *message = [FMCAppLinkProtocolMessage messageWithHeader:header andPayload:nil];

    [self sendDataToTransport:message.data withPriority:header.serviceType];

}

- (void)sendRawDataStream:(NSInputStream *)inputStream withServiceType:(FMCServiceType)serviceType {

    FMCDataStreamHandlingDelegate *streamDelegate = [FMCDataStreamHandlingDelegate new];
    streamDelegate.serviceType = serviceType;
    streamDelegate.protocol = self;
    objc_setAssociatedObject(inputStream, @"RetainedDelegate", streamDelegate, OBJC_ASSOCIATION_RETAIN);


    inputStream.delegate = streamDelegate;
    [inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [inputStream open];

    // Stream events start getting processed and when there is data available it calls
    // back to sendRawData:(NSData *)data withServiceType:(FMCServiceType)serviceType

}

- (void)sendRawData:(NSData *)data withServiceType:(FMCServiceType)serviceType {
    FMCAppLinkV2ProtocolHeader *header = [FMCAppLinkV2ProtocolHeader new];
    header.frameType = FMCFrameType_Single;
    header.serviceType = serviceType;
    header.sessionID = [self retrieveSessionIDforServiceType:serviceType];
    header.bytesInPayload = (UInt32)data.length;
    header.messageID = ++_messageID;

    FMCAppLinkProtocolMessage *message = [FMCAppLinkProtocolMessage messageWithHeader:header andPayload:data];
    [self sendDataToTransport:message.data withPriority:header.serviceType];
}


#pragma mark - FMCProtocolListener Implementation
- (void)handleProtocolSessionStarted:(FMCServiceType)serviceType sessionID:(Byte)sessionID version:(Byte)version {

    [self storeSessionID:sessionID forServiceType:serviceType];

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

- (void)destructObjects {
    if(!_alreadyDestructed) {
        _alreadyDestructed = YES;
        self.messageRouter.delegate = nil;
        self.messageRouter = nil;
        self.transport = nil;
        self.protocolDelegate = nil;
    }
}

- (void)dispose {
    [self destructObjects];
}

- (void)dealloc {
    [self destructObjects];
    [FMCDebugTool logInfo:@"FMCAppLinkProtocol Dealloc" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
}

@end
