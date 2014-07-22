//  FMCGPSData.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCCompassDirection.h>
#import <AppLink/FMCDimension.h>

@interface FMCGPSData : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) NSNumber* longitudeDegrees;
@property(strong) NSNumber* latitudeDegrees;
@property(strong) NSNumber* utcYear;
@property(strong) NSNumber* utcMonth;
@property(strong) NSNumber* utcDay;
@property(strong) NSNumber* utcHours;
@property(strong) NSNumber* utcMinutes;
@property(strong) NSNumber* utcSeconds;
@property(strong) FMCCompassDirection* compassDirection;
@property(strong) NSNumber* pdop;
@property(strong) NSNumber* hdop;
@property(strong) NSNumber* vdop;
@property(strong) NSNumber* actual;
@property(strong) NSNumber* satellites;
@property(strong) FMCDimension* dimension;
@property(strong) NSNumber* altitude;
@property(strong) NSNumber* heading;
@property(strong) NSNumber* speed;

@end
