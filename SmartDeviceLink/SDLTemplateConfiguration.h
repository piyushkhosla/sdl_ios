//
//  SDLTemplateConfiguration.h
//

#import "SDLRPCMessage.h"

@class SDLTemplateColorScheme;

NS_ASSUME_NONNULL_BEGIN

@interface SDLTemplateConfiguration : SDLRPCStruct

- (instancetype)initWithTemplate:(NSString *)templateString;

- (instancetype)initWithTemplate:(NSString *)templateString dayColorScheme:(SDLTemplateColorScheme *)dayColorScheme nightColorScheme:(SDLTemplateColorScheme *)nightColorScheme;

/**
 * Predefined or dynamically created window template.
 * Currently only predefined window template layouts are defined.
 *
 * Required, Max length 500
 */
@property (strong, nonatomic) NSString *templateString;

/**
 *
 * Optional
 */
@property (nullable, strong, nonatomic) SDLTemplateColorScheme *dayColorScheme;

/**
 *
 * Optional
 */
@property (nullable, strong, nonatomic) SDLTemplateColorScheme *nightColorScheme;

@end

NS_ASSUME_NONNULL_END
