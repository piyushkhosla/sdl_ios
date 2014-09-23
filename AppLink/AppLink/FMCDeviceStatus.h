//  FMCDeviceStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCDeviceLevelStatus.h>
#import <AppLink/FMCPrimaryAudioSource.h>

@interface FMCDeviceStatus : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) NSNumber* voiceRecOn;
@property(strong) NSNumber* btIconOn;
@property(strong) NSNumber* callActive;
@property(strong) NSNumber* phoneRoaming;
@property(strong) NSNumber* textMsgAvailable;
@property(strong) FMCDeviceLevelStatus* battLevelStatus;
@property(strong) NSNumber* stereoAudioOutputMuted;
@property(strong) NSNumber* monoAudioOutputMuted;
@property(strong) FMCDeviceLevelStatus* signalLevelStatus;
@property(strong) FMCPrimaryAudioSource* primaryAudioSource;
@property(strong) NSNumber* eCallEventActive;

@end
