//  FMCAbstractTransport.m
//  FMCAbstractSyncTransport.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import "FMCAbstractTransport.h"

@implementation FMCAbstractTransport

- (void)connect {
	[self doesNotRecognizeSelector:_cmd];
}

- (void)disconnect {
	[self doesNotRecognizeSelector:_cmd];
}

- (void)sendData:(NSData *)dataToSend {
	[self doesNotRecognizeSelector:_cmd];
}


@end
