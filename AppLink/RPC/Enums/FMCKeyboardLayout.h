//  FMCKeyboardLayout.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCKeyboardLayout : FMCEnum {}

+(FMCKeyboardLayout*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCKeyboardLayout*) QWERTY;
+(FMCKeyboardLayout*) QWERTZ;
+(FMCKeyboardLayout*) AZERTY;

@end
