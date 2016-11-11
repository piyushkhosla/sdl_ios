//
//  SDLTurnSignal.h
//  SmartDeviceLink-iOS//


/**
 SDLTurnSignal gives signal about next turn.
 */
#import "SDLEnum.h"


@interface SDLTurnSignal : SDLEnum

/**
 @abstract get SDLTurnSignal according value string
 @param value NSString
 @return SDLTurnSignal object
 */
+ (SDLTurnSignal *)valueOf:(NSString *)value;
/**
 @abstract declare an array to store all possible SDLTurnSignal values
 @return the array
 */
+ (NSArray *)values;

+ (SDLTurnSignal *)OFF;
+ (SDLTurnSignal *)LEFT;
+ (SDLTurnSignal *)RIGHT;
+ (SDLTurnSignal *)UNUSED;

@end
