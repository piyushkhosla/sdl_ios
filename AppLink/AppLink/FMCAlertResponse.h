//  FMCAlertResponse.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/**
 * FMCAlertResponse is sent, when FMCAlert has been called
 *
 * Since <b>AppLink 1.0</b>
 */
@interface FMCAlertResponse : FMCRPCResponse {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
