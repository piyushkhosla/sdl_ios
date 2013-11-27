//  FMCSyncProxyFactory.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCSyncProxyFactory.h>

#import <AppLink/FMCDebugTool.h>
#import <AppLink/FMCSyncIAPTransport.h>
#import <AppLink/FMCSyncTcpTransport.h>
#import <AppLink/FMCAppLinkProtocol.h>

@implementation FMCSyncProxyFactory

+(FMCSyncProxy*) buildSyncProxyWithListener:(NSObject<FMCProxyListener>*) delegate {
    FMCSyncIAPTransport* transport = [[FMCSyncIAPTransport alloc] init];
    FMCAppLinkProtocol* protocol = [[FMCAppLinkProtocol alloc] init];
    
    FMCSyncProxy *ret = [[FMCSyncProxy alloc] initWithTransport:transport protocol:protocol delegate:delegate];
    
    [transport release];
    [protocol release];
    
	return [ret autorelease];
}

+(FMCSyncProxy*) buildSyncProxyWithListener:(NSObject<FMCProxyListener>*) delegate
                              tcpIPAddress: (NSString*) ipaddress
                                   tcpPort: (NSString*) port {
    
    FMCSyncTcpTransport* transport = [[FMCSyncTcpTransport alloc] initWithEndpoint:ipaddress endpointParam:port];
    FMCAppLinkProtocol* protocol = [[FMCAppLinkProtocol alloc] init];
    
    FMCSyncProxy *ret = [[FMCSyncProxy alloc] initWithTransport:transport protocol:protocol delegate:delegate];
    
    [transport release];
    [protocol release];
    
	return [ret autorelease];
}

@end