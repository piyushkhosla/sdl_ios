//  FMCAudioType.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/*!
 Describes different audio type options for PerformAudioPassThru
 */
@interface FMCAudioType : FMCEnum {}

/**
 * @abstract Convert String to FMCAudioType
 * @param value NSString
 * @result FMCAudioType
 */
+(FMCAudioType*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCAudioType
 @result return an array that store all possible FMCAudioType
 */
+(NSMutableArray*) values;

/*!
 @abstract PCM raw audio
 @since <font color=red><b>AppLink 2.0</b></font>
 @result FMCAudioType with value of <font color=gray><i>PCM</i></font>
 */
+(FMCAudioType*) PCM;

@end
