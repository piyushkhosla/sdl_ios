//  FMCPutFile.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCPutFile.h>

#import <AppLink/FMCNames.h>

@implementation FMCPutFile

-(id) init {
    if (self = [super initWithName:NAMES_PutFile]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setSyncFileName:(NSString *) syncFileName {
    if (syncFileName != nil) {
        [parameters setObject:syncFileName forKey:NAMES_syncFileName];
    } else {
        [parameters removeObjectForKey:NAMES_syncFileName];
    }
}

-(NSString*) syncFileName {
    return [parameters objectForKey:NAMES_syncFileName];
}

-(void) setFileType:(FMCFileType *) fileType {
    if (fileType != nil) {
        [parameters setObject:fileType forKey:NAMES_fileType];
    } else {
        [parameters removeObjectForKey:NAMES_fileType];
    }
}

-(FMCFileType*) fileType {
    NSObject* obj = [parameters objectForKey:NAMES_fileType];
    if ([obj isKindOfClass:FMCFileType.class]) {
        return (FMCFileType*)obj;
    } else {
        return [FMCFileType valueOf:(NSString*)obj];
    }
}

-(void) setPersistentFile:(NSNumber *) persistentFile {
    if (persistentFile != nil) {
        [parameters setObject:persistentFile forKey:NAMES_persistentFile];
    } else {
        [parameters removeObjectForKey:NAMES_persistentFile];
    }
}

-(NSNumber*) persistentFile {
    return [parameters objectForKey:NAMES_persistentFile];
}


@end
