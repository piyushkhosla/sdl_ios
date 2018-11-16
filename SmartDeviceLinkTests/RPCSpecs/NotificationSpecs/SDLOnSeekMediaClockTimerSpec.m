//
//  SDLOnSeekMediaClockTimerSpec.m
//  SmartDeviceLinkTests
//

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLOnSeekMediaClockTimer.h"
#import "SDLNames.h"
#import "SDLStartTime.h"

QuickSpecBegin(SDLOnSeekMediaClockTimerSpec)
SDLStartTime *startTime = [[SDLStartTime alloc] initWithHours:1 minutes:20 seconds:10];

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLOnSeekMediaClockTimer* testNotification = [[SDLOnSeekMediaClockTimer alloc] init];
        testNotification.seekTime = startTime;

        expect(testNotification.seekTime).to(equal(startTime));


    });

    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary<NSString *, id> *dict = [@{SDLNameNotification:
                                                           @{SDLNameParameters:@{                                                                 SDLNameSeekTime:startTime
                                                                   },
                                                             SDLNameOperationName:SDLNameOnSeekMediaClockTimer}} mutableCopy];
        SDLOnSeekMediaClockTimer* testNotification = [[SDLOnSeekMediaClockTimer alloc] initWithDictionary:dict];

        expect(testNotification.seekTime).to(equal(startTime));
    });

    it(@"Should return nil if not set", ^ {
        SDLOnSeekMediaClockTimer* testNotification = [[SDLOnSeekMediaClockTimer alloc] init];

        expect(testNotification.seekTime).to(beNil());
    });
});

QuickSpecEnd
