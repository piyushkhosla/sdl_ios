//  FMCSetDisplayLayoutResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>
#import <AppLink/FMCDisplayCapabilities.h>
#import <AppLink/FMCButtonCapabilities.h>
#import <AppLink/FMCSoftButtonCapabilities.h>
#import <AppLink/FMCPresetBankCapabilities.h>

@interface FMCSetDisplayLayoutResponse : FMCRPCResponse {}

-(id) init;

@property (assign) FMCDisplayCapabilities* displayCapabilities;
@property (assign) FMCButtonCapabilities* buttonCapabilities;
@property (assign) FMCSoftButtonCapabilities* softButtonCapabilities;
@property (assign) FMCPresetBankCapabilities* presetBankCapabilities;

@end
