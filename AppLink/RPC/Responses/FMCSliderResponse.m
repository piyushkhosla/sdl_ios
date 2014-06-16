//  FMCSliderResponse.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Responses/FMCSliderResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCSliderResponse

-(id) init {
    if (self = [super initWithName:NAMES_Slider]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setSliderPosition:(NSNumber*) sliderPosition {
    if (sliderPosition != nil) {
        [parameters setObject:sliderPosition forKey:NAMES_sliderPosition];
    } else {
        [parameters removeObjectForKey:NAMES_sliderPosition];
    }
}

-(NSNumber*) sliderPosition {
    return [parameters objectForKey:NAMES_sliderPosition];
}

@end
