//  FMCAddSubMenuResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/**
 * FMCAddSubMenuResponse is sent, when FMCAddSubMenu has been called
 * Since <b>AppLink 1.0</b>
 */
@interface FMCAddSubMenuResponse : FMCRPCResponse {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
