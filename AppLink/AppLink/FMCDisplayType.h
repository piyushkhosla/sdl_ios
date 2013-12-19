//  FMCDisplayType.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * Identifies the various display types used by SYNC. See AppLink TDK and Head Unit Guide for further information regarding the displays.
 *
 * This enum is avaliable since <font color=red><b>AppLink 1.0</b></font>
 */
@interface FMCDisplayType : FMCEnum {}

/**
 * Convert String to FMCDisplayType
 * @param value String
 * @return FMCDisplayType
 */
+(FMCDisplayType*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCDisplayType
 @result return an array that store all possible FMCDisplayType
 */
+(NSMutableArray*) values;

/**
 * @abstract This display type provides a 2-line x 20 character "dot matrix" display.
 * @result return FMCDisplayType with value of <font color=gray><i> CID </i></font>
 */
+(FMCDisplayType*) CID;
+(FMCDisplayType*) TYPE2;
+(FMCDisplayType*) TYPE5;
/**
 * @abstract This display type provides an 8 inch touchscreen display.
 * @result return FMCDisplayType with value of <font color=gray><i> NGN </i></font>
 */
+(FMCDisplayType*) NGN;
+(FMCDisplayType*) GEN2_4_DMA;
+(FMCDisplayType*) GEN2_8_DMA;
+(FMCDisplayType*) GEN2_4_HUD;
+(FMCDisplayType*) MFD3;
+(FMCDisplayType*) MFD4;
+(FMCDisplayType*) MFD5;

@end
