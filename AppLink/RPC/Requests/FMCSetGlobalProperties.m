//  FMCSetGlobalProperties.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Requests/FMCSetGlobalProperties.h>

#import <AppLink/FMCNames.h>
#import <AppLink/RPC/Structs/FMCTTSChunk.h>
#import <AppLink/RPC/Structs/FMCVrHelpItem.h>

@implementation FMCSetGlobalProperties

-(id) init {
    if (self = [super initWithName:NAMES_SetGlobalProperties]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setHelpPrompt:(NSMutableArray*) helpPrompt {
    if (helpPrompt != nil) {
        [parameters setObject:helpPrompt forKey:NAMES_helpPrompt];
    } else {
        [parameters removeObjectForKey:NAMES_helpPrompt];
    }
}

-(NSMutableArray*) helpPrompt {
    NSMutableArray* array = [parameters objectForKey:NAMES_helpPrompt];
    if ([array count] < 1 || [[array objectAtIndex:0] isKindOfClass:FMCTTSChunk.class]) {
        return array;
    } else {
        NSMutableArray* newList = [NSMutableArray arrayWithCapacity:[array count]];
        for (NSDictionary* dict in array) {
            [newList addObject:[[[FMCTTSChunk alloc] initWithDictionary:(NSMutableDictionary*)dict] autorelease]];
        }
        return newList;
    }
}

-(void) setTimeoutPrompt:(NSMutableArray*) timeoutPrompt {
    if (timeoutPrompt != nil) {
        [parameters setObject:timeoutPrompt forKey:NAMES_timeoutPrompt];
    } else {
        [parameters removeObjectForKey:NAMES_timeoutPrompt];
    }
}

-(NSMutableArray*) timeoutPrompt {
    NSMutableArray* array = [parameters objectForKey:NAMES_timeoutPrompt];
    if ([array count] < 1 || [[array objectAtIndex:0] isKindOfClass:FMCTTSChunk.class]) {
        return array;
    } else {
        NSMutableArray* newList = [NSMutableArray arrayWithCapacity:[array count]];
        for (NSDictionary* dict in array) {
            [newList addObject:[[[FMCTTSChunk alloc] initWithDictionary:(NSMutableDictionary*)dict] autorelease]];
        }
        return newList;
    }
}

-(void) setVrHelpTitle:(NSString*) vrHelpTitle {
    if (vrHelpTitle != nil) {
        [parameters setObject:vrHelpTitle forKey:NAMES_vrHelpTitle];
    } else {
        [parameters removeObjectForKey:NAMES_vrHelpTitle];
    }
}

-(NSString*) vrHelpTitle {
    return [parameters objectForKey:NAMES_vrHelpTitle];
}

-(void) setVrHelp:(NSMutableArray*) vrHelp {
    if (vrHelp != nil) {
        [parameters setObject:vrHelp forKey:NAMES_vrHelp];
    } else {
        [parameters removeObjectForKey:NAMES_vrHelp];
    }
}

-(NSMutableArray*) vrHelp {
    NSMutableArray* array = [parameters objectForKey:NAMES_vrHelp];
    if ([array count] < 1 || [[array objectAtIndex:0] isKindOfClass:FMCVrHelpItem.class]) {
        return array;
    } else {
        NSMutableArray* newList = [NSMutableArray arrayWithCapacity:[array count]];
        for (NSDictionary* dict in array) {
            [newList addObject:[[[FMCVrHelpItem alloc] initWithDictionary:(NSMutableDictionary*)dict] autorelease]];
        }
        return newList;
    }
}

-(void) setMenuTitle:(NSString*) menuTitle {
    if (menuTitle != nil) {
        [parameters setObject:menuTitle forKey:NAMES_menuTitle];
    } else {
        [parameters removeObjectForKey:NAMES_menuTitle];
    }
}

-(NSString*) menuTitle {
    return [parameters objectForKey:NAMES_menuTitle];
}

-(void) setMenuIcon:(FMCImage*) menuIcon {
    if (menuIcon != nil) {
        [parameters setObject:menuIcon forKey:NAMES_menuIcon];
    } else {
        [parameters removeObjectForKey:NAMES_menuIcon];
    }
}

-(FMCImage*) menuIcon {
    NSObject* obj = [parameters objectForKey:NAMES_menuIcon];
    if ([obj isKindOfClass:FMCImage.class]) {
        return (FMCImage*)obj;
    } else {
        return [[[FMCImage alloc] initWithDictionary:(NSMutableDictionary*)obj] autorelease];
    }
}

-(void) setKeyboardProperties:(FMCKeyboardProperties*) keyboardProperties {
    if (keyboardProperties != nil) {
        [parameters setObject:keyboardProperties forKey:NAMES_keyboardProperties];
    } else {
        [parameters removeObjectForKey:NAMES_keyboardProperties];
    }
}

-(FMCKeyboardProperties*) keyboardProperties {
    NSObject* obj = [parameters objectForKey:NAMES_keyboardProperties];
    if ([obj isKindOfClass:FMCKeyboardProperties.class]) {
        return (FMCKeyboardProperties*)obj;
    } else {
        return [[[FMCKeyboardProperties alloc] initWithDictionary:(NSMutableDictionary*)obj] autorelease];
    }
}

@end
