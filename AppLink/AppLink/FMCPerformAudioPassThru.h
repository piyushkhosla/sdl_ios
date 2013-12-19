//  FMCPerformAudioPassThru.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/FMCAudioType.h>
#import <AppLink/FMCBitsPerSample.h>
#import <AppLink/FMCSamplingRate.h>

/**
 * This will open an audio pass thru session. By doing so the app can receive
 * audio data through the vehicle microphone
 * <p>
 * Function Group: AudioPassThru
 * <p>
 * <b>HMILevel needs to be FULL, LIMITED or BACKGROUND</b>
 * </p>
 *
 * <p>Since AppLink 2.0</p>
 * <p>See FMCEndAudioPassThru</p>
 */
@interface FMCPerformAudioPassThru : FMCRPCRequest {}

/**
 * @abstract Constructs a new FMCPerformAudioPassThru object
 */
-(id) init;
/**
 * @abstract Constructs a new FMCPerformAudioPassThru object indicated by the NSMutableDictionary
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract initial prompt which will be spoken before opening the audio pass
 * thru session by SYNC
 * @discussion initialPrompt
 *            a Vector<TTSChunk> value represents the initial prompt which
 *            will be spoken before opening the audio pass thru session by
 *            SYNC
 *            <p>
 *            <b>Notes: </b>
 *            <ul>
 *            <li>This is an array of text chunks of type TTSChunk</li>
 *            <li>The array must have at least one item</li>
 *            <li>If omitted, then no initial prompt is spoken</li>
 *            <li>Array Minsize: 1</li>
 *            <li>Array Maxsize: 100</li>
 *            </ul>
 */
@property(assign) NSMutableArray* initialPrompt;
/**
 * @abstract a line of text displayed during audio capture
 * @discussion audioPassThruDisplayText1
 *            a String value representing the line of text displayed during
 *            audio capture
 *            <p>
 *            <b>Notes: </b>Maxlength=500
 */
@property(assign) NSString* audioPassThruDisplayText1;
/**
 * @abstract A line of text displayed during audio capture
 * @discussion audioPassThruDisplayText2
 *            a String value representing the line of text displayed during
 *            audio capture
 *            <p>
 *            <b>Notes: </b>Maxlength=500
 */
@property(assign) NSString* audioPassThruDisplayText2;
/**
 * @abstract A samplingRate
 *
 * @discussion a SamplingRate value representing a 8 or 16 or 22 or 24 khz
 */
@property(assign) FMCSamplingRate* samplingRate;
/**
 * @abstract the maximum duration of audio recording in milliseconds
 *
 * @discussion maxDuration
 *            an Integer value representing the maximum duration of audio
 *            recording in millisecond
 *            <p>
 *            <b>Notes: </b>Minvalue:1; Maxvalue:1000000
 */
@property(assign) NSNumber* maxDuration;
/**
 * @abstract the quality the audio is recorded - 8 bit or 16 bit
 *
 * @discussion a BitsPerSample value representing 8 bit or 16 bit
 */
@property(assign) FMCBitsPerSample* bitsPerSample;
/**
 * @abstract an audioType
 */
@property(assign) FMCAudioType* audioType;
/**
 * @abstract a Boolean value representing if the current audio source should be
 * muted during the APT session<br/>
 */
@property(assign) NSNumber* muteAudio;

@end