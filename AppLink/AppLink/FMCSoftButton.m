//  FMCSoftButton.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCSoftButton.h>

#import <AppLink/FMCNames.h>

@implementation FMCSoftButton

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setType:(FMCSoftButtonType*) type {
    if (type != nil) {
        [store setObject:type forKey:NAMES_type];
    } else {
        [store removeObjectForKey:NAMES_type];
    }
}

-(FMCSoftButtonType*) type {
    NSObject* obj = [store objectForKey:NAMES_type];
    if ([obj isKindOfClass:FMCSoftButtonType.class]) {
        return (FMCSoftButtonType*)obj;
    } else { 
        return [FMCSoftButtonType valueOf:(NSString*)obj];
    }
}

-(void) setText:(NSString *) text {
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

-(void) setIsHighlighted:(NSNumber *) isHighlighted {
    if (isHighlighted != nil) {
        [store setObject:isHighlighted forKey:NAMES_isHighlighted];
    } else {
        [store removeObjectForKey:NAMES_isHighlighted];
    }
}

-(NSNumber*) isHighlighted {
    return [store objectForKey:NAMES_isHighlighted];
}

-(void) setSoftButtonID:(NSNumber *) softButtonID {
    if (softButtonID != nil) {
        [store setObject:softButtonID forKey:NAMES_softButtonID];
    } else {
        [store removeObjectForKey:NAMES_softButtonID];
    }
}

-(NSNumber*) softButtonID {
    return [store objectForKey:NAMES_softButtonID];
}

-(void) setSystemAction:(FMCSystemAction*) systemAction {
    if (systemAction != nil) {
        [store setObject:systemAction forKey:NAMES_systemAction];
    } else {
        [store removeObjectForKey:NAMES_systemAction];
    }
}

-(FMCSystemAction*) systemAction {
    NSObject* obj = [store objectForKey:NAMES_systemAction];
    if ([obj isKindOfClass:FMCSystemAction.class]) {
        return (FMCSystemAction*)obj;
    } else {
        return [FMCSystemAction valueOf:(NSString*)obj];
    }
}

@end
