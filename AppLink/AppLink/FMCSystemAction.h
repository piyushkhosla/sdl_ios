//  FMCSystemAction.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCSystemAction : FMCEnum {}

/**
 * Convert String to FMCSystemAction
 * @param value String
 * @return FMCSystemAction
 */
+(FMCSystemAction*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCSystemAction
 @result return an array that store all possible FMCSystemAction
 */
+(NSMutableArray*) values;

/*!
 @abstract Default_Action
 */
+(FMCSystemAction*) DEFAULT_ACTION;
/*!
 @abstract Steal_Focus
 */
+(FMCSystemAction*) STEAL_FOCUS;
/*!
 @abstract Keep_Context
 */
+(FMCSystemAction*) KEEP_CONTEXT;

@end
