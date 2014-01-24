//  FMCPerformAudioPassThruResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/**
 * Perform Audio Pass Thru Response is sent, when PerformAudioPassThru has been called
 *
 * Since AppLink 2.0
 */
@interface FMCPerformAudioPassThruResponse : FMCRPCResponse {}

/**
 * @abstract Constructs a new FMCPerformAudioPassThruResponse object
 */
-(id) init;
/**
 * @abstract Constructs a new FMCPerformAudioPassThruResponse object indicated by the NSMutableDictionary parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
