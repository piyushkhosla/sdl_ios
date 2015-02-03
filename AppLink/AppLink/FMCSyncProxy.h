//  FMCSyncProxy.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.
//  Version: AppLink-20141001-130610-LOCAL-iOS

#import <Foundation/Foundation.h>
#import <AppLink/FMCProxyListener.h>
#import <AppLink/FMCRPCRequestFactory.h>
#import "FMCAbstractProtocol.h"
#import "FMCAbstractTransport.h"
#import "FMCTimer.h"

@interface FMCSyncProxy : NSObject <FMCProtocolListener, NSStreamDelegate> {
    Byte _version;
	Byte bulkSessionID;
	BOOL isConnected;
    BOOL _alreadyDestructed;

}

@property (strong) FMCAbstractProtocol *protocol;
@property (strong) FMCAbstractTransport *transport;
@property (strong) NSMutableArray *proxyListeners;
@property (strong) FMCTimer *startSessionTimer;
@property (strong) NSString *debugConsoleGroupName;
@property (readonly) NSString *proxyVersion;

- (id)initWithTransport:(FMCAbstractTransport *)transport
               protocol:(FMCAbstractProtocol *)protocol
               delegate:(NSObject<FMCProxyListener> *)delegate;

- (void)dispose;
- (void)addDelegate:(NSObject<FMCProxyListener> *)delegate;

- (void)sendRPCRequest:(FMCRPCMessage *)msg;
- (void)handleRpcMessage:(NSDictionary *)msg;
- (void)handleProtocolMessage:(FMCAppLinkProtocolMessage *)msgData;


/**
 * Puts data into a file on the module
 * @abstract Performs a putFile for a given input stream, performed in chunks, for handling very large files.
 * @param inputStream A stream containing the data to put to the module.
 * @param putFileRPCRequest A FMCPutFile object containing the parameters for the put(s)
 * @discussion  The proxy will read from the stream up to 1024 bytes at a time and send them in individual putFile requests.
 * This may result in multiple responses being recieved, one for each request.
 * Note: the length parameter of the putFileRPCRequest will be ignored. The proxy will substitute the number of bytes read from the stream.
 */
- (void)putFileStream:(NSInputStream *)inputStream withRequest:(FMCPutFile *)putFileRPCRequest;

+ (void)enableSiphonDebug;
+ (void)disableSiphonDebug;


@end
