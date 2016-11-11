//
//  SDLABS_STATE.h
//  SmartDeviceLink-iOS
//


#import "SDLEnum.h"

@interface SDLABS_STATE : SDLEnum
/**
 @abstract get SDLABS_STATE according value string
 @param value NSString
 @return SDLABS_STATE object
 */
+ (SDLABS_STATE *)valueOf:(NSString *)value;
/**
 @abstract declare an array to store all possible SDLABS_STATE values
 @return the array
 */
+ (NSArray *)values;

/**
 @return the current ABS state.
 */
+ (SDLABS_STATE *)INACTIVE;

/**
 @return the current ABS state.
 */
+ (SDLABS_STATE *)ACTIVE;

@end
