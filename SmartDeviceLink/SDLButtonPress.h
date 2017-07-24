//
//  SDLButtonPress.h
//

#import "SDLRPCRequest.h"
@class SDLModuleType;
@class SDLButtonName;
@class SDLButtonPressMode;

@interface SDLButtonPress : SDLRPCRequest

/**
 * Constructs a new SDLButtonPress object
 */
- (instancetype)init;
/**
 * Constructs a new SDLButtonPress object indicated by the dictionary parameter
 * <p>
 *
 * @param dict The dictionary to use
 */
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

/**
 * The module where the button should be pressed.
 *
 */
@property (strong) SDLModuleType *moduleType;

/**
 * The name of supported RC climate or radio button.
 *
 */
@property (strong) SDLButtonName *buttonName;

/**
 * Indicates whether this is a LONG or SHORT button press event.
 *
 */
@property (strong) SDLButtonPressMode *buttonPressMode;


@end
