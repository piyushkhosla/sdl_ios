//
//  SDLFuelType.h


#import "SDLEnum.h"

/**
* Enumeration listing possible fuel types.
*
*/
@interface SDLFuelType : SDLEnum

/**
* @abstract Convert String to SDLFuelType
*
* @param value String value to retrieve the object for
*
* @return SDLFuelType
*/
+ (SDLFuelType *)valueOf:(NSString *)value;

/**
 * @abstract Store the enumeration of all possible SDLFuelType
 *
 * @return an array that store all possible SDLFuelType
 */
+ (NSArray *)values;

/**
 * @abstract fuel type: GASOLINE
 *
 * @return SDLFuelType with value of *GASOLINE*
 */
+ (SDLFuelType *)GASOLINE;

/**
 * @abstract fuel type: DIESEL
 *
 * @return SDLFuelType with value of *DIESEL*
 */
+ (SDLFuelType *)DIESEL;

/**
 * @abstract fuel type: CNG
 * For vehicles using compressed natural gas.
 * @return SDLFuelType with value of *CNG*
 */
+ (SDLFuelType *)CNG;

/**
 * @abstract fuel type: LPG
 * For vehicles using liquefied petroleum gas.
 * @return SDLFuelType with value of *LPG*
 */
+ (SDLFuelType *)LPG;

/**
 * @abstract fuel type: HYDROGEN
 * For FCEV (fuel cell electric vehicle).
 * @return SDLFuelType with value of *HYDROGEN*
 */
+ (SDLFuelType *)HYDROGEN;

/**
 * @abstract fuel type: BATTERY
 * For BEV (Battery Electric Vehicle)
 * PHEV (Plug-in Hybrid Electric Vehicle)
 * and solar vehicles and other vehicles which run on a battery.
 * @return SDLFuelType with value of *BATTERY*
 */
+ (SDLFuelType *)BATTERY;


@end
