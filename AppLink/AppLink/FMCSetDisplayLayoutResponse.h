//  FMCSetDisplayLayoutResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>
#import <AppLink/FMCDisplayCapabilities.h>
#import <AppLink/FMCButtonCapabilities.h>
#import <AppLink/FMCSoftButtonCapabilities.h>
#import <AppLink/FMCPresetBankCapabilities.h>

/**
 * Set Display Layout Response is sent, when SetDisplayLayout has been called
 *
 * Since AppLink 2.0
 */
@interface FMCSetDisplayLayoutResponse : FMCRPCResponse {}

/**
 * @abstract Constructs a new FMCSetDisplayLayoutResponse object
 */
-(id) init;

@property (assign) FMCDisplayCapabilities* displayCapabilities;
@property (assign) FMCButtonCapabilities* buttonCapabilities;
@property (assign) FMCSoftButtonCapabilities* softButtonCapabilities;
@property (assign) FMCPresetBankCapabilities* presetBankCapabilities;

@end
