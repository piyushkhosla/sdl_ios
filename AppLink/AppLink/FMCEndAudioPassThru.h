//  FMCEndAudioPassThru.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

/**
 * When this request is invoked, the audio capture stops
 * <p>
 * Function Group: AudioPassThru
 * <p>
 * <b>HMILevel needs to be FULL, LIMITED or BACKGROUND</b>
 * </p>
 * Since <b>AppLink 2.0</b><br>
 * see FMCPerformAudioPassThru
 */
@interface FMCEndAudioPassThru : FMCRPCRequest {}

/**
 * Constructs a new FMCEndAudioPassThru object
 */
-(id) init;
/**
 * Constructs a new FMCEndAudioPassThru object indicated by the NSMutableDictionary
 * parameter
 * <p>
 *
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
