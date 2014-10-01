//  FMCFuelCutoffStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>
/** Reflects the status of the Restraints Control Module fuel pump cutoff.<br> The fuel pump is cut off typically after the vehicle has had a collision.
 * <p>
 *
 * @Since AppLink 2.0
 *
 */
@interface FMCFuelCutoffStatus : FMCEnum {}

+(FMCFuelCutoffStatus*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

/** Fuel is cut off
 */

+(FMCFuelCutoffStatus*) TERMINATE_FUEL;

/** Fuel is not cut off
 *
 */
+(FMCFuelCutoffStatus*) NORMAL_OPERATION;

/** Status of the fuel pump cannot be determined
 *
 */

+(FMCFuelCutoffStatus*) FAULT;

@end
