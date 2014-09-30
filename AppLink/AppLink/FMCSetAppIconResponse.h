//  FMCSetAppIconResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>
/** FMCSetAppIconResponse is sent, when FMCSetAppIcon has been called.
 * Since<b>AppLink 2.0</b>
 */
@interface FMCSetAppIconResponse : FMCRPCResponse {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
