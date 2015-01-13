//  FMCDeleteSubMenuResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/**
 * FMCDeleteSubMenuResponse is sent, when FMCDeleteSubMenu has been called
 *
 * Since <b>AppLink 1.0</b>
 */
@interface FMCDeleteSubMenuResponse : FMCRPCResponse {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
