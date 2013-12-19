//  FMCSoftButtonType.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/*!
 SoftButtonType (TEXT / IMAGE / BOTH)
 */
@interface FMCSoftButtonType : FMCEnum {}

/*!
 @abstract get FMCSoftButtonType according value string
 @param value NSString
 @result FMCSoftButtonType object
 */
+(FMCSoftButtonType*) valueOf:(NSString*) value;
/*!
 @abstract declare an array to store all possible FMCSoftButtonType values
 @result return the array
 */
+(NSMutableArray*) values;

/*!
 @abstract Text kind Softbutton
 @result FMCSoftButtonType object with string value <font color=gray><i> TEXT </i></font>
 */
+(FMCSoftButtonType*) TEXT;
/*!
 @abstract Image kind Softbutton
 @result FMCSoftButtonType object with string value <font color=gray><i> IMAGE </i></font>
 */
+(FMCSoftButtonType*) IMAGE;
/*!
 @abstract Both (Text & Image) kind Softbutton
 @result FMCSoftButtonType object with string value <font color=gray><i> BOTH </i></font>
 */
+(FMCSoftButtonType*) BOTH;

@end
