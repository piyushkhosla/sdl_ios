//  FMCAudioStreamingState.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * Describes whether or not streaming audio is currently audible to the user.
 * Though provided in every OnHMIStatus notification, this information is only
 * relevant for applications that declare themselves as media apps in
 * RegisterAppInterface
 *
 * This enum is avaliable since <font color=red><b>AppLink 1.0</b></font>
 */
@interface FMCAudioStreamingState : FMCEnum {}

/**
 * @abstract Convert String to FMCAudioStreamingState
 * @param value NSString
 * @result FMCAudioStreamingState
 */
+(FMCAudioStreamingState*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCAudioStreamingState
 @result return an array that store all possible FMCAudioStreamingState
 */
+(NSMutableArray*) values;

/**
 * @abstract Currently streaming audio, if any, is audible to user.
 * @result FMCAudioStreamingState with value of <font color=gray><i>AUDIBLE</i></font>
 * @since AppLink 1.0
 */
+(FMCAudioStreamingState*) AUDIBLE;
/**
 * @abstract Some kind of audio mixing is taking place. Currently streaming audio, if
 * any, is audible to the user at a lowered volume.
 * @result FMCAudioStreamingState with value of <font color=gray><i>ATTENUATED</i></font>
 * @since AppLink 2.0
 */
+(FMCAudioStreamingState*) ATTENUATED;
/**
 * @abstract Currently streaming audio, if any, is not audible to user. made via VR
 * session.
 * @result FMCAudioStreamingState with value of <font color=gray><i>NOT_AUDIBLE</i></font>
 * @since AppLink 1.0
 */
+(FMCAudioStreamingState*) NOT_AUDIBLE;

@end
