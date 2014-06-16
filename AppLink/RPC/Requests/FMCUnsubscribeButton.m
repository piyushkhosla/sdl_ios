//  FMCUnsubscribeButton.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Requests/FMCUnsubscribeButton.h>

#import <AppLink/FMCNames.h>

@implementation FMCUnsubscribeButton

-(id) init {
    if (self = [super initWithName:NAMES_UnsubscribeButton]) {}
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
