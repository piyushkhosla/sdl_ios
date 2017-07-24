//
//  SDLSystemCapability.h
//

#import "SDLRPCMessage.h"
@class SDLSystemCapabilityType;
@class SDLNavigationCapability;
@class SDLRemoteControlCapabilities;
@class SDLPhoneCapability;

/**
 * @abstract indicates which type of data should be changed
 * identifies which data object exists in SDLSystemCapability
 * For example, if the SystemCapability Type is NAVIGATION then a "navigationCapability" should exist
 */
@interface SDLSystemCapability : SDLRPCStruct

/**
 * @abstract The major version indicates versions that is not-compatible to previous versions
 *
 * Required, SDLSystemCapabilityType
 */
@property (strong) SDLSystemCapabilityType *systemCapabilityType;

/**
 * @abstract The minor version indicates a change to a previous version that should still allow to be run on an older version (with limited functionality)
 *
 * Optional, SDLNavigationCapability
 */
@property (strong) SDLNavigationCapability *navigationCapability;


/**
 * @abstract The minor version indicates a change to a previous version that should still allow to be run on an older version (with limited functionality)
 *
 * Optional, SDLPhoneCapability
 */
@property (strong) SDLPhoneCapability *phoneCapability;

/**
 * @abstract The minor version indicates a change to a previous version that should still allow to be run on an older version (with limited functionality)
 *
 * Optional, SDLRemoteControlCapabilities
 */
@property (strong) SDLRemoteControlCapabilities *remoteControlCapability;

@end
