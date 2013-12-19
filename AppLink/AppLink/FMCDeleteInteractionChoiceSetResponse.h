//  FMCDeleteInteractionChoiceSetResponse.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/**
 * FMCDeleteInteractionChoiceSetResponse is sent, when FMCDeleteInteractionChoiceSet has been called
 *
 * Since <b>AppLink 1.0</b>
 */
@interface FMCDeleteInteractionChoiceSetResponse : FMCRPCResponse {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
