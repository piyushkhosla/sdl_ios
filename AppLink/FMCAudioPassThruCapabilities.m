//  FMCAudioPassThruCapabilities.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCAudioPassThruCapabilities.h>

#import <AppLink/FMCNames.h>

@implementation FMCAudioPassThruCapabilities

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setSamplingRate:(FMCSamplingRate*) samplingRate {
    if (samplingRate != nil) {
        [store setObject:samplingRate forKey:NAMES_samplingRate];
    } else {
        [store removeObjectForKey:NAMES_samplingRate];
    }
}

-(FMCSamplingRate*) samplingRate {
    NSObject* obj = [store objectForKey:NAMES_samplingRate];
    if ([obj isKindOfClass:FMCSamplingRate.class]) {
        return (FMCSamplingRate*)obj;
    } else {
        return [FMCSamplingRate valueOf:(NSString*)obj];
    }
}

-(void) setBitsPerSample:(FMCBitsPerSample*) bitsPerSample {
    if (bitsPerSample != nil) {
        [store setObject:bitsPerSample forKey:NAMES_bitsPerSample];
    } else {
        [store removeObjectForKey:NAMES_bitsPerSample];
    }
}

-(FMCBitsPerSample*) bitsPerSample {
    NSObject* obj = [store objectForKey:NAMES_bitsPerSample];
    if ([obj isKindOfClass:FMCBitsPerSample.class]) {
        return (FMCBitsPerSample*)obj;
    } else {
        return [FMCBitsPerSample valueOf:(NSString*)obj];
    }
}

-(void) setAudioType:(FMCAudioType*) audioType {
    if (audioType != nil) {
        [store setObject:audioType forKey:NAMES_audioType];
    } else {
        [store removeObjectForKey:NAMES_audioType];
    }
}

-(FMCAudioType*) audioType {
    NSObject* obj = [store objectForKey:NAMES_audioType];
    if ([obj isKindOfClass:FMCAudioType.class]) {
        return (FMCAudioType*)obj;
    } else {
        return [FMCAudioType valueOf:(NSString*)obj];
    }
}

@end
