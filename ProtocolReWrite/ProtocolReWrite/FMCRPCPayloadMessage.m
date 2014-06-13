//
//  FMCRPCPayloadMessage
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import "FMCRPCPayloadMessage.h"

@implementation FMCRPCPayloadMessage

-(id) init {
	if (self = [super init]) {

	}
	return self;
}

- (NSData *)data {
    // RPC Type - first 4 bits
    // RPC Function ID - next 28 bits
    // Correlation ID - next 32 bits
    // JSON size - next 32 bits
    UInt8 headerBuffer[12];
    *(UInt32 *)&headerBuffer[0] = CFSwapInt32HostToBig(self.functionID);
    *(UInt32 *)&headerBuffer[4] = CFSwapInt32HostToBig(self.correlationID);
    *(UInt32 *)&headerBuffer[8] = CFSwapInt32HostToBig(self.jsonSize);
    UInt8 rpcType = (self.rpcType & 0x0F) << 4;
    headerBuffer[0] &= 0x0F;
    headerBuffer[0] |= rpcType;

    NSMutableData *dataOut = [NSMutableData dataWithCapacity:[self size]];
    [dataOut appendBytes:&headerBuffer length:12];
    [dataOut appendData:self.payload];

    return dataOut;
}

- (NSUInteger)size {
    NSUInteger headerSize = 12;
    NSUInteger payloadSize = self.payload.length;
    return (headerSize + payloadSize);
}

@end
