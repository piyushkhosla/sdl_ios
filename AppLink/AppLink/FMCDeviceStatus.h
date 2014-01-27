//  FMCDeviceStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCDeviceLevelStatus.h>
#import <AppLink/FMCPrimaryAudioSource.h>
/**
 * Describes the status related to a connected mobile device or SYNC and if or how  it is represented in the vehicle.
 * <p><b>Parameter List
 * <table border="1" rules="all">
 * 		<tr>
 * 			<th>Name</th>
 * 			<th>Type</th>
 * 			<th>Description</th>
 * 			<th>AppLink Ver. Available</th>
 * 		</tr>
 * 		<tr>
 * 			<td>voiceRecOn</td>
 * 			<td>NSNumber * </td>
 * 			<td>Voice recognition is on
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>btIconOn</td>
 * 			<td>NSNumber * </td>
 * 			<td>Bluetooth connection established
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>callActive</td>
 * 			<td>NSNumber * </td>
 * 			<td>A call is being active
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>phoneRoaming</td>
 * 			<td>NSNumber * </td>
 * 			<td>The phone is in roaming mode
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>textMsgAvailable</td>
 * 			<td>NSNumber * </td>
 * 			<td>A textmessage is available
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>battLevelStatus</td>
 * 			<td>FMCDeviceLevelStatus * </td>
 * 			<td>Battery level status
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>stereoAudioOutputMuted</td>
 * 			<td>NSNumber * </td>
 * 			<td>Status of the stereo audio output channel
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>monoAudioOutputMuted</td>
 * 			<td>NSNumber * </td>
 * 			<td>Status of the mono audio output channel
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>signalLevelStatus</td>
 * 			<td>FMCDeviceLevelStatus * </td>
 * 			<td>Signal level status
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>primaryAudioSource</td>
 * 			<td>PrimaryAudioSource * </td>
 * 			<td>Reflects the current primary audio source of SYNC (if selected).
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>eCallEventActive</td>
 * 			<td>NSNumber * </td>
 * 			<td>Reflects, if an eCall event is active
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 *  </table>
 * Since <b>AppLink 2.0</b>
 */

@interface FMCDeviceStatus : FMCRPCStruct {}
/**
 * Constructs a newly allocated FMCDeviceStatus object
 */
-(id) init;
/**
 * Constructs a newly allocated FMCDeviceStatus object indicated by the NSMutableDictionary parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract NSNumber value indicates whether the voice recognition on or off
 * @discussion
 */
@property(assign) NSNumber* voiceRecOn;
/**
 * @abstract NSNumber value indicates whether the bluetooth connection established
 * @discussion
 */
@property(assign) NSNumber* btIconOn;
/**
 * @abstract NSNumber value indicates whether a call is being active
 * @discussion
 */
@property(assign) NSNumber* callActive;
/**
 * @abstract NSNumber value indicates whether the phone is in roaming mode
 * @discussion
 */
@property(assign) NSNumber* phoneRoaming;
/**
 * @abstract NSNumber value indicates whether a textmessage is available
 * @discussion
 */
@property(assign) NSNumber* textMsgAvailable;
/**
 * @abstract battery level status
 * @discussion
 */
@property(assign) FMCDeviceLevelStatus* battLevelStatus;
/**
 * @abstract the status of the stereo audio output channel
 * @discussion
 */
@property(assign) NSNumber* stereoAudioOutputMuted;
/**
 * @abstract the status of the mono audio output channel
 * @discussion
 */
@property(assign) NSNumber* monoAudioOutputMuted;
/**
 * @abstract signal level status
 * @discussion
 */
@property(assign) FMCDeviceLevelStatus* signalLevelStatus;
/**
 * @abstract the current primary audio source of SYNC (if selected).
 * @discussion
 */
@property(assign) FMCPrimaryAudioSource* primaryAudioSource;
@property(assign) NSNumber* eCallEventActive;

@end