//  FMCComponentVolumeStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * The volume status of a vehicle component.
 *
 * This enum is avaliable since <font color=red><b>AppLink 2.0</b></font>
 */
@interface FMCComponentVolumeStatus : FMCEnum {}

/**
 * @abstract Convert String to FMCComponentVolumeStatus
 * @param value NSString
 * @result FMCComponentVolumeStatus
 *
 */
+(FMCComponentVolumeStatus*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCComponentVolumeStatus
 @result return an array that store all possible FMCComponentVolumeStatus
 */
+(NSMutableArray*) values;                                 

/*!
 @abstract Unknown FMCComponentVolumeStatus
 @result return a FMCComponentVolumeStatus with the value of <font color=gray><i>UNKNOWN</i></font>
 */
+(FMCComponentVolumeStatus*) UNKNOWN;
/*!
 @abstract Normal FMCComponentVolumeStatus
 @result return a FMCComponentVolumeStatus with the value of <font color=gray><i>NORMAL</i></font>
 */
+(FMCComponentVolumeStatus*) NORMAL;
/*!
 @abstract Low FMCComponentVolumeStatus
 @result return a FMCComponentVolumeStatus with the value of <font color=gray><i>LOW</i></font>
 */
+(FMCComponentVolumeStatus*) LOW;
/*!
 @abstract Fault FMCComponentVolumeStatus
 @result return a FMCComponentVolumeStatus with the value of <font color=gray><i>FAULT</i></font>
 */
+(FMCComponentVolumeStatus*) FAULT;
/*!
 @abstract Alert FMCComponentVolumeStatus
 @result return a FMCComponentVolumeStatus with the value of <font color=gray><i>ALERT</i></font>
 */
+(FMCComponentVolumeStatus*) ALERT;
/*!
 @abstract Not supported FMCComponentVolumeStatus
 @result return a FMCComponentVolumeStatus with the value of <font color=gray><i>NOT_SUPPORTED</i></font>
 */
+(FMCComponentVolumeStatus*) NOT_SUPPORTED;

@end
