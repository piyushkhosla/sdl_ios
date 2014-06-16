//  FMCDisplayCapabilities.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Structs/FMCDisplayCapabilities.h>

#import <AppLink/FMCNames.h>
#import <AppLink/RPC/Structs/FMCTextField.h>
#import <AppLink/RPC/Structs/FMCImageField.h>
#import <AppLink/RPC/Enums/FMCMediaClockFormat.h>

@implementation FMCDisplayCapabilities

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setDisplayType:(FMCDisplayType*) displayType {
    if (displayType != nil) {
        [store setObject:displayType forKey:NAMES_displayType];
    } else {
        [store removeObjectForKey:NAMES_displayType];
    }
}

-(FMCDisplayType*) displayType {
    NSObject* obj = [store objectForKey:NAMES_displayType];
    if ([obj isKindOfClass:FMCDisplayType.class]) {
        return (FMCDisplayType*)obj;
    } else {
        return [FMCDisplayType valueOf:(NSString*)obj];
    }
}

-(void) setTextFields:(NSMutableArray*) textFields {
    if (textFields != nil) {
        [store setObject:textFields forKey:NAMES_textFields];
    } else {
        [store removeObjectForKey:NAMES_textFields];
    }
}

-(NSMutableArray*) textFields {
    NSMutableArray* array = [store objectForKey:NAMES_textFields];
    if ([array count] < 1 || [[array objectAtIndex:0] isKindOfClass:FMCTextField.class]) {
        return array;
    } else {
        NSMutableArray* newList = [NSMutableArray arrayWithCapacity:[array count]];
        for (NSDictionary* dict in array) {
            [newList addObject:[[[FMCTextField alloc] initWithDictionary:(NSMutableDictionary*)dict] autorelease]];
        }
        return newList;
    }
}

-(void) setImageFields:(NSMutableArray*) imageFields {
    if (imageFields != nil) {
        [store setObject:imageFields forKey:NAMES_imageFields];
    } else {
        [store removeObjectForKey:NAMES_imageFields];
    }
}

-(NSMutableArray*) imageFields {
    NSMutableArray* array = [store objectForKey:NAMES_imageFields];
    if ([array count] < 1 || [[array objectAtIndex:0] isKindOfClass:FMCImageField.class]) {
        return array;
    } else {
        NSMutableArray* newList = [NSMutableArray arrayWithCapacity:[array count]];
        for (NSDictionary* dict in array) {
            [newList addObject:[[[FMCImageField alloc] initWithDictionary:(NSMutableDictionary*)dict] autorelease]];
        }
        return newList;
    }
}

-(void) setMediaClockFormats:(NSMutableArray*) mediaClockFormats {
    if (mediaClockFormats != nil) {
        [store setObject:mediaClockFormats forKey:NAMES_mediaClockFormats];
    } else {
        [store removeObjectForKey:NAMES_mediaClockFormats];
    }
}

-(NSMutableArray*) mediaClockFormats {
    NSMutableArray* array = [store objectForKey:NAMES_mediaClockFormats];
    if ([array count] < 1 || [[array objectAtIndex:0] isKindOfClass:FMCMediaClockFormat.class]) {
        return array;
    } else {
        NSMutableArray* newList = [NSMutableArray arrayWithCapacity:[array count]];
        for (NSString* enumString in array) {
            [newList addObject:[FMCMediaClockFormat valueOf:enumString]];
        }
        return newList;
    }
}

-(void) setGraphicSupported:(NSNumber*) graphicSupported {
    if (graphicSupported != nil) {
        [store setObject:graphicSupported forKey:NAMES_graphicSupported];
    } else {
        [store removeObjectForKey:NAMES_graphicSupported];
    }
}

-(NSNumber*) graphicSupported {
    return [store objectForKey:NAMES_graphicSupported];
}

-(void) setTemplatesAvailable:(NSMutableArray*) templatesAvailable {
    if (templatesAvailable != nil) {
        [store setObject:templatesAvailable forKey:NAMES_templatesAvailable];
    } else {
        [store removeObjectForKey:NAMES_templatesAvailable];
    }
}

-(NSMutableArray*) templatesAvailable {
    return [store objectForKey:NAMES_templatesAvailable];
}

-(void) setScreenParams:(FMCScreenParams*) screenParams {
    if (screenParams != nil) {
        [store setObject:screenParams forKey:NAMES_screenParams];
    } else {
        [store removeObjectForKey:NAMES_screenParams];
    }
}

-(FMCScreenParams*) screenParams {
    NSObject* obj = [store objectForKey:NAMES_screenParams];
    if ([obj isKindOfClass:FMCScreenParams.class]) {
        return (FMCScreenParams*)obj;
    } else {
        return [[[FMCScreenParams alloc] initWithDictionary:(NSMutableDictionary*)obj] autorelease];
    }
}

-(void) setNumCustomPresetsAvailable:(NSNumber*) numCustomPresetsAvailable {
    if (numCustomPresetsAvailable != nil) {
        [store setObject:numCustomPresetsAvailable forKey:NAMES_numCustomPresetsAvailable];
    } else {
        [store removeObjectForKey:NAMES_numCustomPresetsAvailable];
    }
}

-(NSNumber*) numCustomPresetsAvailable {
    return [store objectForKey:NAMES_numCustomPresetsAvailable];
}

@end
