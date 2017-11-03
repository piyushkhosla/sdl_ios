//
//  SDLTpms.h
//  SmartDeviceLink-iOS
//


#import "SDLEnum.h"
/**
 * Enumeration listing possible SDLTpms values.
 *
 */
typedef SDLEnum SDLTpms SDL_SWIFT_ENUM;

/**
 * @abstract SDLTpms state is : UNKNOWN.
 */
extern SDLTpms const SDLTpmsSateUnknown;

/**
 * Tpms system is in a state of Fault
 **/
extern SDLTpms const SDLTpmsSateSystemFault;

/**
 * Sensor is faulty
 **/
extern SDLTpms const SDLTpmsSateSensorFault;

/**
 Low Composite state
 **/
extern SDLTpms const SDLTpmsSateLow;

/**
 *System Active Composite state
 **/
extern SDLTpms const SDLTpmsSateSystemActive;

/**
 *Train left front tire
 **/
extern SDLTpms const SDLTpmsSateTrainLfTire;

/**
 * Train right front tire
 **/
extern SDLTpms const SDLTpmsSateTrainRfTire;

/**
 *Train right rear tire
 **/
extern SDLTpms const SDLTpmsSateTrainRrTire;

/**
 *Train outer right rear tire
 **/
extern SDLTpms const SDLTpmsSateTrainOrrTire;

/**
 *Train inner right rear tire
 **/
extern SDLTpms const SDLTpmsSateTrainIrrTire;

/**
 *Train left rear tire
 **/
extern SDLTpms const SDLTpmsSateTrainLrTire;

/**
 *Train outer left rear tire
 **/
extern SDLTpms const SDLTpmsSateTrainOlrTire;

/**
 *Train inner left rear tire
 **/
extern SDLTpms const SDLTpmsSateTrainIlrTire;

/**
 *Training Complete
 **/
extern SDLTpms const SDLTpmsSateTrainingComplete;

/**
 *Tires are not trained
 **/
extern SDLTpms const SDLTpmsSateTiresNotTrained;
