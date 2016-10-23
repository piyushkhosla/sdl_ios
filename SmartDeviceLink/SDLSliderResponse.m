//  SDLSliderResponse.m
//


#import "SDLSliderResponse.h"

#import "SDLNames.h"

@implementation SDLSliderResponse

- (instancetype)init {
    if (self = [super initWithName:SDLNameSlider]) {
    }
    return self;
}

- (void)setSliderPosition:(NSNumber<SDLInt> *)sliderPosition {
    if (sliderPosition != nil) {
        [parameters setObject:sliderPosition forKey:SDLNameSliderPosition];
    } else {
        [parameters removeObjectForKey:SDLNameSliderPosition];
    }
}

- (NSNumber<SDLInt> *)sliderPosition {
    return [parameters objectForKey:SDLNameSliderPosition];
}

@end
