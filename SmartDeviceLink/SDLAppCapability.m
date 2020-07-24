//
//  SDLAppCapability.m
//  SmartDeviceLink
//

#import "SDLAppCapability.h"
#import "SDLRPCParameterNames.h"
#import "SDLVideoStreamingCapability.h"
#import "NSMutableDictionary+Store.h"


@implementation SDLAppCapability

- (instancetype)initWithAppCapabilityType:(SDLAppCapabilityType)appCapabilityType {
    self = [super init];
    if (!self) {
        return self;
    }

    self.appCapabilityType = appCapabilityType;

    return self;
}

-(instancetype)initWithAppCapabilityType:(SDLAppCapabilityType)appCapabilityType videoStreamingCapability:(SDLVideoStreamingCapability *)videoStreamingCapability {
    self = [self initWithAppCapabilityType:appCapabilityType];
    if (!self) {
        return self;
    }

    self.videoStreamingCapability = videoStreamingCapability;

    return self;
}

- (void)setAppCapabilityType:(SDLAppCapabilityType)appCapabilityType {
    [self.store sdl_setObject:appCapabilityType forName:SDLRPCParameterNameAppCapabilityType];
}

- (SDLAppCapabilityType)appCapabilityType {
    NSError *error = nil;
    return [self.store sdl_objectForName:SDLRPCParameterNameAppCapabilityType ofClass:NSString.class error:&error];
}

- (void)setVideoStreamingCapability:(SDLVideoStreamingCapability *)videoStreamingCapability {
    [self.store sdl_setObject:videoStreamingCapability forName:SDLRPCParameterNameVideoStreamingCapability];
}

- (SDLVideoStreamingCapability *)videoStreamingCapability {
    NSError *error = nil;
    return [self.store sdl_objectForName:SDLRPCParameterNameVideoStreamingCapability ofClass:SDLVideoStreamingCapability.class error:&error];
}



@end
