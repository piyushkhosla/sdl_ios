//  FMCShowConstantTBT.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/FMCImage.h>

@interface FMCShowConstantTBT : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) NSString* navigationText1;
@property(strong) NSString* navigationText2;
@property(strong) NSString* eta;
@property(strong) NSString* timeToDestination;
@property(strong) NSString* totalDistance;
@property(strong) FMCImage* turnIcon;
@property(strong) FMCImage* nextTurnIcon;
@property(strong) NSNumber* distanceToManeuver;
@property(strong) NSNumber* distanceToManeuverScale;
@property(strong) NSNumber* maneuverComplete;
@property(strong) NSMutableArray* softButtons;

@end
