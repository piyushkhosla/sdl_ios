//  FMCDimension.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

/**
 * The supported dimensions of the GPS.
 *
 * This enum is avaliable since <font color=red><b>AppLink 2.0</b></font>
 */
@interface FMCDimension : FMCEnum {}

/**
 * Convert String to FMCDimension
 * @param value String
 * @return FMCDimension
 */
+(FMCDimension*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCDimension
 @result return an array that store all possible FMCDimension
 */
+(NSMutableArray*) values;                                 

/*!
 @abstract No GPS at all
 @result return the dimension with value of <font color=gray><i> NO_FIX </i></font>
 */
+(FMCDimension*) NO_FIX;
/*!
 @abstract Longitude and latitude
 @result return the dimension with value of <font color=gray><i> 2D </i></font>
 */
+(FMCDimension*) _2D;
/*!
 @abstract Longitude and latitude and altitude
 @result return the dimension with value of <font color=gray><i> 3D </i></font>
 */
+(FMCDimension*) _3D;

@end


