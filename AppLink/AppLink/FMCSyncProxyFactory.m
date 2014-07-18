//  FMCSyncProxyFactory.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCSyncProxyFactory.h>

#import <AppLink/FMCDebugTool.h>
#import <AppLink/FMCIAPTransport.h>
#import <AppLink/FMCTCPTransport.h>
#import <AppLink/FMCAppLinkProtocol.h>

@implementation FMCSyncProxyFactory

+(FMCSyncProxy*) buildSyncProxyWithListener:(NSObject<FMCProxyListener>*) delegate {
    FMCIAPTransport* transport = [[FMCIAPTransport alloc] init];
    FMCAppLinkProtocol* protocol = [[FMCAppLinkProtocol alloc] init];
    
    FMCSyncProxy *ret = [[FMCSyncProxy alloc] initWithTransport:transport protocol:protocol delegate:delegate];
    
    [transport release];
    [protocol release];
    
	return [ret autorelease];
}

+(FMCSyncProxy*) buildSyncProxyWithListener:(NSObject<FMCProxyListener>*) delegate
                              tcpIPAddress: (NSString*) ipaddress
                                   tcpPort: (NSString*) port {
    
    FMCTCPTransport* transport = [[FMCTCPTransport alloc] initWithEndpoint:ipaddress endpointParam:port];
    FMCAppLinkProtocol* protocol = [[FMCAppLinkProtocol alloc] init];
    
    FMCSyncProxy *ret = [[FMCSyncProxy alloc] initWithTransport:transport protocol:protocol delegate:delegate];
    
    [transport release];
    [protocol release];
    
	return [ret autorelease];
}

@end