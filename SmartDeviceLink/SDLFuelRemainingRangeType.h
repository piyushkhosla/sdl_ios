//
//  SDLFuelRemainingRangeType.h


#import <SmartDeviceLink/SmartDeviceLink.h>
@class SDLTimeStampType;

@interface SDLFuelRemainingRangeType : SDLRPCStruct

/**
 * @abstract
 *      Vehicle's remaining range.
 * Float 0 - 1000
 */
@property (strong, nonatomic) NSNumber *value;

/**
 * @abstract
 *      The time that this fuel remaining range was recorded.
 */
@property (strong, nonatomic) SDLTimeStampType *timeStamp;

@end

