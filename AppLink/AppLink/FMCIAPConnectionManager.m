//
//  FMCIAPConnectionManager.m
//  AppLink
//
//  Copyright (c) 2014 FMC. All rights reserved.
//

#import <ExternalAccessory/ExternalAccessory.h>
#import "EAAccessoryManager+SyncProtocols.h"
#import "FMCIAPConfig.h"
#import "FMCStreamDelegate.h"
#import "FMCIAPConnectionManager.h"

@implementation FMCIAPConnectionManager

//
// Responsible for determinint whether multi-app is supported or not
// and returning an appropriate FMCIAPSession object which will either be a
// legacy session on: com.ford.sync.prot0
// or, a multi-app session on com.ford.sync.protNN where NN = [1-29]
//
+ (FMCIAPSession *)createSession {

    FMCIAPSession *session = nil;

    EAAccessory *accessory = nil;
    if ((accessory = [EAAccessoryManager findAccessoryForProtocol:CONTROL_PROTOCOL_STRING])) {
        //
        // Multi-app
        //
        __block uint8_t protocolIndex = 0;
        dispatch_semaphore_t protocol_index_semaphore = dispatch_semaphore_create(0);


        // Setup the control stream delegate
        FMCStreamDelegate *controlStreamDelegate = [FMCStreamDelegate new];
        controlStreamDelegate.streamHasBytesHandler = ^(NSInputStream *istream){

            // Grab a single byte from the stream
            const int bufferSize = 1;
            uint8_t buf[bufferSize];
            NSUInteger len = [istream read:buf maxLength:bufferSize];
            if(len > 0)
            {
                protocolIndex = buf[0];
                dispatch_semaphore_signal(protocol_index_semaphore);
            }
        };

        // start the session on the control channel
        FMCIAPSession *controlSession = [[FMCIAPSession alloc] initWithAccessory:accessory
                                                                      forProtocol:CONTROL_PROTOCOL_STRING];
        controlSession.streamDelegate = controlStreamDelegate;
        [controlSession open];


        // Wait here until we have recieved data (which should be the protocol index) or set a timeout
        dispatch_semaphore_wait(protocol_index_semaphore, DISPATCH_TIME_FOREVER);

        // Done with control protocol session, destroy it.
        [controlSession close];
        controlSession = nil;

        // Create session with indexed protocol
        NSString *indexedProtocolString = [NSString stringWithFormat:@"%@%c", INDEXED_PROTOCOL_STRING_PREFIX, protocolIndex];
        session = [[FMCIAPSession alloc] initWithAccessory:accessory
                                               forProtocol:indexedProtocolString];
        return session;


    } else if ((accessory = [EAAccessoryManager findAccessoryForProtocol:LEGACY_PROTOCOL_STRING])) {
        //
        // Legacy
        //
        session = [[FMCIAPSession alloc] initWithAccessory:accessory
                                               forProtocol:LEGACY_PROTOCOL_STRING];
        return session;

    } else {
        //
        // Error: No accessory supporting a required sync protocol was found!
        //
        return nil;
    }

}
@end
