//  FMCDeviceInfo.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

@interface FMCDeviceInfo : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSString* hardware;
@property(assign) NSString* firmwareRev;
@property(assign) NSString* os;
@property(assign) NSString* osVersion;
@property(assign) NSString* carrier;
@property(assign) NSNumber* maxNumberRFCOMMPorts;

@end
