//  FMCImageField.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCImageField.h>

#import <AppLink/FMCNames.h>
#import <AppLink/FMCFileType.h>

@implementation FMCImageField

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setName:(FMCImageFieldName*) name {
    if (name != nil) {
        [store setObject:name forKey:NAMES_name];
    } else {
        [store removeObjectForKey:NAMES_name];
    }
}

-(FMCImageFieldName*) name {
    NSObject* obj = [store objectForKey:NAMES_name];
    if ([obj isKindOfClass:FMCImageFieldName.class]) {
        return (FMCImageFieldName*)obj;
    } else {
        return [FMCImageFieldName valueOf:(NSString*)obj];
    }
}

-(void) setImageTypeSupported:(NSMutableArray*) imageTypeSupported {
    if (imageTypeSupported != nil) {
        [store setObject:imageTypeSupported forKey:NAMES_imageTypeSupported];
    } else {
        [store removeObjectForKey:NAMES_imageTypeSupported];
    }
}

-(NSMutableArray*) imageTypeSupported {
    NSMutableArray* array = [store objectForKey:NAMES_imageTypeSupported];
    if ([array count] < 1 || [[array objectAtIndex:0] isKindOfClass:FMCFileType.class]) {
        return array;
    } else {
        NSMutableArray* newList = [NSMutableArray arrayWithCapacity:[array count]];
        for (NSString* enumString in array) {
            [newList addObject:[FMCFileType valueOf:enumString]];
        }
        return newList;
    }
}

-(void) setImageResolution:(FMCImageResolution*) imageResolution {
    if (imageResolution != nil) {
        [store setObject:imageResolution forKey:NAMES_imageResolution];
    } else {
        [store removeObjectForKey:NAMES_imageResolution];
    }
}

-(FMCImageResolution*) imageResolution {
    NSObject* obj = [store objectForKey:NAMES_imageResolution];
    if ([obj isKindOfClass:FMCImageResolution.class]) {
        return (FMCImageResolution*)obj;
    } else {
        return [[[FMCImageResolution alloc] initWithDictionary:(NSMutableDictionary*)obj] autorelease];
    }
}

@end
