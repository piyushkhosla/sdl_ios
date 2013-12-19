//  FMCAlertManeuverResponse.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/**
 * FMCAlertManeuverResponse is sent, when FMCAlertManeuver has been called
 *
 * Since <b>AppLink 2.0</b>
 */
@interface FMCAlertManeuverResponse : FMCRPCResponse {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
