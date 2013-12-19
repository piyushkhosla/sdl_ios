//  FMCShowConstantTBTResponse.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/**
 * Show Constant TBT Response is sent, when FMCShowConstantTBT has been called
 *
 * Since AppLink 2.0
 */
@interface FMCShowConstantTBTResponse : FMCRPCResponse {}

/**
 * @abstract Constructs a new FMCShowConstantTBTResponse object
 */
-(id) init;
/**
 * @abstract Constructs a new FMCShowConstantTBTResponse object indicated by the NSMutableDictionary
 * parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
