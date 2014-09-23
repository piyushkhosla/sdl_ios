//  FMCPutFile.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/FMCFileType.h>

@interface FMCPutFile : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) NSString* syncFileName;
@property(strong) FMCFileType* fileType;
@property(strong) NSNumber* persistentFile;
@property(strong) NSNumber* systemFile;
@property(strong) NSNumber* offset;
@property(strong) NSNumber* length;

@end
