//  FMCBitsPerSample.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * Describes different bit depth options for PerformAudioPassThru
 *
 */
@interface FMCBitsPerSample : FMCEnum {}

/**
 * @abstract Convert String to FMCBitsPerSample
 * @param value NSString
 * @result FMCBitsPerSample
 */
+(FMCBitsPerSample*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCBitsPerSample
 @result return an array that store all possible FMCBitsPerSample
 */
+(NSMutableArray*) values;

/**
 * @abstract 8 bits per sample
 * @since <font color=red><b>AppLink 2.0</b></font>
 * @result return a FMCBitsPerSample with value of <font color=gray></i>8_bit</i></font>
 */
+(FMCBitsPerSample*) _8_BIT;
/**
 * @abstract 16 bits per sample
 * @since <font color=red><b>AppLink 2.0</b></font>
 * @result return a FMCBitsPerSample with value of <font color=gray></i>16_bit</i></font>
 */
+(FMCBitsPerSample*) _16_BIT;

@end
