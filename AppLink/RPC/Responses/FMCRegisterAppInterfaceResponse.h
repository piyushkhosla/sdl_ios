//  FMCRegisterAppInterfaceResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

#import <AppLink/RPC/Structs/FMCSyncMsgVersion.h>
#import <AppLink/RPC/Enums/FMCLanguage.h>
#import <AppLink/RPC/Structs/FMCDisplayCapabilities.h>
#import <AppLink/RPC/Structs/FMCPresetBankCapabilities.h>
#import <AppLink/RPC/Structs/FMCVehicleType.h>

@interface FMCRegisterAppInterfaceResponse : FMCRPCResponse {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCSyncMsgVersion* syncMsgVersion;
@property(assign) FMCLanguage* language;
@property(assign) FMCLanguage* hmiDisplayLanguage;
@property(assign) FMCDisplayCapabilities* displayCapabilities;
@property(assign) NSMutableArray* buttonCapabilities;
@property(assign) NSMutableArray* softButtonCapabilities;
@property(assign) FMCPresetBankCapabilities* presetBankCapabilities;
@property(assign) NSMutableArray* hmiZoneCapabilities;
@property(assign) NSMutableArray* speechCapabilities;
@property(assign) NSMutableArray* prerecordedSpeech;
@property(assign) NSMutableArray* vrCapabilities;
@property(assign) NSMutableArray* audioPassThruCapabilities;
@property(assign) FMCVehicleType* vehicleType;
@property(assign) NSMutableArray* supportedDiagModes;

@end
