//  FMCKeypressMode.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCKeypressMode : FMCEnum {}

+(FMCKeypressMode*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCKeypressMode*) SINGLE_KEYPRESS;
+(FMCKeypressMode*) QUEUE_KEYPRESSES;
+(FMCKeypressMode*) RESEND_CURRENT_ENTRY;

@end
