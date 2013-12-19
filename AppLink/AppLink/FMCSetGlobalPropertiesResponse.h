//  FMCSetGlobalPropertiesResponse.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/**
 * Set Global Properties Response is sent, when FMCSetGlobalProperties has been called
 *
 * Since AppLink 1.0
 */
@interface FMCSetGlobalPropertiesResponse : FMCRPCResponse {}

/**
 * @abstract Constructs a new FMCSetGlobalPropertiesResponse object
 */
-(id) init;
/**
 * @abstract Constructs a new FMCSetGlobalPropertiesResponse object indicated by the NSMutableDictionary
 * parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
