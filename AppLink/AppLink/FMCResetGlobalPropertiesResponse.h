//  FMCResetGlobalPropertiesResponse.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/**
 * Reset Global Properties Response is sent, when FMCResetGlobalProperties has been called
 *
 * Since AppLink 1.0
 */
@interface FMCResetGlobalPropertiesResponse : FMCRPCResponse {}

/**
 * @abstract Constructs a new FMCResetGlobalPropertiesResponse object
 */
-(id) init;
/**
 * @abstract Constructs a new FMCResetGlobalPropertiesResponse object indicated by the NSMutableDictionary
 * parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
