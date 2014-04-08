//  FMCOnSyncPData.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCNotification.h>

@interface FMCOnSyncPData : FMCRPCNotification {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSString* URL;
@property(assign) NSNumber* Timeout;

@end
