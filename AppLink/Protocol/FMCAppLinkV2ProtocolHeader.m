//
//  NewFMCAppLinkV2ProtocolHeader.m
//  ProtocolReWrite
//

#import "FMCAppLinkV2ProtocolHeader.h"

const int V2APPLINK_HEADERSIZE = 12;

@implementation FMCAppLinkV2ProtocolHeader

- (id)init {
	if (self = [super init]) {
        _version = 2;
        _size = 12;
	}
	return self;
}

- (NSData *)data {
    // Assembles the properties in the binary header format
    const UInt8 V2_HEADER_SIZE = 8;
    Byte headerBytes[V2_HEADER_SIZE] = {0};

    Byte version = (self.version & 0xF) << 4; // first 4 bits
    Byte compressed = self.compressed?1:0 << 3; // next 1 bit
    Byte frameType = (self.frameType & 0x7); // last 3 bits

    headerBytes[0] = version | compressed | frameType;
    headerBytes[1] = self.serviceType;
    headerBytes[2] = self.frameData;
    headerBytes[3] = self.sessionID;

//FIXME: Causing SIGABRT
    // Need to write these ints as big-endian.
    UInt32 *p = (UInt32 *)&headerBytes[4];
    *p = CFSwapInt32HostToBig(self.bytesInPayload);

    p = (UInt32 *)&headerBytes[8];
    *p = CFSwapInt32HostToBig(self.messageID);

    // Now put it all in an NSData object.
    NSData *dataOut = [NSData dataWithBytes:headerBytes length:V2APPLINK_HEADERSIZE];

    return dataOut;
}

- (id)copyWithZone:(NSZone *)zone
{
    FMCAppLinkV2ProtocolHeader *newHeader = [[FMCAppLinkV2ProtocolHeader allocWithZone: zone] init];
    newHeader.compressed = self.compressed;
    newHeader.frameType = self.frameType;
    newHeader.serviceType = self.serviceType;
    newHeader.frameData = self.frameData;
    newHeader.compressed = self.compressed;
    newHeader.sessionID = self.sessionID;
    newHeader.messageID = self.messageID;

    return newHeader;
}

- (void)parse:(NSData *)data {
    NSAssert(data.length >= _size, @"Error: insufficient data available to parse V2 header.");

    Byte *bytePointer = (Byte *)data.bytes;
    Byte firstByte = bytePointer[0];
    self.compressed = ((firstByte & 8) != 0);
    self.frameType = (firstByte & 7);
    self.serviceType = bytePointer[1];
    self.frameData = bytePointer[2];
    self.sessionID = bytePointer[3];

    UInt32 *uintPointer = (UInt32 *)data.bytes;
    self.bytesInPayload = CFSwapInt32BigToHost(uintPointer[1]); // Data is coming in in big-endian, so swap it.
    self.messageID = CFSwapInt32BigToHost(uintPointer[2]);             // Data is coming in in big-endian, so swap it.
}

@end
