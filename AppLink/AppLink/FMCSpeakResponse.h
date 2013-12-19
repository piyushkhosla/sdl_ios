//  FMCSpeakResponse.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/**
 * Speak Response is sent, when Speak has been called
 *
 * Since AppLink 1.0
 */
@interface FMCSpeakResponse : FMCRPCResponse {}

/**
 * @abstract Constructs a new FMCSpeakResponse object
 */
-(id) init;
/**
 * @abstract Constructs a new FMCSpeakResponse object indicated by the NSMutableDictionary
 * parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
