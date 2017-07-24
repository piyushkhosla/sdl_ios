//
//  SDLModuleType.h
//

#import "SDLEnum.h"

@interface SDLModuleType : SDLEnum

/**
 * @abstract Convert String to SDLModuleType
 * @param value The value of the string to get an object for
 * @return SDLModuleType
 */
+ (SDLModuleType *)valueOf:(NSString *)value;

/**
 * @abstract Store the enumeration of all possible SDLModuleType
 * @return An array that store all possible SDLModuleType
 */
+ (NSArray *)values;

/**
 * @return A SDLModuleType with the value of *CLIMATE*
 */
+ (SDLModuleType *)CLIMATE;

/**
 * @return A SDLModuleType with the value of *RADIO*
 */
+ (SDLModuleType *)RADIO;


@end
