//  FMCSetDisplayLayoutResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/AppLink/FMCRPCResponse.h>

#import <AppLink/RPC/Structs/FMCDisplayCapabilities.h>
#import <AppLink/RPC/Structs/FMCPresetBankCapabilities.h>

@interface FMCSetDisplayLayoutResponse : FMCRPCResponse {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCDisplayCapabilities* displayCapabilities;
@property(assign) NSMutableArray* buttonCapabilities;
@property(assign) NSMutableArray* softButtonCapabilities;
@property(assign) FMCPresetBankCapabilities* presetBankCapabilities;

@end
