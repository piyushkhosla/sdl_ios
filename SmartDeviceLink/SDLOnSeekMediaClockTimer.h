//
//  SDLOnSeekMediaClockTimer.h
//

#import "SDLRPCNotification.h"

@class SDLStartTime;


/**
 * Callback for the seek media clock timer notification. 
 * Notification is triggered when the user selects a position 
 * and releases the mediaclock timer or when the user selects
 * a position and holds for a full 2 second period.  System 
 * will automatically the media clock timer position based on
 * the seek notification location.
 *
 */
@interface SDLOnSeekMediaClockTimer : SDLRPCNotification

/**
 * Constructs a newly allocated SDLOnSeekMediaClockTimer object
 */
- (instancetype)init;

/**
 * Constructs a newly allocated SDLOnSeekMediaClockTimer object indicated by the dictionary parameter
 * @param dict The dictionary to use
 */
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

/**
 *
 * @see SDLStartTime
 *
 */
@property (strong) SDLStartTime *seekTime;

@end
