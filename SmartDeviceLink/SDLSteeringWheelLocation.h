//
//  SDLSteeringWheelLocation.h
//


#import "SDLEnum.h"
/**
 Describes the location of the Steering Wheel.
 **/
@interface SDLSteeringWheelLocation : SDLEnum

/**
 @abstract get SDLSteeringWheelLocation according value string
 @param value NSString
 @return SDLSteeringWheelLocation object
 */
+ (SDLSteeringWheelLocation *)valueOf:(NSString *)value;

/**
 @abstract declare an array to store all possible SDLSteeringWheelLocation values
 @return the array
 */
+ (NSArray *)values;

+ (SDLSteeringWheelLocation *)LEFT;
+ (SDLSteeringWheelLocation *)RIGHT;
+ (SDLSteeringWheelLocation *)CENTER;

@end
