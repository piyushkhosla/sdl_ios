//  FMCCreateInteractionChoiceSetResponse.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/**
 * FMCCreateInteractionChoiceSetResponse is sent, when FMCCreateInteractionChoiceSet
 * has been called
 *
 * Since <b>AppLink 1.0</b>
 */
@interface FMCCreateInteractionChoiceSetResponse : FMCRPCResponse {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
