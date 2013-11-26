//  FMCBitConverter.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCBitConverter.h>

@implementation FMCBitConverter

+(NSData*) intToByteArray:(UInt32) value {
	void* bufPtr = malloc(4);
	assert(bufPtr);
	NSData* ret = [NSData dataWithBytesNoCopy:bufPtr length:4];
	Byte* bytePtr = (Byte*)ret.bytes;
	bytePtr[0] = (Byte)(value >> 24);
	bytePtr[1] = (Byte)(value >> 16);
	bytePtr[2] = (Byte)(value >> 8);
	bytePtr[3] = (Byte)value;
	return ret;
}

+(UInt32) intFromByteArray:(Byte*) sizeBuf offset:(UInt32)offset {
	UInt32 ret = 0;
	for (UInt32 i = offset; i < offset + 4; i++) {
		ret <<= 8;
		ret |= 0xFF & sizeBuf[i];
	}
	return ret;
}

@end
