//  FMCPerformAudioPassThru.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCPerformAudioPassThru.h>

#import <AppLink/FMCTTSChunk.h>
#import <AppLink/FMCNames.h>

@implementation FMCPerformAudioPassThru

-(id) init {
    if (self = [super initWithName:NAMES_PerformAudioPassThru]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setInitialPrompt:(NSMutableArray*) initialPrompt {
    if (initialPrompt != nil) {
        [parameters setObject:initialPrompt forKey:NAMES_initialPrompt];
    } else {
        [parameters removeObjectForKey:NAMES_initialPrompt];
    }
}

-(NSMutableArray*) initialPrompt {
    NSMutableArray* array = [parameters objectForKey:NAMES_initialPrompt];
    if ([array count] < 1 || [[array objectAtIndex:0] isKindOfClass:FMCTTSChunk.class]) {
        return array;
    } else {
        NSMutableArray* newList = [NSMutableArray arrayWithCapacity:[array count]];
        for (NSDictionary* dict in array) {
            [newList addObject:[[[FMCTTSChunk alloc] initWithDictionary:(NSMutableDictionary*)dict] autorelease]];
        }
        return newList;
    }
}

-(void) setAudioPassThruDisplayText1:(NSString*) audioPassThruDisplayText1 {
    if (audioPassThruDisplayText1 != nil) {
        [parameters setObject:audioPassThruDisplayText1 forKey:NAMES_audioPassThruDisplayText1];
    } else {
        [parameters removeObjectForKey:NAMES_audioPassThruDisplayText1];
    }
}

-(NSString*) audioPassThruDisplayText1 {
    return [parameters objectForKey:NAMES_audioPassThruDisplayText2];
}

-(void) setAudioPassThruDisplayText2:(NSString*) audioPassThruDisplayText2 {
    if (audioPassThruDisplayText2 != nil) {
        [parameters setObject:audioPassThruDisplayText2 forKey:NAMES_audioPassThruDisplayText2];
    } else {
        [parameters removeObjectForKey:NAMES_audioPassThruDisplayText2];
    }
}

-(NSString*) audioPassThruDisplayText2 {
    return [parameters objectForKey:NAMES_audioPassThruDisplayText2];
}

-(void) setSamplingRate:(FMCSamplingRate *)samplingRate {
    if (samplingRate != nil) {
        [parameters setObject:samplingRate forKey:NAMES_samplingRate];
    } else {
        [parameters removeObjectForKey:NAMES_samplingRate];
    }
}

-(FMCSamplingRate*) samplingRate {
    NSObject* obj = [parameters objectForKey:NAMES_samplingRate];
    if ([obj isKindOfClass:FMCBitsPerSample.class]) {
        return (FMCSamplingRate*)obj;
    } else {
        return [FMCSamplingRate valueOf:(NSString*)obj];
    }
}

-(void) setMaxDuration:(NSNumber*) maxDuration {
    if (maxDuration != nil) {
        [parameters setObject:maxDuration forKey:NAMES_maxDuration];
    } else {
        [parameters removeObjectForKey:NAMES_maxDuration];
    }
}

-(NSNumber*) maxDuration {
    return [parameters objectForKey:NAMES_maxDuration];
}

-(void) setBitsPerSample:(FMCBitsPerSample *) bitsPerSample {
    if (bitsPerSample != nil) {
        [parameters setObject:bitsPerSample forKey:NAMES_bitsPerSample];
    } else {
        [parameters removeObjectForKey:NAMES_bitsPerSample];
    }
}

-(FMCBitsPerSample*) bitsPerSample {
    NSObject* obj = [parameters objectForKey:NAMES_bitsPerSample];
    if ([obj isKindOfClass:FMCBitsPerSample.class]) {
        return (FMCBitsPerSample*)obj;
    } else { 
        return [FMCBitsPerSample valueOf:(NSString*)obj];
    }
}

-(void) setAudioType:(FMCAudioType *)audioType {
    if (audioType != nil) {
        [parameters setObject:audioType forKey:NAMES_audioType];
    } else {
        [parameters removeObjectForKey:NAMES_audioType];
    }
}

-(FMCAudioType*) audioType {
    NSObject* obj = [parameters objectForKey:NAMES_audioType];
    if ([obj isKindOfClass:FMCAudioType.class]) {
        return (FMCAudioType*)obj;
    } else {
        return [FMCAudioType valueOf:(NSString*)obj];
    }
}

-(void) setMuteAudio:(NSNumber*) muteAudio {
    if (muteAudio != nil) {
        [parameters setObject:muteAudio forKey:NAMES_muteAudio];
    } else {
        [parameters removeObjectForKey:NAMES_muteAudio];
    }
}

-(NSNumber*) muteAudio {
    return [parameters objectForKey:NAMES_muteAudio];
}



@end
