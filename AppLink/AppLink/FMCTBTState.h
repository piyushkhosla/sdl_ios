//  FMCTBTState.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCTBTState : FMCEnum {}

+(FMCTBTState*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCTBTState*) ROUTE_UPDATE_REQUEST;
+(FMCTBTState*) ROUTE_ACCEPTED;
+(FMCTBTState*) ROUTE_REFUSED;
+(FMCTBTState*) ROUTE_CANCELLED;
+(FMCTBTState*) ETA_REQUEST;
+(FMCTBTState*) NEXT_TURN_REQUEST;
+(FMCTBTState*) ROUTE_STATUS_REQUEST;
+(FMCTBTState*) ROUTE_SUMMARY_REQUEST;
+(FMCTBTState*) TRIP_STATUS_REQUEST;
+(FMCTBTState*) ROUTE_UPDATE_REQUEST_TIMEOUT;

@end
