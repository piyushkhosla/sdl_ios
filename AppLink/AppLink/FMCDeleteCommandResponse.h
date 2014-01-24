//  FMCDeleteCommandResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/**
 * FMCDeleteCommandResponse is sent, when FMCDeleteCommand has been called
 *
 * Since <b>AppLink 1.0</b><br>
 */
@interface FMCDeleteCommandResponse : FMCRPCResponse {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
