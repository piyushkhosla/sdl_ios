//  FMCDeleteFileResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/**
 * Delete File Response is sent, when DeleteFile has been called
 *
 * Since <b>AppLink 2.0</b><br>
 */
@interface FMCDeleteFileResponse : FMCRPCResponse {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSNumber* spaceAvailable;

@end
