//  FMCTBTState.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

/**
 * Describes possible states of turn-by-turn module.
 *
 * Avaliable since <font color=red><b> AppLink 1.0 </b></font>
 */
@interface FMCTBTState : FMCEnum {}

/**
 * Convert String to FMCTBTState
 * @param value String
 * @return FMCTBTState
 */
+(FMCTBTState*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCTBTState
 @result return an array that store all possible FMCTBTState
 */
+(NSMutableArray*) values;                                 

/**
 * @abstract Indicates that driver requested a route update.
 * @result return FMCTBTState object with value of <font color=gray><i> ROUTE_UPDATE_REQUEST </i></font>
 */
+(FMCTBTState*) ROUTE_UPDATE_REQUEST;
/*!
 @abstract ROUTE_ACCEPTED
 */
+(FMCTBTState*) ROUTE_ACCEPTED;
/*!
 @abstract ROUTE_REFUSED
 */
+(FMCTBTState*) ROUTE_REFUSED;
/*!
 @abstract ROUTE_CANCELLED
 */
+(FMCTBTState*) ROUTE_CANCELLED;
/*!
 @abstract ETA_REQUEST
 */
+(FMCTBTState*) ETA_REQUEST;
/*!
 @abstract NEXT_TURN_REQUEST
 */
+(FMCTBTState*) NEXT_TURN_REQUEST;
/*!
 @abstract ROUTE_STATUS_REQUEST
 */
+(FMCTBTState*) ROUTE_STATUS_REQUEST;
/*!
 @abstract ROUTE_SUMMARY_REQUEST
 */
+(FMCTBTState*) ROUTE_SUMMARY_REQUEST;
/*!
 @abstract TRIP_STATUS_REQUEST
 */
+(FMCTBTState*) TRIP_STATUS_REQUEST;
/*!
 @abstract ROUTE_UPDATE_REQUEST_TIMEOUT
 */
+(FMCTBTState*) ROUTE_UPDATE_REQUEST_TIMEOUT;

@end


