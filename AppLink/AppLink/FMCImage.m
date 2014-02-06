//  FMCImage.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCImage.h>

#import <AppLink/FMCNames.h>

@implementation FMCImage

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setValue:(NSString*) value {
    if (value != nil) {
        [store setObject:value forKey:NAMES_value];
    } else {
        [store removeObjectForKey:NAMES_value];
    }
}

-(NSString*) value {
    return [store objectForKey:NAMES_value];
}

-(void) setImageType:(FMCImageType*) imageType {
    if (imageType != nil) {
        [store setObject:imageType forKey:NAMES_imageType];
    } else {
        [store removeObjectForKey:NAMES_imageType];
    }
}

-(FMCImageType*) imageType {
    NSObject* obj = [store objectForKey:NAMES_imageType];
    if ([obj isKindOfClass:FMCImageType.class]) {
        return (FMCImageType*)obj;
    } else { 
        return [FMCImageType valueOf:(NSString*)obj];
    }
}

@end
