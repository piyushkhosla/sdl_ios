//  FMCShowConstantTBT.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/RPC/Structs/FMCImage.h>

@interface FMCShowConstantTBT : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSString* navigationText1;
@property(assign) NSString* navigationText2;
@property(assign) NSString* eta;
@property(assign) NSString* timeToDestination;
@property(assign) NSString* totalDistance;
@property(assign) FMCImage* turnIcon;
@property(assign) FMCImage* nextTurnIcon;
@property(assign) NSNumber* distanceToManeuver;
@property(assign) NSNumber* distanceToManeuverScale;
@property(assign) NSNumber* maneuverComplete;
@property(assign) NSMutableArray* softButtons;

@end
