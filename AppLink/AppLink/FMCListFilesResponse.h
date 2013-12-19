//  FMCListFilesResponse.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

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

@property(assign) NSMutableArray* filenames;
@property(assign) NSNumber* spaceAvailable;

@end
