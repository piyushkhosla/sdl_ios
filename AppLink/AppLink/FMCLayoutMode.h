//  FMCLayoutMode.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCLayoutMode : FMCEnum {}

+(FMCLayoutMode*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCLayoutMode*) ICONS_ONLY;
+(FMCLayoutMode*) ICONS_WITH_SEARCH;
+(FMCLayoutMode*) LIST_ONLY;
+(FMCLayoutMode*) LIST_WITH_SEARCH;
+(FMCLayoutMode*) KEYBOARD;

@end
