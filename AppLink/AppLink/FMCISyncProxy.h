//  FMCISyncProxy.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCProxyListener.h>
#import <AppLink/FMCRPCMessage.h>
#import <AppLink/FMCTransport.h>
#import "FMCAbstractProtocol.h"

@protocol FMCISyncProxy

-(id) initWithTransport:(NSObject<FMCTransport>*) transport protocol:(FMCAbstractProtocol*) protocol delegate:(NSObject<FMCProxyListener>*) delegate;

-(void) dispose;
-(void) addDelegate:(NSObject<FMCProxyListener>*) delegate;

-(void) sendRPCRequest:(FMCRPCMessage*) msg;
-(void) handleRpcMessage:(NSDictionary*) msg;

@end
