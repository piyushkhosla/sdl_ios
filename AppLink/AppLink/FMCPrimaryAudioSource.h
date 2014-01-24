//  FMCPrimaryAudioSource.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

/**
 * Reflects the current primary audio source of SYNC (if selected).
 *
 * Avaliable since <font color=red><b> AppLink 2.0 </b></font>
 */
@interface FMCPrimaryAudioSource : FMCEnum {}

/*!
 @abstract get FMCPrimaryAudioSource according value string
 @param value NSString
 @result FMCPrimaryAudioSource object
 */
+(FMCPrimaryAudioSource*) valueOf:(NSString*) value;
/*!
 @abstract declare an array to store all possible FMCPrimaryAudioSource values
 @result return the array
 */
+(NSMutableArray*) values;

/**
 * @abstract Currently no source selected
 * @result return the current primary audio source : <font color=gray><i> NO_SOURCE_SELECTED </i></font>
 */
+(FMCPrimaryAudioSource*) NO_SOURCE_SELECTED;
/**
 * @abstract USB is current source
 * @result return the current primary audio source : <font color=gray><i> USB </i></font>
 */
+(FMCPrimaryAudioSource*) USB;
/**
 * @abstract USB2 is current source
 * @result return the current primary audio source : <font color=gray><i> USB2 </i></font>
 */
+(FMCPrimaryAudioSource*) USB2;
/**
 * @abstract Bluetooth Stereo is current source
 * @result return the current primary audio source : <font color=gray><i> BLUETOOTH_STEREO_BTST </i></font>
 */
+(FMCPrimaryAudioSource*) BLUETOOTH_STEREO_BTST;
/**
 * @abstract Line in is current source
 * @result return the current primary audio source : <font color=gray><i> LINE_IN </i></font>
 */
+(FMCPrimaryAudioSource*) LINE_IN;
/**
 * @abstract iPod is current source
 * @result return the current primary audio source : <font color=gray><i> IPOD </i></font>
 */
+(FMCPrimaryAudioSource*) IPOD;
/**
 * @abstract Mobile app is current source
 * @result return the current primary audio source : <font color=gray><i> MOBILE_APP </i></font>
 */
+(FMCPrimaryAudioSource*) MOBILE_APP;

@end


