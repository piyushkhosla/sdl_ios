//
//  SDLWindowTypeCapabilities.h
//

#import "SDLRPCMessage.h"
#import "SDLWindowType.h"


NS_ASSUME_NONNULL_BEGIN

@interface SDLWindowTypeCapabilities : SDLRPCStruct

- (instancetype)initWithType:(SDLWindowType)type maximumNumberOfWindows:(UInt32)maximumNumberOfWindows;

@property (strong, nonatomic) SDLWindowType type;


@property (strong, nonatomic) NSNumber<SDLInt> *maximumNumberOfWindows;


@end

NS_ASSUME_NONNULL_END
