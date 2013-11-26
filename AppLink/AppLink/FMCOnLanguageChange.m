//  FMCOnLanguageChange.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCOnLanguageChange.h>

#import <AppLink/FMCNames.h>

@implementation FMCOnLanguageChange

-(id) init {
    if (self = [super initWithName:NAMES_OnLanguageChange]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setLanguage:(FMCLanguage *) language {
    if (language != nil) {
        [parameters setObject:language forKey:NAMES_language];
    } else {
        [parameters removeObjectForKey:NAMES_language];
    }
}

-(FMCLanguage*) language {
    NSObject* obj = [parameters objectForKey:NAMES_language];
    if ([obj isKindOfClass:FMCLanguage.class]) {
        return (FMCLanguage*)obj;
    } else { 
        return [FMCLanguage valueOf:(NSString*)obj];
    }
}

-(void) setHmiDisplayLanguage:(FMCLanguage *) hmiDisplayLanguage {
    if (hmiDisplayLanguage != nil) {
        [parameters setObject:hmiDisplayLanguage forKey:NAMES_hmiDisplayLanguage];
    } else {
        [parameters removeObjectForKey:NAMES_hmiDisplayLanguage];
    }
}

-(FMCLanguage*) hmiDisplayLanguage {
    NSObject* obj = [parameters objectForKey:NAMES_hmiDisplayLanguage];
    if ([obj isKindOfClass:FMCLanguage.class]) {
        return (FMCLanguage*)obj;
    } else {
        return [FMCLanguage valueOf:(NSString*)obj];
    }
}

@end
