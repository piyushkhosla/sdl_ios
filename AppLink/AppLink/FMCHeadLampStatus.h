//  FMCHeadLampStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCAmbientLightStatus.h>

/**
 * Status of the head lamps
 */
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
@property(strong) NSNumber* lowBeamsOn;
/**
 * @abstract A boolean value. Status of the high beam lamps.
 */
@property(strong) NSNumber* highBeamsOn;
@property(strong) FMCAmbientLightStatus* ambientLightSensorStatus;

@end
