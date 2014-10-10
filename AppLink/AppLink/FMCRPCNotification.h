//  FMCRPCNotification.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

@interface FMCRPCNotification : FMCRPCMessage {}

- (id)initWithName:(NSString *)name;
- (id)initWithDictionary:(NSMutableDictionary *)dict;

@end
