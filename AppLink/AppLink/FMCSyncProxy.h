//  FMCSyncProxy.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.
//  Version: ##Version##

#import <Foundation/Foundation.h>
#import <AppLink/FMCISyncProxy.h>
#import <AppLink/FMCProtocol.h>
#import <AppLink/FMCProxyListener.h>
#import <AppLink/FMCRPCRequestFactory.h>
#import <AppLink/FMCTransport.h>

@interface FMCSyncProxy : NSObject<FMCProtocolListener, NSStreamDelegate> {
    Byte _version;
	Byte rpcSessionID;
	Byte bulkSessionID;
	BOOL isConnected;
    BOOL alreadyDestructed;

}

@property (strong) NSObject<FMCProtocol>* protocol;
@property (strong) NSObject<FMCTransport>* transport;
@property (strong) NSMutableArray* proxyListeners;
@property (strong) NSTimer* handshakeTimer;
@property (strong) NSString *debugConsoleGroupName;

-(id) initWithTransport:(NSObject<FMCTransport>*) transport protocol:(NSObject<FMCProtocol>*) protocol delegate:(NSObject<FMCProxyListener>*) delegate;

-(void) dispose;
-(void) addDelegate:(NSObject<FMCProxyListener>*) delegate;

-(void) sendRPCRequest:(FMCRPCMessage*) msg;
-(void) handleRpcMessage:(NSDictionary*) msg;

-(NSString*) getProxyVersion;

-(void) destroyHandshakeTimer;
-(void) handleProtocolMessage:(FMCAppLinkProtocolMessage*) msgData;

+(void)enableSiphonDebug;
+(void)disableSiphonDebug;

-(NSObject<FMCTransport>*)getTransport;
-(NSObject<FMCProtocol>*)getProtocol;

/**
 * Puts data into a file on the module
 * @abstract Performs a putFile for a given input stream, performed in chunks, for handling very large files.
 * @param inputStream A stream containing the data to put to the module.
 * @param putFileRPCRequest A FMCPutFile object containing the parameters for the put(s)
 * @discussion  The proxy will read from the stream up to 1024 bytes at a time and send them in individual putFile requests.
 * This may result in multiple responses being recieved, one for each request.
 * Note: the length parameter of the putFileRPCRequest will be ignored. The proxy will substitute the number of bytes read from the stream.
 */
- (void)putFileStream:(NSInputStream*)inputStream :(FMCPutFile*)putFileRPCRequest;

@end
