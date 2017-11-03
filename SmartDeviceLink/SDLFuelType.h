//
//  SDLFuelType.h


#import "SDLEnum.h"

/**
* Enumeration listing possible fuel types.
*
*/
typedef SDLEnum SDLFuelType SDL_SWIFT_ENUM;

/**
 * @abstract fuel type: GASOLINE
 *
 */
extern SDLFuelType const SDLFuelTypeGasoline;

/**
 * @abstract fuel type: DIESEL
 *
 */
extern SDLFuelType const SDLFuelTypeDiesel;

/**
 * @abstract fuel type: CNG
 * For vehicles using compressed natural gas.
 */
extern SDLFuelType const SDLFuelTypeCNG;

/**
 * @abstract fuel type: LPG
 * For vehicles using liquefied petroleum gas.
 */
extern SDLFuelType const SDLFuelTypeLPG;
/**
 * @abstract fuel type: HYDROGEN
 * For FCEV (fuel cell electric vehicle).
 */
extern SDLFuelType const SDLFuelTypeHydrogen;

/**
 * @abstract fuel type: BATTERY
 * For BEV (Battery Electric Vehicle)
 * PHEV (Plug-in Hybrid Electric Vehicle)
 * and solar vehicles and other vehicles which run on a battery.
 */
extern SDLFuelType const SDLFuelTypeBattery;

