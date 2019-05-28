//
//  SDLDeleteWindow.h
//

#import <SmartDeviceLink/SmartDeviceLink.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *
 * Deletes previously created window of the SDL application.
 *
 */
@interface SDLDeleteWindow : SDLRPCRequest

- (instancetype)initWithId:(UInt32)windowID;

/**
 * This is the unique ID assigned to the window that this RPC is intended.
 * If this param is not included, it will be assumed that this request is specifically for the main window on the main display. See PredefinedWindows enum. 
 *
 */
@property (strong, nonatomic) NSNumber<SDLInt> *windowID;



@end

NS_ASSUME_NONNULL_END
