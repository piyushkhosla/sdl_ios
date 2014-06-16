//  FMCSyncProxyFactory.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCSyncProxyFactory.h>

#import <AppLink/Debug/FMCDebugTool.h>
#import <AppLink/Transport/FMCIAPTransport.h>
#import <AppLink/Transport/FMCTCPTransport.h>
#import <AppLink/Protocol/FMCAppLinkProtocol.h>

@implementation FMCSyncProxyFactory

+(FMCSyncProxy*) buildSyncProxyWithListener:(NSObject<FMCProxyListener>*) delegate {
    FMCIAPTransport* transport = [[FMCIAPTransport alloc] init];
    FMCAppLinkProtocol* protocol = [[FMCAppLinkProtocol alloc] init];
    
    FMCSyncProxy *ret = [[FMCSyncProxy alloc] initWithTransport:transport protocol:protocol delegate:delegate];
    
    [transport release];
    [protocol release];
    
	return [ret autorelease];
}

//TODO: Add back in TCP constructor (add ability to pass args)
//+(FMCSyncProxy*) buildSyncProxyWithListener:(NSObject<FMCProxyListener>*) delegate
//                              tcpIPAddress: (NSString*) ipaddress
//                                   tcpPort: (NSString*) port {
//    
//    FMCTCPTransport* transport = [[FMCTCPTransport alloc] initWithEndpoint:ipaddress endpointParam:port];
//    FMCAppLinkProtocol* protocol = [[FMCAppLinkProtocol alloc] init];
//    
//    FMCSyncProxy *ret = [[FMCSyncProxy alloc] initWithTransport:transport protocol:protocol delegate:delegate];
//    
//    [transport release];
//    [protocol release];
//    
//	return [ret autorelease];
//}

@end