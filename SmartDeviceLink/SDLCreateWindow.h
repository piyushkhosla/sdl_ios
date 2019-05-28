//  SDLCreateWindow.h
//

#import <SmartDeviceLink/SmartDeviceLink.h>
#import "SDLWindowType.h"


NS_ASSUME_NONNULL_BEGIN

/**
 *
 * Create a new window on the display with the specified window type.
 *
 */

@interface SDLCreateWindow : SDLRPCRequest

- (instancetype)initWithId:(UInt32)windowID name:(NSString *)name type:(SDLWindowType)type;

- (instancetype)initWithId:(UInt32)windowID name:(NSString *)name type:(SDLWindowType)type associatedServiceType:(NSString *)associatedServiceType duplicateUpdatesFromWindowID:(UInt32)duplicateUpdatesFromWindowID;


/**
 * This is the unique ID assigned to the window that this RPC is intended.
 * If this param is not included, it will be assumed that this request is specifically for the main window on the main display. See PredefinedWindows enum.
 *
 */
@property (strong, nonatomic) NSNumber<SDLInt> *windowID;

/**
 * The window name to be used by the HMI.
 * The name of the pre-created default window will match the app name.
 * Multiple apps can share the same window name except for the default main window.
 * Creating a window with a name which is already in use by the app will result in `DUPLICATE_NAME`.
 *
 *  String, Required, maxlength="100"
 */
@property (strong, nonatomic) NSString *windowName;

/**
 * The type of the window to be created. Main window or widget.
 */
@property (strong, nonatomic) SDLWindowType type;

/**
 * Allows an app to create a widget related to a specific service type.
 * As an example if a `MEDIA` app becomes active, this app becomes audible and is allowed to play audio. Actions such as skip or play/pause will be
 * directed to this active media app. In case of widgets, the system can provide a single "media" widget which will act as a placeholder for the active media app.
 * It is only allowed to have one window per service type. This means that a media app can only have a single MEDIA widget.
 * Still the app can create widgets omitting this parameter. Those widgets would be available as app specific widgets that are permanently included in the HMI.
 
 * This parameter is related to widgets only. The default main window, which is pre-created during app registration, will be created based on the HMI types specified in the app registration request.
 *  Optional,  String
 */
@property (nullable, strong, nonatomic) NSString *associatedServiceType;

/**
 * Specify whether the content sent to an existing window
 * should be duplicated to the created window.
 * If there isn't a window with the ID, the request will be rejected with `INVALID_DATA`.
 *
 * Optional, Integer
 */
@property (nullable, strong, nonatomic) NSNumber<SDLInt> *duplicateUpdatesFromWindowID;

@end

NS_ASSUME_NONNULL_END
