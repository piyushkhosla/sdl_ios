//  FMCISyncProxy.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCProtocol.h>
#import <AppLink/FMCProxyListener.h>
#import <AppLink/FMCRPCMessage.h>
#import <AppLink/FMCTransport.h>

@protocol FMCISyncProxy

-(id) initWithTransport:(NSObject<FMCTransport>*) transport protocol:(NSObject<FMCProtocol>*) protocol delegate:(NSObject<FMCProxyListener>*) delegate;

-(void) dispose;
-(void) addDelegate:(NSObject<FMCProxyListener>*) delegate;

-(void) sendRPCRequest:(FMCRPCMessage*) msg;
-(void) handleRpcMessage:(NSDictionary*) msg;

@end
