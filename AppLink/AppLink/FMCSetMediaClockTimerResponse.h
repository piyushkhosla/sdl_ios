//  FMCSetMediaClockTimerResponse.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/**
 * Set Media Clock Timer Response is sent, when FMCSetMediaClockTimer has been called
 *
 * Since AppLink 1.0
 */
@interface FMCSetMediaClockTimerResponse : FMCRPCResponse {}

/**
 * @abstract Constructs a new FMCSetMediaClockTimerResponse object
 */
-(id) init;
/**
 * @abstract Constructs a new FMCSetMediaClockTimerResponse object indicated by the NSMutableDictionary
 * parameter
 * <p>
 *
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
