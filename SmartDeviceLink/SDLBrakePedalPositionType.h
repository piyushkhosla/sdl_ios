//
//  SDLBrakePedalPositionType.h


#import <SmartDeviceLink/SmartDeviceLink.h>

@interface SDLBrakePedalPositionType : SDLRPCStruct

/**
 * @abstract
 *      Brake pedal position (percentage depressed).
 * Float 0 - 100
 */
@property (strong, nonatomic) NSNumber *value;

/**
 * @abstract
 *      The time that this steering wheel angle was recorded.
 */
@property (strong, nonatomic) SDLTimeStampType *timeStamp;


@end

