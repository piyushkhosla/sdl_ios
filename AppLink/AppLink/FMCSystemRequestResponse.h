//  FMCSystemRequestResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/** FMCSystemRequestResponse is sent, when FMCSystemRequest has been called.
 * Since<b>AppLink 3.0</b>
 */
@interface FMCSystemRequestResponse : FMCRPCResponse {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
