//  FMCCharacterSet.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * Character sets supported by SYNC.
 *
 * This enum is avaliable since <font color=red><b>AppLink 1.0</b></font>
 */
@interface FMCCharacterSet : FMCEnum {}

/*!
 @abstract Convert String to FMCCharacterSet
 @param value NSString
 @result FMCCharacterSet
 */
+(FMCCharacterSet*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCCharacterSet
 @result return an array that store all possible FMCCharacterSet
 */
+(NSMutableArray*) values;

+(FMCCharacterSet*) TYPE2SET;
+(FMCCharacterSet*) TYPE5SET;
+(FMCCharacterSet*) CID1SET;
+(FMCCharacterSet*) CID2SET;

@end