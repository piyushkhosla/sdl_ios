//  FMCImageType.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * Contains information about the type of image.
 *
 * This enum is avaliable since <font color=red><b> AppLink 2.0 </b></font>
 */
@interface FMCImageType : FMCEnum {}

/*!
 @abstract return FMCImageType (STATIC / DYNAMIC)
 @param value NSString
 @result return FMCImageType
 */
+(FMCImageType*) valueOf:(NSString*) value;
/*!
 @abstract store all possible FMCImageType values
 @result return an array with all possible FMCImageType values inside
 */
+(NSMutableArray*) values;

/**
 * @abstract Just the static hex icon value to be used
 * @result return the Image Type with value <font color=gray><i> STATIC </i></font>
 */
+(FMCImageType*) STATIC;
/**
 * @abstract Binary image file to be used (identifier to be sent by PutFile)
 * @result return the Image Type with value <font color=gray><i> DYNAMIC </i></font>
 */
+(FMCImageType*) DYNAMIC;

@end
