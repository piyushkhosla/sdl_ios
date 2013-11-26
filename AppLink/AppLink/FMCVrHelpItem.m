//  FMCVrHelpItem.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCVrHelpItem.h>

#import <AppLink/FMCNames.h>

@implementation FMCVrHelpItem

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setText:(NSString*) text {
    if (text != nil) {
        [store setObject:text forKey:NAMES_text];
    } else {
        [store removeObjectForKey:NAMES_text];
    }
}

-(NSString*) text {
    return [store objectForKey:NAMES_text];
}

-(void) setImage:(FMCImage*) image {
    if (image != nil) {
        [store setObject:image forKey:NAMES_image];
    } else {
        [store removeObjectForKey:NAMES_image];
    }
}

-(FMCImage*) image {
    NSObject* obj = [store objectForKey:NAMES_image];
    if ([obj isKindOfClass:FMCImage.class]) {
        return (FMCImage*)obj;
    } else {
        return [[[FMCImage alloc] initWithDictionary:(NSMutableDictionary*)obj] autorelease];
    }
}

-(void) setPosition:(NSNumber*) position {
    if (position != nil) {
        [store setObject:position forKey:NAMES_position];
    } else {
        [store removeObjectForKey:NAMES_position];
    }
}

-(NSNumber*) position {
    return [store objectForKey:NAMES_position];
}

@end
