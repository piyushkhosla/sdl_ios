//
//  FMCTouchType.h
//  AppLink
//
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCTouchType : FMCEnum

+ (NSMutableArray*)values;
+ (FMCTouchType*)valueOf:(NSString*) value;
+ (FMCTouchType*)BEGIN;
+ (FMCTouchType*)MOVE;
+ (FMCTouchType*)END;

@end

