//  FMCPerformAudioPassThru.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/FMCSamplingRate.h>
#import <AppLink/FMCBitsPerSample.h>
#import <AppLink/FMCAudioType.h>

@interface FMCPerformAudioPassThru : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) NSMutableArray* initialPrompt;
@property(strong) NSString* audioPassThruDisplayText1;
@property(strong) NSString* audioPassThruDisplayText2;
@property(strong) FMCSamplingRate* samplingRate;
@property(strong) NSNumber* maxDuration;
@property(strong) FMCBitsPerSample* bitsPerSample;
@property(strong) FMCAudioType* audioType;
@property(strong) NSNumber* muteAudio;

@end
