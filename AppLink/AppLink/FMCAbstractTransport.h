//  FMCAbstractTransport.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import "FMCTransportDelegate.h"

@interface FMCAbstractTransport : NSObject

@property (weak) id<FMCTransportDelegate> delegate;
@property (strong) NSString *debugConsoleGroupName;

- (void)connect;
- (void)disconnect;
- (void)sendData:(NSData *)dataToSend;

@end
