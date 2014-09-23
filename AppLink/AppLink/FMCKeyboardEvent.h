//  FMCKeyboardEvent.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCKeyboardEvent : FMCEnum {}

+(FMCKeyboardEvent*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCKeyboardEvent*) KEYPRESS;
+(FMCKeyboardEvent*) ENTRY_SUBMITTED;
+(FMCKeyboardEvent*) ENTRY_CANCELLED;
+(FMCKeyboardEvent*) ENTRY_ABORTED;

@end
