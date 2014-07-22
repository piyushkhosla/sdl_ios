//  FMCRegisterAppInterfaceResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

#import <AppLink/FMCSyncMsgVersion.h>
#import <AppLink/FMCLanguage.h>
#import <AppLink/FMCDisplayCapabilities.h>
#import <AppLink/FMCPresetBankCapabilities.h>
#import <AppLink/FMCVehicleType.h>

@interface FMCRegisterAppInterfaceResponse : FMCRPCResponse {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) FMCSyncMsgVersion* syncMsgVersion;
@property(strong) FMCLanguage* language;
@property(strong) FMCLanguage* hmiDisplayLanguage;
@property(strong) FMCDisplayCapabilities* displayCapabilities;
@property(strong) NSMutableArray* buttonCapabilities;
@property(strong) NSMutableArray* softButtonCapabilities;
@property(strong) FMCPresetBankCapabilities* presetBankCapabilities;
@property(strong) NSMutableArray* hmiZoneCapabilities;
@property(strong) NSMutableArray* speechCapabilities;
@property(strong) NSMutableArray* prerecordedSpeech;
@property(strong) NSMutableArray* vrCapabilities;
@property(strong) NSMutableArray* audioPassThruCapabilities;
@property(strong) FMCVehicleType* vehicleType;
@property(strong) NSMutableArray* supportedDiagModes;

@end
