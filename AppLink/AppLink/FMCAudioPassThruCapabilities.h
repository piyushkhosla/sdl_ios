//  FMCAudioPassThruCapabilities.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCSamplingRate.h>
#import <AppLink/FMCBitsPerSample.h>
#import <AppLink/FMCAudioType.h>

@interface FMCAudioPassThruCapabilities : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) FMCSamplingRate* samplingRate;
@property(strong) FMCBitsPerSample* bitsPerSample;
@property(strong) FMCAudioType* audioType;

@end
