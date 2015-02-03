//  FMCTCPTransport.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import "FMCAbstractTransport.h"

@interface FMCTCPTransport : FMCAbstractTransport {
	CFSocketRef socket;
}

@property (strong, atomic) NSString *hostName;
@property (strong, atomic) NSString *portNumber;

@end
