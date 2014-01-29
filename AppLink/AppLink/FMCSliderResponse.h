//  FMCSliderResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/**
 * Slider Response is sent, when Slider has been called
 *
 * Since AppLink 2.0
 */
@interface FMCSliderResponse : FMCRPCResponse {}

/**
 * @abstract Constructs a new FMCSliderResponse object
 */
-(id) init;
/**
 * @abstract Constructs a new FMCSliderResponse object indicated by the NSMutableDictionary
 * parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract The selected position of the slider.
 */
@property(assign) NSNumber* sliderPosition;

@end
