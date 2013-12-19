//  FMCAudioPassThruCapabilities.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCAudioType.h>
#import <AppLink/FMCBitsPerSample.h>
#import <AppLink/FMCSamplingRate.h>

/**
 * Describes different audio type configurations for FMCPerformAudioPassThru, e.g. {8kHz,8-bit,PCM}
 * <p><b>Parameter List</b>
 * <table border="1" rules="all">
 * 		<tr>
 * 			<th>Name</th>
 * 			<th>Type</th>
 * 			<th>Description</th>
 * 			<th>AppLink Ver. Available</th>
 * 		</tr>
 * 		<tr>
 * 			<td>samplingRate</td>
 * 			<td>FMCSamplingRate * </td>
 * 			<td>Describes the sampling rate for AudioPassThru
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>bitsPerSample</td>
 * 			<td>FMCBitsPerSample * </td>
 * 			<td>Describes the sample depth in bit for AudioPassThru
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>audioType</td>
 * 			<td>FMCAudioType * </td>
 * 			<td>Describes the audiotype for AudioPassThru
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 *  </table>
 * Since <b>AppLink 2.0</b>
 */
@interface FMCAudioPassThruCapabilities : FMCRPCStruct {}

/**
 * Constructs a newly allocated FMCAudioPassThruCapabilities object
 */
-(id) init;
/**
 * Constructs a newly allocated FMCAudioPassThruCapabilities object indicated by the Hashtable parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract The sampling rate for AudioPassThru<br>
 * 
 */
@property(assign) FMCSamplingRate* samplingRate;
/**
 * @abstract The sample depth in bit for AudioPassThru<br>
 * 
 */
@property(assign) FMCBitsPerSample* bitsPerSample;
/**
 * @abstract The audiotype for AudioPassThru<br>
 * 
 */
@property(assign) FMCAudioType* audioType;

@end
