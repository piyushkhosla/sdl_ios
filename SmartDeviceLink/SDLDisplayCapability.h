//
//  SDLDisplayCapability.h
//

#import "SDLRPCMessage.h"

@class SDLWindowTypeCapabilities;
@class SDLWindowCapability;

NS_ASSUME_NONNULL_BEGIN

@interface SDLDisplayCapability : SDLRPCStruct

- (instancetype)initWithDisplayName:(nullable NSString *)displayName windowTypeSupported:(nullable NSArray<SDLWindowTypeCapabilities *> *)windowTypeSupported windowCapabilities:(nullable NSArray<SDLWindowCapability *> *)windowCapabilities;

/**
 *
 * Informs the application how many windows the app is allowed to create per type.
 *
 */
@property (strong, nonatomic) NSString *displayName;

/**
 *
 * Informs the application how many windows the app is allowed to create per type.
 *
 *  Array of NSString, Optional, minsize="1"
 */
@property (strong, nonatomic) NSArray<SDLWindowTypeCapabilities *> *windowTypeSupported;

/**
 *
 *  Contains a list of capabilities of all windows related to the app.
 *  Once the app has registered the capabilities of all windows are provided.
 *  GetSystemCapability still allows requesting window capabilities of all windows.
 *  After registration, only windows with capabilities changed will be included. Following cases will cause only affected windows to be included:
 *  1. App creates a new window. After the window is created, a system capability notification will be sent related only to the created window.
 *  2. App sets a new template to the window. The new template changes window capabilties. The notification will reflect those changes to the single window.
 *
 *  Array of NSString, Optional, minsize="1" maxsize="1000"
 *
 */
@property (strong, nonatomic) NSArray<SDLWindowCapability *> *windowCapabilities;

@end

NS_ASSUME_NONNULL_END
