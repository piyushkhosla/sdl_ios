//  FMCRegisterAppInterface.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/FMCSyncMsgVersion.h>
#import <AppLink/FMCLanguage.h>
#import <AppLink/FMCDeviceInfo.h>

@interface FMCRegisterAppInterface : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) FMCSyncMsgVersion* syncMsgVersion;
@property(strong) NSString* appName;
@property(strong) NSMutableArray* ttsName;
@property(strong) NSString* ngnMediaScreenAppName;
@property(strong) NSMutableArray* vrSynonyms;
@property(strong) NSNumber* isMediaApplication;
@property(strong) FMCLanguage* languageDesired;
@property(strong) FMCLanguage* hmiDisplayLanguageDesired;
@property(strong) NSMutableArray* appHMIType;
@property(strong) NSString* hashID;
@property(strong) FMCDeviceInfo* deviceInfo;
@property(strong) NSString* appID;

@end
