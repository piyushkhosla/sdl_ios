//  FMCOnButtonPress.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCOnButtonPress.h>

#import <AppLink/FMCNames.h>

@implementation FMCOnButtonPress

-(id) init {
    if (self = [super initWithName:NAMES_OnButtonPress]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setButtonName:(FMCButtonName*) buttonName {
    if (buttonName != nil) {
        [parameters setObject:buttonName forKey:NAMES_buttonName];
    } else {
        [parameters removeObjectForKey:NAMES_buttonName];
    }
}

-(FMCButtonName*) buttonName {
    NSObject* obj = [parameters objectForKey:NAMES_buttonName];
    if ([obj isKindOfClass:FMCButtonName.class]) {
        return (FMCButtonName*)obj;
    } else {
        return [FMCButtonName valueOf:(NSString*)obj];
    }
}

-(void) setButtonPressMode:(FMCButtonPressMode*) buttonPressMode {
    if (buttonPressMode != nil) {
        [parameters setObject:buttonPressMode forKey:NAMES_buttonPressMode];
    } else {
        [parameters removeObjectForKey:NAMES_buttonPressMode];
    }
}

-(FMCButtonPressMode*) buttonPressMode {
    NSObject* obj = [parameters objectForKey:NAMES_buttonPressMode];
    if ([obj isKindOfClass:FMCButtonPressMode.class]) {
        return (FMCButtonPressMode*)obj;
    } else {
        return [FMCButtonPressMode valueOf:(NSString*)obj];
    }
}

-(void) setCustomButtonID:(NSNumber*) customButtonID {
    if (customButtonID != nil) {
        [parameters setObject:customButtonID forKey:NAMES_customButtonID];
    } else {
        [parameters removeObjectForKey:NAMES_customButtonID];
    }
}

-(NSNumber*) customButtonID {
    return [parameters objectForKey:NAMES_customButtonID];
}

@end
