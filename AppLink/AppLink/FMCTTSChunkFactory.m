//  FMCTTSChunkFactory.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCTTSChunkFactory.h>

@implementation FMCTTSChunkFactory

+ (FMCTTSChunk *)buildTTSChunkForString:(NSString *)text type:(FMCSpeechCapabilities *)type {
	FMCTTSChunk *ret = [[FMCTTSChunk alloc] init];
	ret.text = text;
	ret.type = type;
	
	return ret;
}

+ (NSMutableArray *)buildTTSChunksFromSimple:(NSString *)simple {
	if (simple == nil)
        return nil;
    
	return [NSMutableArray arrayWithObject:[FMCTTSChunkFactory buildTTSChunkForString:simple type:[FMCSpeechCapabilities TEXT]]];
}

@end
