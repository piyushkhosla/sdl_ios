//  FMCShowConstantTBT.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/FMCImage.h>

@interface FMCShowConstantTBT : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSString* navigationText1;
@property(assign) NSString* navigationText2;
@property(assign) NSString* eta;
@property(assign) NSString* totalDistance;
@property(assign) FMCImage* turnIcon;
@property(assign) NSNumber* distanceToManeuver;
@property(assign) NSNumber* distanceToManeuverScale;
@property(assign) NSNumber* maneuverComplete;
@property(assign) NSMutableArray* softButtons;

@end
