//  FMCUpdateTurnListResponse.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/**
 * Update Turn List Response is sent, when FMCUpdateTurnList has been called
 *
 * Since AppLink 2.0
 */
@interface FMCUpdateTurnListResponse : FMCRPCResponse {}

/**
 * @abstract Constructs a new FMCUpdateTurnListResponse object
 */
-(id) init;
/**
 * @abstract Constructs a new FMCUpdateTurnListResponse object indicated by the NSMutableDictionary
 * parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
