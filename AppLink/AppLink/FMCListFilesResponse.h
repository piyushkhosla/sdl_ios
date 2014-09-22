//  FMCListFilesResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/**
 * FMCListFilesResponse is sent, when FMCListFiles has been called
 *
 * Since <b>AppLink 2.0</b>
 */
@interface FMCListFilesResponse : FMCRPCResponse {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) NSMutableArray* filenames;
@property(strong) NSNumber* spaceAvailable;

@end
