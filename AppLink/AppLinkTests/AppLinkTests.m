//
//  AppLinkTests.m
//  AppLinkTests
//
//  Created by Thunder on 6/15/14.
//  Copyright (c) 2014 FMC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FMCAppLinkProtocol.h"


@interface AppLinkTests : XCTestCase <FMCProtocolListener>

@end

@implementation AppLinkTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    UInt8 startSessionACK[] = {0x20, 0x07, 0x02, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x16, 0x49};

    NSData *ssACK = [NSData dataWithBytes:startSessionACK length:16];

    FMCAppLinkProtocol * protocol = [[FMCAppLinkProtocol alloc] init];
    protocol.protocolDelegate = self;
    [protocol handleBytesFromTransport:ssACK];
}


- (void)handleProtocolSessionStarted:(FMCServiceType)serviceType sessionID:(Byte)sessionID version:(Byte)version {
    NSLog(@"handleProtocolSessionStarted: %i, %i, %i", serviceType, sessionID, version);
}

- (void)onProtocolMessageReceived:(FMCAppLinkProtocolMessage *)msg {
    NSLog(@"onProtocolMessageReceived: %@", msg);
}

- (void)onProtocolOpened {
    NSLog(@"onProtocolOpened");

}

- (void)onProtocolClosed {
    NSLog(@"onProtocolClosed");

}

- (void)onError:(NSString *)info exception:(NSException *)e {
    NSLog(@"onError: %@, %@", info, e);

}


@end
