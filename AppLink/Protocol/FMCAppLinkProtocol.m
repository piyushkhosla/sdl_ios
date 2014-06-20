//
//  FMCAppLinkProtocol.m
//  ProtocolReWrite
//

#import "FMCAppLinkProtocol.h"
#import "FMCAppLinkProtocolHeader.h"
#import "FMCAppLinkV2ProtocolHeader.h"
#import "FMCAppLinkProtocolMessageDisassembler.h"
#import "FMCApplinkProtocolRecievedMessageRouter.h"
#import "FMCDebugTool.h"


const NSUInteger MAX_TRANSMISSION_SIZE = 512;

@interface FMCAppLinkProtocol () {
    UInt32 _messageID;
    dispatch_queue_t _recieveQueue;
    dispatch_queue_t _sendQueueDefaultPriority;
    dispatch_queue_t _sendQueueHighPriority;
}

@property (strong) NSMutableData *recieveBuffer;
@property (strong) FMCApplinkProtocolRecievedMessageRouter *messageRouter;

- (void)sendDataToTransport:(NSData *)data;
- (void)sendDataToTransportWithHighPriority:(NSData *)data;

@end


@implementation FMCAppLinkProtocol

- (id)init {
	if (self = [super init]) {
        _messageID = 0;
        _recieveQueue = dispatch_queue_create("com.ford.applink.recieve", DISPATCH_QUEUE_SERIAL);
        _sendQueueDefaultPriority = dispatch_queue_create("com.ford.applink.send.defaultpriority", DISPATCH_QUEUE_SERIAL);
        _sendQueueHighPriority = dispatch_queue_create("com.ford.applink.send.highpriority", DISPATCH_QUEUE_SERIAL);
        dispatch_set_target_queue(_sendQueueDefaultPriority, _sendQueueHighPriority);

        self.messageRouter = [[FMCApplinkProtocolRecievedMessageRouter alloc] init];
	}
	return self;
}


- (void)sendStartSessionWithType:(FMCServiceType)serviceType {

    FMCAppLinkProtocolHeader *header = [FMCAppLinkProtocolHeader headerForVersion:1];
    header.frameType = FMCFrameType_Control;
    header.serviceType = serviceType;
    header.frameData = FMCFrameData_StartSession;

    FMCAppLinkProtocolMessage *message = [[FMCAppLinkProtocolMessage alloc] initWithHeader:header andPayload:nil];

    [self sendDataToTransport:message.data];
}

- (void)sendEndSessionWithType:(FMCServiceType)serviceType sessionID:(Byte)sessionID {

	FMCAppLinkProtocolHeader *header = [FMCAppLinkProtocolHeader headerForVersion:1];
    header.frameType = FMCFrameType_Control;
    header.serviceType = serviceType;
    header.frameData = FMCFrameData_StartSession;
    header.sessionID = sessionID;

    FMCAppLinkProtocolMessage *message = [[FMCAppLinkProtocolMessage alloc] initWithHeader:header andPayload:nil];

    [self sendDataToTransport:message.data];

}

- (void)sendData:(FMCAppLinkProtocolMessage *)protocolMessage {

    _messageID++;


    // V2 messages need to have message ID property set.
    if (protocolMessage.header.version == 2) {
        [((FMCAppLinkV2ProtocolHeader*)[protocolMessage header]) setMessageID:_messageID];
    }


    //
    // See if it is small enough to send in one transmission.
    // If not, break it up into smaller messages and send.
    //
    if (protocolMessage.size < MAX_TRANSMISSION_SIZE)
    {
        [self sendDataToTransport:protocolMessage.data];

    }
    else
    {
        NSArray *messages = [FMCAppLinkProtocolMessageDisassembler disassemble:protocolMessage withLimit:MAX_TRANSMISSION_SIZE];
        for (FMCAppLinkProtocolMessage *message in messages) {
            [self sendDataToTransport:message.data];
        }

    }

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
    // TODO: Find out if there is a maximim message size that the module is allowed to send.
    // is it the same as our limit? If we exceed that size without having a mesage completed
    // we can use that as error detection.
    // TODO: how to recover from errors?


    // Initialize the recieve buffer which will contain bytes while messages are constructed.
    if (self.recieveBuffer == nil) {
        self.recieveBuffer = [NSMutableData dataWithCapacity:(4 * MAX_TRANSMISSION_SIZE)];
    }

    // Save the data
    [self.recieveBuffer appendData:recievedData];

    // Get the version
    UInt8 version = [FMCAppLinkProtocolMessage determineVersion:self.recieveBuffer];
    self.highestRecievedVersion = MAX(version, self.highestRecievedVersion);


    // If we have enough bytes, create the header.
    FMCAppLinkProtocolHeader* header = [FMCAppLinkProtocolHeader headerForVersion:version];
    NSUInteger headerSize = header.size;
    if (self.recieveBuffer.length >= headerSize) {
        [header parse:self.recieveBuffer];
    } else {
        // Need to wait for more bytes.
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
        message = [[FMCAppLinkProtocolMessage alloc] initWithHeader:header andPayload:payload];
    } else {
        // Need to wait for more bytes.
        return;
    }


    // Need to maintain the recieveBuffer, remove the bytes from it which we just processed.
    self.recieveBuffer = [[self.recieveBuffer subdataWithRange:NSMakeRange(messageSize, self.recieveBuffer.length - messageSize)] mutableCopy];


    // Pass on ultimate disposition of the message to the message router.
    self.messageRouter.delegate = self.protocolDelegate;
//    dispatch_async(_recieveQueue, ^{
        [self.messageRouter handleRecievedMessage:message];
//    });

}


@end
