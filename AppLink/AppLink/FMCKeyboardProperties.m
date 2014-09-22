//  FMCKeyboardProperties.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCKeyboardProperties.h>

#import <AppLink/FMCNames.h>

@implementation FMCKeyboardProperties

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setLanguage:(FMCLanguage*) language {
    if (language != nil) {
        [store setObject:language forKey:NAMES_language];
    } else {
        [store removeObjectForKey:NAMES_language];
    }
}

-(FMCLanguage*) language {
    NSObject* obj = [store objectForKey:NAMES_language];
    if ([obj isKindOfClass:FMCLanguage.class]) {
        return (FMCLanguage*)obj;
    } else {
        return [FMCLanguage valueOf:(NSString*)obj];
    }
}

-(void) setKeyboardLayout:(FMCKeyboardLayout*) keyboardLayout {
    if (keyboardLayout != nil) {
        [store setObject:keyboardLayout forKey:NAMES_keyboardLayout];
    } else {
        [store removeObjectForKey:NAMES_keyboardLayout];
    }
}

-(FMCKeyboardLayout*) keyboardLayout {
    NSObject* obj = [store objectForKey:NAMES_keyboardLayout];
    if ([obj isKindOfClass:FMCKeyboardLayout.class]) {
        return (FMCKeyboardLayout*)obj;
    } else {
        return [FMCKeyboardLayout valueOf:(NSString*)obj];
    }
}

-(void) setKeypressMode:(FMCKeypressMode*) keypressMode {
    if (keypressMode != nil) {
        [store setObject:keypressMode forKey:NAMES_keypressMode];
    } else {
        [store removeObjectForKey:NAMES_keypressMode];
    }
}

-(FMCKeypressMode*) keypressMode {
    NSObject* obj = [store objectForKey:NAMES_keypressMode];
    if ([obj isKindOfClass:FMCKeypressMode.class]) {
        return (FMCKeypressMode*)obj;
    } else {
        return [FMCKeypressMode valueOf:(NSString*)obj];
    }
}

-(void) setLimitedCharacterList:(NSMutableArray*) limitedCharacterList {
    if (limitedCharacterList != nil) {
        [store setObject:limitedCharacterList forKey:NAMES_limitedCharacterList];
    } else {
        [store removeObjectForKey:NAMES_limitedCharacterList];
    }
}

-(NSMutableArray*) limitedCharacterList {
    return [store objectForKey:NAMES_limitedCharacterList];
}

-(void) setAutoCompleteText:(NSString*) autoCompleteText {
    if (autoCompleteText != nil) {
        [store setObject:autoCompleteText forKey:NAMES_autoCompleteText];
    } else {
        [store removeObjectForKey:NAMES_autoCompleteText];
    }
}

-(NSString*) autoCompleteText {
    return [store objectForKey:NAMES_autoCompleteText];
}

@end
