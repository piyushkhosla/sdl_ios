//
//  SDLSystemCapabilityType.h
//

#import "SDLEnum.h"

/**
 *
 * Enumeration that describes system actions that can be triggered.
 */
@interface SDLSystemCapabilityType : SDLEnum

/**
 * Convert String to SDLSystemCapabilityType
 * @param value String
 * @return SDLSystemCapabilityType
 */
+ (SDLSystemCapabilityType *)valueOf:(NSString *)value;

/**
 @abstract Store the enumeration of all possible SDLSystemCapabilityType
 @return an array that store all possible SDLSystemCapabilityType
 */
+ (NSArray *)values;

/**
 @abstract NAVIGATION
 */
+ (SDLSystemCapabilityType *)NAVIGATION;

/**
 @abstract PHONE_CALL
 */
+ (SDLSystemCapabilityType *)PHONE_CALL;

/**
 @abstract VIDEO_STREAMING
 */
+ (SDLSystemCapabilityType *)VIDEO_STREAMING;

/**
 @abstract AUDIO_STREAMING
 */
+ (SDLSystemCapabilityType *)AUDIO_STREAMING;

/**
 @abstract REMOTE_CONTROL
 */
+ (SDLSystemCapabilityType *)REMOTE_CONTROL;


@end
