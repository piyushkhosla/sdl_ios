//  FMCUpdateTurnListResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>
/** FMCUpdateTurnListResponse is sent, when FMCUpdateTurnList has been called.
 * Since<b>AppLink 2.0</b>
 */
@interface FMCUpdateTurnListResponse : FMCRPCResponse {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
