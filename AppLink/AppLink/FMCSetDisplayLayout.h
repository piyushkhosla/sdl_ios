//  FMCSetDisplayLayout.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

/**
 * Used to set an alternate display layout. If not sent, default screen for
 * given platform will be shown
 *
 * Since AppLink 2.0
 */
@interface FMCSetDisplayLayout : FMCRPCRequest {}

/**
 * @abstract Constructs a new FMCSetDisplayLayout object
 */
-(id) init;
/**
 * @abstract Constructs a new FMCSetDisplayLayout object indicated by the NSMutableDictionary
 * parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract A display layout. Predefined or dynamically created screen layout.
 * Currently only predefined screen layouts are defined. Predefined layouts
 * include: "ONSCREEN_PRESETS" Custom screen containing app-defined onscreen
 * presets. Currently defined for GEN2
 */
@property(assign) NSString* displayLayout;

@end