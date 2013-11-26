//  FMCTTSChunk.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCTTSChunk.h>

#import <AppLink/FMCNames.h>

@implementation FMCTTSChunk

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

-(void) setType:(FMCSpeechCapabilities*) type {
    if (type != nil) {
        [store setObject:type forKey:NAMES_type];
    } else {
        [store removeObjectForKey:NAMES_type];
    }
}

-(FMCSpeechCapabilities*) type {
    NSObject* obj = [store objectForKey:NAMES_type];
    if ([obj isKindOfClass:FMCSpeechCapabilities.class]) {
        return (FMCSpeechCapabilities*)obj;
    } else { 
        return [FMCSpeechCapabilities valueOf:(NSString*)obj];
    }
}

@end
