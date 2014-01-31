//  FMCHeadLampStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

@interface FMCHeadLampStatus : FMCRPCStruct {}

/**
 * @abstract Constructs a new FMCHeadLampStatus object
 */
-(id) init;

/**
 * @abstract Constructs a new FMCHeadLampStatus object indicated by the NSMutableDictionary
 * parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract A boolean value. Status of the low beam lamps.
 */
@property(assign) NSNumber* lowBeamsOn;

/**
 * @abstract A boolean value. Status of the high beam lamps.
 */
@property(assign) NSNumber* highBeamsOn;

@end
