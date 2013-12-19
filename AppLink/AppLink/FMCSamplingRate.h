//  FMCSamplingRate.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * Describes different sampling rates for PerformAudioPassThru
 *
 */
@interface FMCSamplingRate : FMCEnum {}

/*!
 @abstract get FMCSamplingRate according value string
 @param value NSString
 @result FMCSamplingRate object
 */
+(FMCSamplingRate*) valueOf:(NSString*) value;
/*!
 @abstract declare an array to store all possible FMCSamplingRate values
 @result return the array
 */
+(NSMutableArray*) values;

/**
 * @abstract Sampling rate of 8 kHz
 * @result return SamplingRate of <font color=gray><i> 8KHZ </i></font>
 * @since <font color=red><b> AppLink 2.0 </b></font>
 */
+(FMCSamplingRate*) _8KHZ;
/**
 * @abstract Sampling rate of 16 kHz
 * @result return SamplingRate of <font color=gray><i> 16KHZ </i></font>
 * @since <font color=red><b> AppLink 2.0 </b></font>
 */
+(FMCSamplingRate*) _16KHZ;
/**
 * @abstract Sampling rate of 22 kHz
 * @result return SamplingRate of <font color=gray><i> 22KHZ </i></font>
 * @since <font color=red><b> AppLink 2.0 </b></font>
 */
+(FMCSamplingRate*) _22KHZ;
/**
 * @abstract Sampling rate of 44 kHz
 * @result return SamplingRate of <font color=gray><i> 44KHZ </i></font>
 * @since <font color=red><b> AppLink 2.0 </b></font>
 */
+(FMCSamplingRate*) _44KHZ;

@end
