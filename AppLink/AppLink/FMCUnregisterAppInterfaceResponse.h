//  FMCUnregisterAppInterfaceResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/**
 * Unregister AppInterface Response is sent, when FMCUnregisterAppInterface has been called
 *
 * Since AppLink 1.0
 */
@interface FMCUnregisterAppInterfaceResponse : FMCRPCResponse {}

/**
 * @abstract Constructs a new FMCUnregisterAppInterfaceResponse object
 */
-(id) init;
/**
 * @abstract Constructs a new FMCUnregisterAppInterfaceResponse object indicated by the NSMutableDictionary
 * parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
