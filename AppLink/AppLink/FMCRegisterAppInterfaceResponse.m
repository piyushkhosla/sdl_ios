//  FMCRegisterAppInterfaceResponse.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCRegisterAppInterfaceResponse.h>

#import <AppLink/FMCAudioPassThruCapabilities.h>
#import <AppLink/FMCButtonCapabilities.h>
#import <AppLink/FMCHMIZoneCapabilities.h>
#import <AppLink/FMCNames.h>
#import <AppLink/FMCSpeechCapabilities.h>
#import <AppLink/FMCSoftButtonCapabilities.h>
#import <AppLink/FMCVrCapabilities.h>

@implementation FMCRegisterAppInterfaceResponse

-(id) init {
    if (self = [super initWithName:NAMES_RegisterAppInterface]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setSyncMsgVersion:(FMCSyncMsgVersion*) syncMsgVersion {
    if (syncMsgVersion != nil) {
        [parameters setObject:syncMsgVersion forKey:NAMES_syncMsgVersion];
    } else {
        [parameters removeObjectForKey:NAMES_syncMsgVersion];
    }
}

-(FMCSyncMsgVersion*) syncMsgVersion {
    NSObject* obj = [parameters objectForKey:NAMES_syncMsgVersion];
    if ([obj isKindOfClass:FMCSyncMsgVersion.class]) {
        return (FMCSyncMsgVersion*)obj;
    } else {
        return [[[FMCSyncMsgVersion alloc] initWithDictionary:(NSMutableDictionary*)obj] autorelease];
    }
}

-(void) setLanguage:(FMCLanguage*) language {
    if (language != nil) {
        [parameters setObject:language forKey:NAMES_language];
    } else {
        [parameters removeObjectForKey:NAMES_language];
    }
}

-(FMCLanguage*) language {
    NSObject* obj = [parameters objectForKey:NAMES_language];
    if ([obj isKindOfClass:FMCLanguage.class]) {
        return (FMCLanguage*)obj;
    } else {
        return [FMCLanguage valueOf:(NSString*)obj];
    }
}

-(void) setHmiDisplayLanguage:(FMCLanguage*) hmiDisplayLanguage {
    if (hmiDisplayLanguage != nil) {
        [parameters setObject:hmiDisplayLanguage forKey:NAMES_hmiDisplayLanguage];
    } else {
        [parameters removeObjectForKey:NAMES_hmiDisplayLanguage];
    }
}

-(FMCLanguage*) hmiDisplayLanguage {
    NSObject* obj = [parameters objectForKey:NAMES_hmiDisplayLanguage];
    if ([obj isKindOfClass:FMCLanguage.class]) {
        return (FMCLanguage*)obj;
    } else {
        return [FMCLanguage valueOf:(NSString*)obj];
    }
}

-(void) setDisplayCapabilities:(FMCDisplayCapabilities*) displayCapabilities {
    if (displayCapabilities != nil) {
        [parameters setObject:displayCapabilities forKey:NAMES_displayCapabilities];
    } else {
        [parameters removeObjectForKey:NAMES_displayCapabilities];
    }
}

-(FMCDisplayCapabilities*) displayCapabilities {
    NSObject* obj = [parameters objectForKey:NAMES_displayCapabilities];
    if ([obj isKindOfClass:FMCDisplayCapabilities.class]) {
        return (FMCDisplayCapabilities*)obj;
    } else {
        return [[[FMCDisplayCapabilities alloc] initWithDictionary:(NSMutableDictionary*)obj] autorelease];
    }
}

-(void) setButtonCapabilities:(NSMutableArray*) buttonCapabilities {
    if (buttonCapabilities != nil) {
        [parameters setObject:buttonCapabilities forKey:NAMES_buttonCapabilities];
    } else {
        [parameters removeObjectForKey:NAMES_buttonCapabilities];
    }
}

-(NSMutableArray*) buttonCapabilities {
    NSMutableArray* array = [parameters objectForKey:NAMES_buttonCapabilities];
    if ([array count] < 1 || [[array objectAtIndex:0] isKindOfClass:FMCButtonCapabilities.class]) {
        return array;
    } else {
        NSMutableArray* newList = [NSMutableArray arrayWithCapacity:[array count]];
        for (NSDictionary* dict in array) {
            [newList addObject:[[[FMCButtonCapabilities alloc] initWithDictionary:(NSMutableDictionary*)dict] autorelease]];
        }
        return newList;
    }
}

-(void) setSoftButtonCapabilities:(NSMutableArray*) softButtonCapabilities {
    if (softButtonCapabilities != nil) {
        [parameters setObject:softButtonCapabilities forKey:NAMES_softButtonCapabilities];
    } else {
        [parameters removeObjectForKey:NAMES_softButtonCapabilities];
    }
}

-(NSMutableArray*) softButtonCapabilities {
    NSMutableArray* array = [parameters objectForKey:NAMES_softButtonCapabilities];
    if ([array count] < 1 || [[array objectAtIndex:0] isKindOfClass:FMCSoftButtonCapabilities.class]) {
        return array;
    } else {
        NSMutableArray* newList = [NSMutableArray arrayWithCapacity:[array count]];
        for (NSDictionary* dict in array) {
            [newList addObject:[[[FMCSoftButtonCapabilities alloc] initWithDictionary:(NSMutableDictionary*)dict] autorelease]];
        }
        return newList;
    }
}

-(void) setPresetBankCapabilities:(FMCPresetBankCapabilities*) presetBankCapabilities {
    if (presetBankCapabilities != nil) {
        [parameters setObject:presetBankCapabilities forKey:NAMES_presetBankCapabilities];
    } else {
        [parameters removeObjectForKey:NAMES_presetBankCapabilities];
    }
}

-(FMCPresetBankCapabilities*) presetBankCapabilities {
    NSObject* obj = [parameters objectForKey:NAMES_presetBankCapabilities];
    if ([obj isKindOfClass:FMCPresetBankCapabilities.class]) {
        return (FMCPresetBankCapabilities*)obj;
    } else {
        return [[[FMCPresetBankCapabilities alloc] initWithDictionary:(NSMutableDictionary*)obj] autorelease];
    }
}

-(void) setHmiZoneCapabilities:(NSMutableArray*) hmiZoneCapabilities {
    if (hmiZoneCapabilities != nil) {
        [parameters setObject:hmiZoneCapabilities forKey:NAMES_hmiZoneCapabilities];
    } else {
        [parameters removeObjectForKey:NAMES_hmiZoneCapabilities];
    }
}

-(NSMutableArray*) hmiZoneCapabilities {
    NSMutableArray* array = [parameters objectForKey:NAMES_hmiZoneCapabilities];
    if ([array count] < 1 || [[array objectAtIndex:0] isKindOfClass:FMCHMIZoneCapabilities.class]) {
        return array;
    } else {
        NSMutableArray* newList = [NSMutableArray arrayWithCapacity:[array count]];
        for (NSString* enumString in array) {
            [newList addObject:[FMCHMIZoneCapabilities valueOf:enumString]];
        }
        return newList;
    }
}

-(void) setSpeechCapabilities:(NSMutableArray*) speechCapabilities {
    if (speechCapabilities != nil) {
        [parameters setObject:speechCapabilities forKey:NAMES_speechCapabilities];
    } else {
        [parameters removeObjectForKey:NAMES_speechCapabilities];
    }
}

-(NSMutableArray*) speechCapabilities {
    NSMutableArray* array = [parameters objectForKey:NAMES_speechCapabilities];
    if ([array count] < 1 || [[array objectAtIndex:0] isKindOfClass:FMCSpeechCapabilities.class]) {
        return array;
    } else {
        NSMutableArray* newList = [NSMutableArray arrayWithCapacity:[array count]];
        for (NSString* enumString in array) {
            [newList addObject:[FMCSpeechCapabilities valueOf:enumString]];
        }
        return newList;
    }
}

-(void) setVrCapabilities:(NSMutableArray*) vrCapabilities {
    if (vrCapabilities != nil) {
        [parameters setObject:vrCapabilities forKey:NAMES_vrCapabilities];
    } else {
        [parameters removeObjectForKey:NAMES_vrCapabilities];
    }
}

-(NSMutableArray*) vrCapabilities {
    NSMutableArray* array = [parameters objectForKey:NAMES_vrCapabilities];
    if ([array count] < 1 || [[array objectAtIndex:0] isKindOfClass:FMCVrCapabilities.class]) {
        return array;
    } else {
        NSMutableArray* newList = [NSMutableArray arrayWithCapacity:[array count]];
        for (NSString* enumString in array) {
            [newList addObject:[FMCVrCapabilities valueOf:enumString]];
        }
        return newList;
    }
}

-(void) setAudioPassThruCapabilities:(NSMutableArray*) audioPassThruCapabilities {
    if (audioPassThruCapabilities != nil) {
        [parameters setObject:audioPassThruCapabilities forKey:NAMES_audioPassThruCapabilities];
    } else {
        [parameters removeObjectForKey:NAMES_audioPassThruCapabilities];
    }
}

-(NSMutableArray*) audioPassThruCapabilities {
    NSMutableArray* array = [parameters objectForKey:NAMES_audioPassThruCapabilities];
    if ([array count] < 1 || [[array objectAtIndex:0] isKindOfClass:FMCAudioPassThruCapabilities.class]) {
        return array;
    } else {
        NSMutableArray* newList = [NSMutableArray arrayWithCapacity:[array count]];
        for (NSDictionary* dict in array) {
            [newList addObject:[[[FMCAudioPassThruCapabilities alloc] initWithDictionary:(NSMutableDictionary*)dict] autorelease]];
        }
        return newList;
    }
}

-(void) setVehicleType:(FMCVehicleType*) vehicleType {
    if (vehicleType != nil) {
        [parameters setObject:vehicleType forKey:NAMES_vehicleType];
    } else {
        [parameters removeObjectForKey:NAMES_vehicleType];
    }
}

-(FMCVehicleType*) vehicleType {
    NSObject* obj = [parameters objectForKey:NAMES_vehicleType];
    if ([obj isKindOfClass:FMCVehicleType.class]) {
        return (FMCVehicleType*)obj;
    } else {
        return [[[FMCVehicleType alloc] initWithDictionary:(NSMutableDictionary*)obj] autorelease];
    }
}

@end
