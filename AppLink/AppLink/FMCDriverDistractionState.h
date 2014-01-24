//  FMCDriverDistractionState.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

/**
 * Enumeration that describes possible states of driver distraction.
 *
 * This enum is avaliable since <font color=red><b> AppLink 1.0 </b></font>
 */
@interface FMCDriverDistractionState : FMCEnum {}

/**
 * Convert String to FMCDisplayType
 * @param value String
 * @return FMCDisplayType
 */
+(FMCDriverDistractionState*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCDriverDistractionState
 @result return an array that store all possible FMCDriverDistractionState
 */
+(NSMutableArray*) values;

/**
 * @abstract Driver distraction rules are in effect.
 * @result return a FMCDriverDistractionState with value of <font color=gray><i> DD_ON </i></font>
 */
+(FMCDriverDistractionState*) DD_ON;
/**
 * @abstract Driver distraction rules are NOT in effect.
 * @result return a FMCDriverDistractionState with value of <font color=gray><i> DD_OFF </i></font>
 */
+(FMCDriverDistractionState*) DD_OFF;

@end
