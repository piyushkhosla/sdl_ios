//
//  SDLClimateControlCapabilities.h
//

#import "SDLRPCMessage.h"
#import "SDLDefrostZone.h"
#import "SDLVentilationMode.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * Contains information about a climate control module's capabilities.
 */
@interface SDLClimateControlCapabilities : SDLRPCStruct

/**
 * @abstractThe short friendly name of the climate control module.
 * It should not be used to identify a module by mobile application.
 *
 * Max string length 100 chars
 */
@property (strong, nonatomic) NSString *moduleName;

/**
 * @abstract Availability of the control of fan speed.
 * True: Available, False: Not Available, Not present: Not Available.
 *
 * Optional, Boolean
 */
@property (nullable, strong, nonatomic) NSNumber *fanSpeedAvailable;

/**
 * @abstract Availability of the control of desired temperature.
 * True: Available, False: Not Available, Not present: Not Available.
 *
 * Optional, Boolean
 */
@property (nullable, strong, nonatomic) NSNumber *desiredTemperatureAvailable;

/**
 * @abstract Availability of the control of turn on/off AC.
 * True: Available, False: Not Available, Not present: Not Available.
 *
 * Optional, Boolean
 */
@property (nullable, strong, nonatomic) NSNumber *acEnableAvailable;

/**
 * @abstract  Availability of the control of enable/disable air conditioning is ON on the maximum level.
 * True: Available, False: Not Available, Not present: Not Available.
 *
 * Optional, Boolean
 */
@property (nullable, strong, nonatomic) NSNumber *acMaxEnableAvailable;

/**
 * @abstract Availability of the control of enable/disable circulate Air mode.
 * True: Available, False: Not Available, Not present: Not Available.
 *
 * Optional, Boolean
 */
@property (nullable, strong, nonatomic) NSNumber *circulateAirEnableAvailable;

/**
 * @abstract Availability of the control of enable/disable auto mode.
 * True: Available, False: Not Available, Not present: Not Available.
 *
 * Optional, Boolean
 */
@property (nullable, strong, nonatomic) NSNumber *autoModeEnableAvailable;

/**
 * @abstract Availability of the control of enable/disable dual mode.
 * True: Available, False: Not Available, Not present: Not Available.
 *
 * Optional, Boolean
 */
@property (nullable, strong, nonatomic) NSNumber *dualModeEnableAvailable;

/**
 * @abstract Availability of the control of defrost zones.
 * True: Available, False: Not Available, Not present: Not Available.
 *
 * Optional, Boolean
 */
@property (nullable, strong, nonatomic) NSNumber *defrostZoneAvailable;

/**
 * @abstract  A set of all defrost zones that are controllable.
 *
 * Optional, NSArray of type SDLDefrostZone minsize="1" maxsize="100"
 */
@property (nullable, strong, nonatomic) NSArray<SDLDefrostZone > *defrostZone;

/**
 * @abstract Availability of the control of air ventilation mode.
 * True: Available, False: Not Available, Not present: Not Available.
 *
 * Optional, Boolean
 */
@property (nullable, strong, nonatomic) NSNumber *ventilationModeAvailable;

/**
 * @abstract  A set of all ventilation modes that are controllable.
 * True: Available, False: Not Available, Not present: Not Available.
 *
 * Optional, NSArray of type SDLVentilationMode minsize="1" maxsize="100"
 */
@property (nullable, strong, nonatomic) NSArray<SDLVentilationMode> *ventilationMode;

@end

NS_ASSUME_NONNULL_END
