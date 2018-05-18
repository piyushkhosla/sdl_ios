//  SDLSingleTireStatus.h
//

#import "SDLRPCMessage.h"

#import "SDLComponentVolumeStatus.h"
#import "SDLTPMS.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * Tire pressure status of a single tire.
 *
 * @since SmartDeviceLink 2.0
 */
@interface SDLSingleTireStatus : SDLRPCStruct

/**
 * The volume status of a single tire

 Required
 */
@property (strong, nonatomic) SDLComponentVolumeStatus status;

/**
 * @abstract The status of TPMS according to the particular tire.
 */
@property (strong, nonatomic) SDLTPMS tpms;

/**
 * The pressure value of the particular tire in kilo pascal.
 *
 * Float,  0 - 2000
 */
@property (strong, nonatomic) NSNumber<SDLFloat> *pressure;

@end

NS_ASSUME_NONNULL_END
