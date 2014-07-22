//  FMCVehicleType.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

@interface FMCVehicleType : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) NSString* make;
@property(strong) NSString* model;
@property(strong) NSString* modelYear;
@property(strong) NSString* trim;

@end
