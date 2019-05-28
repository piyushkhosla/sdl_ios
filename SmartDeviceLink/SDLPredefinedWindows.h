//
//  SDLPredefinedWindows.h
//


#import "SDLEnum.h"

/**
 A template layout an app uses to display information. The broad details of the layout are defined, but the details depend on the IVI system. Used in SetDisplayLayout.
 */
typedef SDLEnum SDLPredefinedWindows SDL_SWIFT_ENUM;

/**
 The default window is a main window pre-created on behalf of the app.
 */
extern SDLPredefinedWindows const SDLPredefinedWindowDefault;

/**
 The primary widget of the app.
 */
extern SDLPredefinedWindows const SDLPredefinedWindowPrimaryWidget;

