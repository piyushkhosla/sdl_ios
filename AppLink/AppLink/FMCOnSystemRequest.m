//  FMCOnVehicleData.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCOnSystemRequest.h>
#import <AppLink/FMCNames.h>

@implementation FMCOnSystemRequest

-(id) init {
    if (self = [super initWithName:NAMES_OnSystemRequest]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

- (void)setRequestType:(FMCRequestType*)requestType
{
    if (requestType)
    {
        [parameters setObject:requestType forKey:NAMES_requestType];
    }
    else
    {
        [parameters removeObjectForKey:NAMES_requestType];
    }
}

- (FMCRequestType*)requestType
{
    NSObject* obj = [parameters objectForKey:NAMES_requestType];
    if ([obj isKindOfClass:FMCRequestType.class])
    {
        return (FMCRequestType*)obj;
    }
    else
    {
        return [FMCRequestType valueOf:(NSString*)obj];
    }
}

- (void)setUrl:(NSString *)url
{
    if (url) {
        [parameters setObject:url forKey:@"url"];
    } else {
        [parameters removeObjectForKey:@"url"];
    }
}

- (NSString*)url
{
    return [parameters objectForKey:@"url"];
}

- (void)setFileType:(FMCFileType*)fileType
{
    if (fileType)
    {
        [parameters setObject:fileType forKey:NAMES_fileType];
    }
    else
    {
        [parameters removeObjectForKey:NAMES_fileType];
    }
}

- (FMCFileType*)fileType
{
    NSObject* obj = [parameters objectForKey:NAMES_fileType];
    if ([obj isKindOfClass:FMCFileType.class])
    {
        return (FMCFileType*)obj;
    }
    else
    {
        return [FMCFileType valueOf:(NSString*)obj];
    }
}

- (void)setOffset:(NSNumber*)value
{
    if (value)
    {
        [parameters setObject:value forKey:NAMES_offset];
    }
    else
    {
        [parameters removeObjectForKey:NAMES_offset];
    }
}

- (NSNumber*)offset
{
    return [parameters objectForKey:NAMES_offset];
}

- (void)setLength:(NSNumber*)value
{
    if (value)
    {
        [parameters setObject:value forKey:NAMES_length];
    }
    else
    {
        [parameters removeObjectForKey:NAMES_length];
    }
}

- (NSNumber*)length
{
    return [parameters objectForKey:NAMES_length];
}

@end
