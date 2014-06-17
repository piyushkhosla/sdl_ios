//
//  FMCAppLinkProtocol.m
//  ProtocolReWrite
//

#import "FMCAppLinkProtocol.h"
#import "FMCAppLinkProtocolHeader.h"
#import "FMCAppLinkV2ProtocolHeader.h"
#import "FMCAppLinkProtocolMessageDisassembler.h"
#import "FMCApplinkProtocolRecievedMessageRouter.h"


const NSUInteger MAX_TRANSMISSION_SIZE = 512;

@interface FMCAppLinkProtocol () {
    UInt32 _messageID;
}

@property (strong) NSMutableData *recieveBuffer;
@property (strong) FMCApplinkProtocolRecievedMessageRouter *messageRouter;

- (void)sendDataToTransport:(NSData *)data;

@end


@implementation FMCAppLinkProtocol

- (id)init {
	if (self = [super init]) {
        _messageID = 0;
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

// temp just for the debug printing below
void print(NSString *format, ...)
{
    va_list args;
    va_start (args, format);
    NSString *string;
    string = [[NSString alloc] initWithFormat: format  arguments: args];
    va_end (args);

    fprintf (stdout, "%s", [string UTF8String]);

}

- (void)sendDataToTransport:(NSData *)data {
    // Prints the bytes we send.
    if (true) {
        const int bytesPerLine = 16;
        print(@"Sending %i bytes:\n", data.length);

        UInt8 *p = (UInt8 *)data.bytes;
        for (int n = 0; n < data.length ; n++) {
            if (n%bytesPerLine == 0) {
                print(@"\n");
            }
            print(@"0x%02X, ", *p++);
        }
        print(@"\n");
    }

    [self.transport sendData:data];
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
    if (self.messageRouter == nil)
    {
        self.messageRouter = [[FMCApplinkProtocolRecievedMessageRouter alloc] init];
        self.messageRouter.delegate = self.delegate;
    }
    [self.messageRouter handleRecievedMessageAsynch:message];



}


@end
