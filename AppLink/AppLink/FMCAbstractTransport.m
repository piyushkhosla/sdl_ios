//  FMCAbstractTransport.m
//  FMCAbstractSyncTransport.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import "FMCAbstractTransport.h"

@implementation FMCAbstractTransport

- (instancetype)init {
    if (self = [super init]) {

    }
    return self;
}

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
