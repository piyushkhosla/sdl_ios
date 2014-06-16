//
//  FMCRPCPayloadMessage
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>

@interface FMCRPCPayloadMessage : NSObject

@property (assign) Byte rpcType;
@property (assign) UInt32 functionID;
@property (assign) UInt32 correlationID;
@property (assign) UInt32 jsonSize;
@property (strong) NSData *payload;

- (NSData *)data;

@end
