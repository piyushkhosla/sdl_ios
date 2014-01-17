//  FMCDeviceStatus.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCDeviceStatus.h>

#import <AppLink/FMCNames.h>

@implementation FMCDeviceStatus

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setVoiceRecOn:(NSNumber *) voiceRecOn {
    if (voiceRecOn != nil) {
        [store setObject:voiceRecOn forKey:NAMES_voiceRecOn];
    } else {
        [store removeObjectForKey:NAMES_voiceRecOn];
    }
}

-(NSNumber*) voiceRecOn {
    return [store objectForKey:NAMES_voiceRecOn];
}

-(void) setBtIconOn:(NSNumber *) btIconOn {
    if (btIconOn != nil) {
        [store setObject:btIconOn forKey:NAMES_btIconOn];
    } else {
        [store removeObjectForKey:NAMES_btIconOn];
    }
}

-(NSNumber*) btIconOn {
    return [store objectForKey:NAMES_btIconOn];
}

-(void) setCallActive:(NSNumber *) callActive {
    if (callActive != nil) {
        [store setObject:callActive forKey:NAMES_callActive];
    } else {
        [store removeObjectForKey:NAMES_callActive];
    }
}

-(NSNumber*) callActive {
    return [store objectForKey:NAMES_callActive];
}

-(void) setPhoneRoaming:(NSNumber *) phoneRoaming {
    if (phoneRoaming != nil) {
        [store setObject:phoneRoaming forKey:NAMES_phoneRoaming];
    } else {
        [store removeObjectForKey:NAMES_phoneRoaming];
    }
}

-(NSNumber*) phoneRoaming {
    return [store objectForKey:NAMES_phoneRoaming];
}

-(void) setTextMsgAvailable:(NSNumber *) textMsgAvailable {
    if (textMsgAvailable != nil) {
        [store setObject:textMsgAvailable forKey:NAMES_textMsgAvailable];
    } else {
        [store removeObjectForKey:NAMES_textMsgAvailable];
    }
}

-(NSNumber*) textMsgAvailable {
    return [store objectForKey:NAMES_textMsgAvailable];
}

-(void) setBattLevelStatus:(FMCDeviceLevelStatus*) battLevelStatus {
    if (battLevelStatus != nil) {
        [store setObject:battLevelStatus forKey:NAMES_battLevelStatus];
    } else {
        [store removeObjectForKey:NAMES_battLevelStatus];
    }
}

-(NSNumber*) battLevelStatus {
    return [store objectForKey:NAMES_battLevelStatus];
}

-(void) setStereoAudioOutputMuted:(NSNumber *) stereoAudioOutputMuted {
    if (stereoAudioOutputMuted != nil) {
        [store setObject:stereoAudioOutputMuted forKey:NAMES_stereoAudioOutputMuted];
    } else {
        [store removeObjectForKey:NAMES_stereoAudioOutputMuted];
    }
}

-(NSNumber*) stereoAudioOutputMuted {
    return [store objectForKey:NAMES_stereoAudioOutputMuted];
}

-(void) setMonoAudioOutputMuted:(NSNumber *) monoAudioOutputMuted {
    if (monoAudioOutputMuted != nil) {
        [store setObject:monoAudioOutputMuted forKey:NAMES_monoAudioOutputMuted];
    } else {
        [store removeObjectForKey:NAMES_monoAudioOutputMuted];
    }
}

-(NSNumber*) monoAudioOutputMuted {
    return [store objectForKey:NAMES_monoAudioOutputMuted];
}

-(void) setSignalLevelStatus:(FMCDeviceLevelStatus*) signalLevelStatus {
    if (signalLevelStatus != nil) {
        [store setObject:signalLevelStatus forKey:NAMES_signalLevelStatus];
    } else {
        [store removeObjectForKey:NAMES_signalLevelStatus];
    }
}

-(NSNumber*) signalLevelStatus {
    return [store objectForKey:NAMES_signalLevelStatus];
}

-(void) setPrimaryAudioSource:(FMCPrimaryAudioSource*) primaryAudioSource {
    if (primaryAudioSource != nil) {
        [store setObject:primaryAudioSource forKey:NAMES_primaryAudioSource];
    } else {
        [store removeObjectForKey:NAMES_primaryAudioSource];
    }
}

-(NSNumber*) primaryAudioSource {
    return [store objectForKey:NAMES_primaryAudioSource];
}

-(void) setECallEventActive:(NSNumber *) eCallEventActive {
    if (eCallEventActive != nil) {
        [store setObject:eCallEventActive forKey:NAMES_eCallEventActive];
    } else {
        [store removeObjectForKey:NAMES_eCallEventActive];
    }
}

-(NSNumber*) eCallEventActive {
    return [store objectForKey:NAMES_eCallEventActive];
}

@end
