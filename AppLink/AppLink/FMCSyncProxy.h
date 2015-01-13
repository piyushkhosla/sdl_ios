//  FMCSyncProxy.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.
//  Version: AppLink-20141001-130610-LOCAL-iOS

#import <Foundation/Foundation.h>
#import <AppLink/FMCProxyListener.h>
#import <AppLink/FMCRPCRequestFactory.h>
#import <AppLink/FMCTransport.h>
#import "FMCAbstractProtocol.h"

@interface FMCSyncProxy : NSObject <FMCProtocolListener, NSStreamDelegate> {
    Byte _version;
	Byte bulkSessionID;
	BOOL isConnected;
    BOOL alreadyDestructed;

}

@property (strong) FMCAbstractProtocol* protocol;
@property (strong) NSObject<FMCTransport>* transport;
@property (strong) NSMutableArray* proxyListeners;
@property (strong) NSTimer* handshakeTimer;
@property (strong) NSString *debugConsoleGroupName;

-(id) initWithTransport:(NSObject<FMCTransport>*) transport protocol:(FMCAbstractProtocol *)protocol delegate:(NSObject<FMCProxyListener>*) delegate;

-(void) dispose;
-(void) addDelegate:(NSObject<FMCProxyListener>*) delegate;

-(void) sendRPCRequest:(FMCRPCMessage*) msg;
-(void) handleRpcMessage:(NSDictionary*) msg;
-(void) handleProtocolMessage:(FMCAppLinkProtocolMessage*) msgData;

-(void) destroyHandshakeTimer;

+(void)enableSiphonDebug;
+(void)disableSiphonDebug;

-(NSString*) getProxyVersion;
-(NSObject<FMCTransport>*)getTransport;
-(FMCAbstractProtocol*)getProtocol;

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
