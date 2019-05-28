//
//  SDLWindowCapability.h
//

#import "SDLRPCMessage.h"
#import "SDLImageType.h"

@class SDLTextField;
@class SDLImageField;
@class SDLButtonCapabilities;
@class SDLSoftButtonCapabilities;

NS_ASSUME_NONNULL_BEGIN

@interface SDLWindowCapability : SDLRPCStruct

- (instancetype)initWithID:(UInt32)windowID textFields:(nullable NSArray<SDLTextField *> *)textFields imageFields:(nullable NSArray<SDLImageField *> *)imageFields imageTypeSupported:(nullable NSArray<SDLImageType> *)imageTypeSupported templatesAvailable:(nullable NSArray<NSString *> *)templatesAvailable numCustomPresetsAvailable:(nullable NSArray<SDLInt> *)numCustomPresetsAvailable buttonCapabilities:(nullable NSArray<SDLButtonCapabilities *> *)buttonCapabilities softButtonCapabilities:(nullable NSArray<SDLSoftButtonCapabilities *> *)softButtonCapabilities;

/**
 * This is the unique ID assigned to the window that this RPC is intended.
 * If this param is not included, it will be assumed that this request is specifically for the main window on the main display. See PredefinedWindows enum. (NSArray<NSNumber<SDLInt> *)
 *
 */
@property (nullable, strong, nonatomic) NSNumber<SDLInt> *windowID;

/**
 *  A set of all fields that support text data. See TextField.
 *
 *  Array of SDLTextField, Optional, minsize="1" maxsize="100"
 */
@property (nullable, strong, nonatomic) NSArray<SDLTextField *> *textFields;

/**
 *  A set of all fields that support images. See ImageField.
 *
 *  Array of SDLImageField, Optional, minsize="1" maxsize="100"
 */
@property (nullable, strong, nonatomic) NSArray<SDLImageField *> *imageFields;

/**
 *  Provides information about image types supported by the system.
 *
 *  Array of SDLImageType, Optional, minsize="1" maxsize="1000"
 */
@property (nullable, strong, nonatomic) NSArray<SDLImageType> *imageTypeSupported;

/**
 *  A set of all window templates available on the head unit.
 *
 *  Array of NSString, Optional, minsize="1" maxsize="1000"
 */
@property (nullable, strong, nonatomic) NSArray<NSString *> *templatesAvailable;

/**
 *  The number of on-window custom presets available (if any); otherwise omitted.
 *
 *  Array of NSNumber, Optional, minsize="1" maxsize="100"
 */
@property (nullable, strong, nonatomic) NSArray<NSNumber<SDLInt> *> *numCustomPresetsAvailable;

/**
 Provides information about the capabilities of a SDL HMI button.
 
 Optional, Array of length 1 - 100, of SDLButtonCapabilities
 */
@property (nullable, strong, nonatomic) NSArray<SDLButtonCapabilities *> *buttonCapabilities;

/**
 Contains information about a SoftButton's capabilities.
 
 Optional, Array of length 1 - 100, of SDLSoftButtonCapabilities
 */
@property (nullable, strong, nonatomic) NSArray<SDLSoftButtonCapabilities *> *softButtonCapabilities;


@end

NS_ASSUME_NONNULL_END
