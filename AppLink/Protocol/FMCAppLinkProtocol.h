//
//  FMCAppLinkProtocol.h
//  ProtocolReWrite
//

#import "FMCAbstractProtocol.h"
@class FMCAppLinkProtocolHeader;
@class FMCApplinkProtocolRecievedMessageRouter;


@interface FMCAppLinkProtocol : FMCAbstractProtocol

@property (assign) UInt8 highestRecievedVersion;

- (void)sendStartSessionWithType:(FMCServiceType)serviceType;
- (void)sendEndSessionWithType:(FMCServiceType)serviceType sessionID:(Byte)sessionID;
- (void)sendData:(FMCAppLinkProtocolMessage *)protocolMsg;
- (void)handleBytesFromTransport:(NSData *)receivedData;

@end
