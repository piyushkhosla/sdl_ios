//  FMCSpeechCapabilities.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * Contains information about TTS capabilities on the SYNC platform.
 *
 * Avaliable since <font color=red><b> AppLink 1.0 </b></font>
 */
@interface FMCSpeechCapabilities : FMCEnum {}

/*!
 @abstract get FMCSpeechCapabilities according value string
 @param value NSString
 @result FMCSpeechCapabilities object
 */
+(FMCSpeechCapabilities*) valueOf:(NSString*) value;
/*!
 @abstract declare an array to store all possible FMCSpeechCapabilities values
 @result return the array
 */
+(NSMutableArray*) values;

/**
 * @abstract The SYNC platform can speak text phrases.
 * @result return FMCSpeechCapabilities of value : <font color=gray><i> TEXT </i></font>
 * @since AppLink 1.0
 */
+(FMCSpeechCapabilities*) TEXT;
/*!
 @abstract SAPI_PHONEMES
 */
+(FMCSpeechCapabilities*) SAPI_PHONEMES;
/*!
 @abstract LHPLUS_PHONEMES
 */
+(FMCSpeechCapabilities*) LHPLUS_PHONEMES;
/*!
 @abstract PRE_RECORDED
 */
+(FMCSpeechCapabilities*) PRE_RECORDED;
/*!
 @abstract SILENCE
 */
+(FMCSpeechCapabilities*) SILENCE;

@end
