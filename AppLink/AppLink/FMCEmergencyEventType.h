//  FMCEmergencyEventType.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/** Reflects the emergency event status of the vehicle.
*<b> Since:</b> AppLink 2.0
*<p>
*/

@interface FMCEmergencyEventType : FMCEnum {}

+(FMCEmergencyEventType*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

/** No emergency event has happened.
 */

+(FMCEmergencyEventType*) NO_EVENT;

/** Frontal collision has happened.
 */

+(FMCEmergencyEventType*) FRONTAL;

/** Side collision has happened.
 */

+(FMCEmergencyEventType*) SIDE;

/**Rear collision has happened.
*/

+(FMCEmergencyEventType*) REAR;

/** A rollover event has happened.
 */

+(FMCEmergencyEventType*) ROLLOVER;

/** The signal is not supported
 */

+(FMCEmergencyEventType*) NOT_SUPPORTED;

/** Emergency status cannot be determined
 */

+(FMCEmergencyEventType*) FAULT;

@end
