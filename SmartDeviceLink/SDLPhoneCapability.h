//
//  SDLPhoneCapability.h
//

#import "SDLRPCMessage.h"

/**
 * Extended capabilities of the module's phone feature
 */
@interface SDLPhoneCapability : SDLRPCStruct

/**
 * @abstract Bool value which tells If the module has the abiulity to perform dial number
 *
 * optional, 1/0 NSNumber
 */
@property (strong) NSNumber *dialNumberEnabled;




@end
