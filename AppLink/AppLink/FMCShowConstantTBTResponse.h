//  FMCShowConstantTBTResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved


#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/** FMCShowConstantTBTResponse is sent, when FMCShowConstantTBT has been called.
 * Since<b>AppLink 2.0</b>
 */
@interface FMCShowConstantTBTResponse : FMCRPCResponse {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
