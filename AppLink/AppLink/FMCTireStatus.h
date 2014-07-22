//  FMCTireStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCWarningLightStatus.h>
#import <AppLink/FMCSingleTireStatus.h>

@interface FMCTireStatus : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) FMCWarningLightStatus* pressureTelltale;
@property(strong) FMCSingleTireStatus* leftFront;
@property(strong) FMCSingleTireStatus* rightFront;
@property(strong) FMCSingleTireStatus* leftRear;
@property(strong) FMCSingleTireStatus* rightRear;
@property(strong) FMCSingleTireStatus* innerLeftRear;
@property(strong) FMCSingleTireStatus* innerRightRear;

@end
