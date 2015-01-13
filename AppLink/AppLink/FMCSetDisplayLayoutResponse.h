//  FMCSetDisplayLayoutResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

#import <AppLink/FMCDisplayCapabilities.h>
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
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) FMCDisplayCapabilities* displayCapabilities;
@property(strong) NSMutableArray* buttonCapabilities;
@property(strong) NSMutableArray* softButtonCapabilities;
@property(strong) FMCPresetBankCapabilities* presetBankCapabilities;

@end
