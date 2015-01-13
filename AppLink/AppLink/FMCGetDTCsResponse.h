//  FMCGetDTCsResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/**
 * FMCGetDTCsResponse is sent, when FMCGetDTCs has been called
 *
 * Since <b>AppLink 2.0</b>
 */
@interface FMCGetDTCsResponse : FMCRPCResponse {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) NSNumber* ecuHeader;
@property(strong) NSMutableArray* dtc;

@end
