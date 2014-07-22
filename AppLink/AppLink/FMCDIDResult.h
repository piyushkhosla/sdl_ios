//  FMCDIDResult.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCVehicleDataResultCode.h>

@interface FMCDIDResult : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) FMCVehicleDataResultCode* resultCode;
@property(strong) NSNumber* didLocation;
@property(strong) NSString* data;

@end
