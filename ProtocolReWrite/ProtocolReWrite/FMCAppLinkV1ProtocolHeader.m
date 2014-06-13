//
//  NewFMCAppLinkV1ProtocolHeader.m
//  ProtocolReWrite
//

#import "FMCAppLinkV1ProtocolHeader.h"


@implementation FMCAppLinkV1ProtocolHeader

- (id)init {
	if (self = [super init]) {
        _version = 1;
        _size = 8;
	}
	return self;
}

- (NSData *)data {
    // Assembles the properties in the binary header format
    const UInt8 V1_HEADER_SIZE = 8;
    Byte headerBytes[V1_HEADER_SIZE] = {0};

    Byte version = (self.version & 0xF) << 4; // first 4 bits
    Byte compressed = self.compressed?1:0 << 3; // next 1 bit
    Byte frameType = (self.frameType & 0x7); // last 3 bits

    headerBytes[0] = version | compressed | frameType;
    headerBytes[1] = self.serviceType;
    headerBytes[2] = self.frameData;
    headerBytes[3] = self.sessionID;

    // Need to write the larger ints as big-endian.
    UInt32 *p = (UInt32 *)&headerBytes[4];
    *p = CFSwapInt32HostToBig(self.bytesInPayload); // swap the byte order

    // Now put it all in an NSData object.
    NSData *dataOut = [NSData dataWithBytes:headerBytes length:V1_HEADER_SIZE];
    
    return dataOut;
}

- (id)copyWithZone:(NSZone *)zone
{
    FMCAppLinkV1ProtocolHeader *newHeader = [[FMCAppLinkV1ProtocolHeader allocWithZone: zone] init];
    newHeader.compressed = self.compressed;
    newHeader.frameType = self.frameType;
    newHeader.serviceType = self.serviceType;
    newHeader.frameData = self.frameData;
    newHeader.compressed = self.compressed;
    newHeader.sessionID = self.sessionID;

    return newHeader;
}

- (void)parse:(NSData *)data {
    NSAssert(data.length >= _size, @"Error: insufficient data available to parse V1 header.");

    Byte *bytePointer = (Byte *)data.bytes;
    Byte firstByte = bytePointer[0];
    self.compressed = ((firstByte & 8) != 0);
    self.frameType = (firstByte & 7);
    self.serviceType = bytePointer[1];
    self.frameData = bytePointer[2];
    self.sessionID = bytePointer[3];

    UInt32 *uintPointer = (UInt32 *)data.bytes;
    self.bytesInPayload = CFSwapInt32BigToHost(uintPointer[1]); // Data is coming in in big-endian, so swap it.
}

@end
