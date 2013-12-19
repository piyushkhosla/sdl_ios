//  FMCPRNDL.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

/**
 * The selected gear.
 *
 * Avaliable since <font color=red><b> AppLink 2.0 </b></font>
 */
@interface FMCPRNDL : FMCEnum {}

/*!
 @abstract get FMCPRNDL according value string
 @param value NSString
 @result FMCPRNDL object
 */
+(FMCPRNDL*) valueOf:(NSString*) value;
/*!
 @abstract declare an array to store all possible FMCPRNDL values
 @result return the array
 */
+(NSMutableArray*) values;

/**
 * @abstract Parking
 * @result return FMCPRNDL : <font color=gray><i> PARK </i></font>
 */
+(FMCPRNDL*) PARK;
/**
 * @abstract Reverse gear
 * @result return FMCPRNDL : <font color=gray><i> REVERSE </i></font>
 */
+(FMCPRNDL*) REVERSE;
/**
 * @abstract No gear
 * @result return FMCPRNDL : <font color=gray><i> NEUTRAL </i></font>
 */
+(FMCPRNDL*) NEUTRAL;
+(FMCPRNDL*) DRIVE;
/**
 * @abstract Drive Sport mode
 * @result return FMCPRNDL : <font color=gray><i> SPORT </i></font>
 */
+(FMCPRNDL*) SPORT;
/**
 * @abstract 1st gear hold
 * @result return FMCPRNDL : <font color=gray><i> LOWGEAR </i></font>
 */
+(FMCPRNDL*) LOWGEAR;
/**
 * @abstract First gear
 * @result return FMCPRNDL : <font color=gray><i> FIRST </i></font>
 */
+(FMCPRNDL*) FIRST;
/**
 * @abstract Second gear
 * @result return FMCPRNDL : <font color=gray><i> SECOND </i></font>
 */
+(FMCPRNDL*) SECOND;
/**
 * @abstract Third gear
 * @result return FMCPRNDL : <font color=gray><i> THIRD </i></font>
 */
+(FMCPRNDL*) THIRD;
/**
 * @abstract Fourth gear
 * @result return FMCPRNDL : <font color=gray><i> FOURTH </i></font>
 */
+(FMCPRNDL*) FOURTH;
/**
 * @abstract Fifth gear
 * @result return FMCPRNDL : <font color=gray><i> FIFTH </i></font>
 */
+(FMCPRNDL*) FIFTH;
/**
 * @abstract Sixth gear
 * @result return FMCPRNDL : <font color=gray><i> SIXTH </i></font>
 */
+(FMCPRNDL*) SIXTH;
/**
 * @abstract Seventh gear
 * @result return FMCPRNDL : <font color=gray><i> SEVENTH </i></font>
 */
+(FMCPRNDL*) SEVENTH;
/**
   * @abstract Eighth gear
   * @result return FMCPRNDL : <font color=gray><i> EIGTH </i></font>
   */
+(FMCPRNDL*) EIGTH;

@end


