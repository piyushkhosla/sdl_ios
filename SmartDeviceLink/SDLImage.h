//  SDLImage.h
//

#import "SDLRPCMessage.h"

#import "SDLImageType.h"

/**
 *Specifies, which image shall be used, e.g. in SDLAlerts or on SDLSoftbuttons provided the display supports it.
 * 
 * @since SDL 2.0
 */

NS_ASSUME_NONNULL_BEGIN

@interface SDLImage : SDLRPCStruct

- (instancetype)initWithName:(NSString *)name ofType:(SDLImageType)imageType;

- (instancetype)initWithName:(NSString *)name ofType:(SDLImageType)imageType isTemplate:(BOOL)isTemplate;

/**
 * @abstract The static hex icon value or the binary image file name identifier (sent by SDLPutFile)
 *
 * Required, max length = 65535
 */
@property (strong, nonatomic) NSString *value;

/**
 * @abstract Describes, whether it is a static or dynamic image
 *
 * Required
 */
@property (strong, nonatomic) SDLImageType imageType;


/**
 * @abstract If true, HMI decides the coloring for the uploaded images.
 *
 * Optional, Boolean
 */
@property (strong, nonatomic) NSNumber *isTemplate;

@end

NS_ASSUME_NONNULL_END
