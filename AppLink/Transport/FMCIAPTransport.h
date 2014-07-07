//  FMCIAPTransport.h
//  FMCSyncIAPTransport.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <ExternalAccessory/ExternalAccessory.h>
#import "FMCAbstractTransport.h"

@interface FMCIAPTransport : FMCAbstractTransport <NSStreamDelegate> {}


@property (strong) EASession *session;
@property (strong) EAAccessory *accessory;

@property (strong) NSMutableData *writeData;

@property (assign) BOOL onControlProtocol;
@property (assign) BOOL useLegacyProtocol;

@property (strong) NSString *protocolString;


@end
