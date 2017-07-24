//
//  SDLRadioControlCapabilities.h
//

#import "SDLRPCMessage.h"
/**
 * Contains information about a radio control module's capabilities.
 */
@interface SDLRadioControlCapabilities : SDLRPCStruct

/**
 * @abstractThe short friendly name of the climate control module.
 * It should not be used to identify a module by mobile application.
 *
 * Max string length 100 chars
 */
@property (strong) NSString *moduleName;

/**
 * @abstract Availability of the control of enable/disable radio.
 * True: Available, False: Not Available, Not present: Not Available.
 *
 * Optional, Boolean
 */
@property (strong) NSNumber *radioEnableAvailable;

/**
 * @abstract  Availability of the control of radio band.
 * True: Available, False: Not Available, Not present: Not Available.
 *
 * Optional, Boolean
 */
@property (strong) NSNumber *radioBandAvailable;

/**
 * @abstract Availability of the control of radio frequency.
 * True: Available, False: Not Available, Not present: Not Available.
 *
 * Optional, Boolean
 */
@property (strong) NSNumber *radioFrequencyAvailable;

/**
 * @abstract Availability of the control of HD radio channel.
 * True: Available, False: Not Available, Not present: Not Available.
 *
 * Optional, Boolean
 */
@property (strong) NSNumber *hdChannelAvailable;

/**
 * @abstract Availability of the getting Radio Data System (RDS) data.
 * True: Available, False: Not Available, Not present: Not Available.
 *
 * Optional, Boolean
 */
@property (strong) NSNumber *rdsDataAvailable;

/**
 * @abstract Availability of the getting the number of available HD channels.
 * True: Available, False: Not Available, Not present: Not Available.
 *
 * Optional, Boolean
 */
@property (strong) NSNumber *availableHDsAvailable;

/**
 * @abstract Availability of the getting the Radio state.
 * True: Available, False: Not Available, Not present: Not Available.
 *
 * Optional, Boolean
 */
@property (strong) NSNumber *stateAvailable;

/**
 * @abstract Availability of the getting the signal strength.
 * True: Available, False: Not Available, Not present: Not Available.
 *
 * Optional, Boolean
 */
@property (strong) NSNumber *signalStrengthAvailable;

/**
 * @abstract Availability of the getting the signal Change Threshold
 * True: Available, False: Not Available, Not present: Not Available.
 *
 * Optional, Boolean
 */
@property (strong) NSNumber *signalChangeThresholdAvailable;

@end
