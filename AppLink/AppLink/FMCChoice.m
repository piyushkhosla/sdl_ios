//  FMCChoice.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCChoice.h>

#import <AppLink/FMCNames.h>

@implementation FMCChoice

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setChoiceID:(NSNumber*) choiceID {
    if (choiceID != nil) {
        [store setObject:choiceID forKey:NAMES_choiceID];
    } else {
        [store removeObjectForKey:NAMES_choiceID];
    }
}

-(NSNumber*) choiceID {
    return [store objectForKey:NAMES_choiceID];
}

-(void) setMenuName:(NSString*) menuName {
    if (menuName != nil) {
        [store setObject:menuName forKey:NAMES_menuName];
    } else {
        [store removeObjectForKey:NAMES_menuName];
    }
}

-(NSString*) menuName {
    return [store objectForKey:NAMES_menuName];
}

-(void) setVrCommands:(NSMutableArray*) vrCommands {
    if (vrCommands != nil) {
        [store setObject:vrCommands forKey:NAMES_vrCommands];
    } else {
        [store removeObjectForKey:NAMES_vrCommands];
    }
}

-(NSMutableArray*) vrCommands {
    return [store objectForKey:NAMES_vrCommands];
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

@end
