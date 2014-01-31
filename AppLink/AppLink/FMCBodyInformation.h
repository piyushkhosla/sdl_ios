//  FMCBodyInformation.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCIgnitionStableStatus.h>
#import <AppLink/FMCIgnitionStatus.h>

@interface FMCBodyInformation : FMCRPCStruct {}

/**
 * @abstract Constructs a new FMCBodyInformation object
 */
-(id) init;

/**
 * @abstract Constructs a new FMCBodyInformation object indicated by the NSMutableDictionary
 * parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract References signal "PrkBrkActv_B_Actl".
 */
@property(assign) NSNumber* parkBrakeActive;

/**
 * @abstract References signal "Ignition_Switch_Stable". See IgnitionStableStatus.
 */
@property(assign) FMCIgnitionStableStatus* ignitionStableStatus;

/**
 * @abstract References signal "Ignition_status". See IgnitionStatus.
 */
@property(assign) FMCIgnitionStatus* ignitionStatus;

/**
 * @abstract References signal "DrStatDrv_B_Actl".
 */
@property(assign) NSNumber* driverDoorAjar;

/**
 * @abstract References signal "DrStatPsngr_B_Actl".
 */
@property(assign) NSNumber* passengerDoorAjar;

/**
 * @abstract References signal "DrStatRl_B_Actl".
 */
@property(assign) NSNumber* rearLeftDoorAjar;

/**
 * @abstract References signal "DrStatRr_B_Actl".
 */
@property(assign) NSNumber* rearRightDoorAjar;

@end
