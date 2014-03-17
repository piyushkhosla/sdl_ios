//  FMCTextAlignment.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * The list of possible alignments of text in a field. May only work on some display types.
 *
 * Avaliable since <font color=red><b> AppLink 1.0 </b></font>
 */
@interface FMCTextAlignment : FMCEnum {}

/**
 * Convert String to FMCTextAlignment
 * @param value String
 * @return FMCTextAlignment
 */
+(FMCTextAlignment*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCTextAlignment
 @result return an array that store all possible FMCTextAlignment
 */
+(NSMutableArray*) values;

/**
 * @abstract Text aligned left.
 * @result return a FMCTextAlignment object with value of <font color=gray><i> LEFT_ALIGNED </i></font>
 */
+(FMCTextAlignment*) LEFT_ALIGNED;
/**
 * @abstract Text aligned right.
 * @result return a FMCTextAlignment object with value of <font color=gray><i> RIGHT_ALIGNED </i></font>
 */
+(FMCTextAlignment*) RIGHT_ALIGNED;
/**
 * @abstract Text aligned centered.
 * @result return a FMCTextAlignment object with value of <font color=gray><i> CENTERED </i></font>
 */
+(FMCTextAlignment*) CENTERED;

@end
