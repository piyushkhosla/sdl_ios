//  FMCSubscribeButton.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCSubscribeButton.h>

#import <AppLink/FMCNames.h>

@implementation FMCSubscribeButton

-(id) init {
    if (self = [super initWithName:NAMES_SubscribeButton]) {}
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

@end
