//  FMCCarModeStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>
/** Describes the carmode the vehicle is in.
 * <b>Since</b> AppLink 2.0
 */
@interface FMCCarModeStatus : FMCEnum {}

+(FMCCarModeStatus*) valueOf:(NSString*) value;
+(NSMutableArray*) values;
/** Provides carmode NORMAL to each module.
 */
+(FMCCarModeStatus*) NORMAL;

/** Provides carmode FACTORY to each module.
 */
+(FMCCarModeStatus*) FACTORY;

/** Provides carmode TRANSPORT to each module.
 */
+(FMCCarModeStatus*) TRANSPORT;

/** Provides carmode CRASH to each module.
 */
+(FMCCarModeStatus*) CRASH;

@end
