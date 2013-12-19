//  FMCCompassDirection.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

/**
 * The list of potential compass directions.
 *
 * This enum is avaliable since <font color=red><b>AppLink 2.0</b></font>
 */
@interface FMCCompassDirection : FMCEnum {}

/**
 * @abstract Convert String to FMCCompassDirection
 * @param value NSString
 * @result FMCCompassDirection
 *
 */
+(FMCCompassDirection*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCCompassDirection
 @result return an array that store all possible FMCCompassDirection
 */
+(NSMutableArray*) values;                                 

/**
 * @abstract Direction North
 * @result return a FMCCompassDirection with the value of <font color=gray><i>NORTH</i></font>
 */
+(FMCCompassDirection*) NORTH;
/**
 * @abstract Direction Northwest
 * @result return a FMCCompassDirection with the value of <font color=gray><i>NORTHWEST</i></font>
 */
+(FMCCompassDirection*) NORTHWEST;
/**
 * @abstract Direction West
 * @result return a FMCCompassDirection with the value of <font color=gray><i>WEST</i></font>
 */
+(FMCCompassDirection*) WEST;
/**
 * @abstract Direction Southwest
 * @result return a FMCCompassDirection with the value of <font color=gray><i>SOUTHWEST</i></font>
 */
+(FMCCompassDirection*) SOUTHWEST;
/**
 * @abstract Direction South
 * @result return a FMCCompassDirection with the value of <font color=gray><i>SOUTH</i></font>
 */
+(FMCCompassDirection*) SOUTH;
/**
 * @abstract Direction Southeast
 * @result return a FMCCompassDirection with the value of <font color=gray><i>SOUTHEAST</i></font>
 */
+(FMCCompassDirection*) SOUTHEAST;
/**
 * @abstract Direction East
 * @result return a FMCCompassDirection with the value of <font color=gray><i>EAST</i></font>
 */
+(FMCCompassDirection*) EAST;
/**
 * @abstract Direction Northeast
 * @result return a FMCCompassDirection with the value of <font color=gray><i>NORTHEAST</i></font>
 */
+(FMCCompassDirection*) NORTHEAST;

@end
