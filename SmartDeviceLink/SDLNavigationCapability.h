//
//  SDLNavigationCapability.h
//

#import "SDLRPCMessage.h"

/**
 * Extended capabilities for an onboard navigation system
 */
@interface SDLNavigationCapability : SDLRPCStruct

/**
 * @abstract Bool value which tells If the module has the ability to add locations to the onboard nav
 *
 * optional, 1/0 NSNumber
 */
@property (strong) NSNumber *sendLocationEnabled;

/**
 * @abstract Bool value which tells If the module has the ability to return way points from onboard nav
 *
 * optional, 1/0 NSNumber
 */
@property (strong) NSNumber *getWayPointsEnabled;

@end
