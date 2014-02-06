//  FMCShow.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCShow.h>

#import <AppLink/FMCNames.h>

@implementation FMCShow

-(id) init {
    if (self = [super initWithName:NAMES_Show]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setMainField1:(NSString*) mainField1 {
    if (mainField1 != nil) {
        [parameters setObject:mainField1 forKey:NAMES_mainField1];
    } else {
        [parameters removeObjectForKey:NAMES_mainField1];
    }
}

-(NSString*) mainField1 {
    return [parameters objectForKey:NAMES_mainField1];
}

-(void) setMainField2:(NSString*) mainField2 {
    if (mainField2 != nil) {
        [parameters setObject:mainField2 forKey:NAMES_mainField2];
    } else {
        [parameters removeObjectForKey:NAMES_mainField2];
    }
}

-(NSString*) mainField2 {
    return [parameters objectForKey:NAMES_mainField2];
}

-(void) setMainField3:(NSString*) mainField3 {
    if (mainField3 != nil) {
        [parameters setObject:mainField3 forKey:NAMES_mainField3];
    } else {
        [parameters removeObjectForKey:NAMES_mainField3];
    }
}

-(NSString*) mainField3 {
    return [parameters objectForKey:NAMES_mainField3];
}

-(void) setMainField4:(NSString*) mainField4 {
    if (mainField4 != nil) {
        [parameters setObject:mainField4 forKey:NAMES_mainField4];
    } else {
        [parameters removeObjectForKey:NAMES_mainField4];
    }
}

-(NSString*) mainField4 {
    return [parameters objectForKey:NAMES_mainField4];
}

-(void) setAlignment:(FMCTextAlignment*) alignment {
    if (alignment != nil) {
        [parameters setObject:alignment forKey:NAMES_alignment];
    } else {
        [parameters removeObjectForKey:NAMES_alignment];
    }
}

-(FMCTextAlignment*) alignment {
    NSObject* obj = [parameters objectForKey:NAMES_alignment];
    if ([obj isKindOfClass:FMCTextAlignment.class]) {
        return (FMCTextAlignment*)obj;
    } else { 
        return [FMCTextAlignment valueOf:(NSString*)obj];
    }
}

-(void) setStatusBar:(NSString*) statusBar {
    if (statusBar != nil) {
        [parameters setObject:statusBar forKey:NAMES_statusBar];
    } else {
        [parameters removeObjectForKey:NAMES_statusBar];
    }
}

-(NSString*) statusBar {
    return [parameters objectForKey:NAMES_statusBar];
}

-(void) setMediaClock:(NSString*) mediaClock {
    if (mediaClock != nil) {
        [parameters setObject:mediaClock forKey:NAMES_mediaClock];
    } else {
        [parameters removeObjectForKey:NAMES_mediaClock];
    }
}

-(NSString*) mediaClock {
    return [parameters objectForKey:NAMES_mediaClock];
}

-(void) setMediaTrack:(NSString*) mediaTrack {
    if (mediaTrack != nil) {
        [parameters setObject:mediaTrack forKey:NAMES_mediaTrack];
    } else {
        [parameters removeObjectForKey:NAMES_mediaTrack];
    }
}

-(NSString*) mediaTrack {
    return [parameters objectForKey:NAMES_mediaTrack];
}

-(void) setGraphic:(FMCImage*) graphic {
    if (graphic != nil) {
        [parameters setObject:graphic forKey:NAMES_graphic];
    } else {
        [parameters removeObjectForKey:NAMES_graphic];
    }
}

-(FMCImage*) graphic {
    NSObject* obj = [parameters objectForKey:NAMES_graphic];
    if ([obj isKindOfClass:FMCImage.class]) {
        return (FMCImage*)obj;
    } else {
        return [[[FMCImage alloc] initWithDictionary:(NSMutableDictionary*)obj] autorelease];
    }
}

-(void) setSoftButtons:(NSMutableArray *) softButtons {
    if (softButtons != nil) {
        [parameters setObject:softButtons forKey:NAMES_softButtons];
    } else {
        [parameters removeObjectForKey:NAMES_softButtons];
    }
}

-(NSMutableArray*) softButtons {
    NSMutableArray* array = [parameters objectForKey:NAMES_softButtons];
    if ([array count] < 1 || [[array objectAtIndex:0] isKindOfClass:FMCSoftButton.class]) {
        return array;
    } else {
        NSMutableArray* newList = [NSMutableArray arrayWithCapacity:[array count]];
        for (NSDictionary* dict in array) {
            [newList addObject:[[[FMCSoftButton alloc] initWithDictionary:(NSMutableDictionary*)dict] autorelease]];
        }
        return newList;
    }
}

-(void) setCustomPresets:(NSMutableArray*) customPresets {
    if (customPresets != nil) {
        [parameters setObject:customPresets forKey:NAMES_customPresets];
    } else {
        [parameters removeObjectForKey:NAMES_customPresets];
    }
}

-(NSMutableArray*) customPresets {
    return [parameters objectForKey:NAMES_customPresets];
}

@end
