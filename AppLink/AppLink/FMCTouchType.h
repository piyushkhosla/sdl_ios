//  FMCTouchType.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCTouchType : FMCEnum {}

+(FMCTouchType*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCTouchType*) BEGIN;
+(FMCTouchType*) MOVE;
+(FMCTouchType*) END;

@end
