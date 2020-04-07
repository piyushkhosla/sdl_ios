//
//  SDLWindowStatus.m
//  SmartDeviceLinkTests
//

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLRPCParameterNames.h"
#import "SDLWindowStatus.h"
#import "SDLWindowState.h"
#import "SDLGrid.h"

QuickSpecBegin(SDLWindowSatusSpec)

describe(@"Getter/Setter Tests", ^ {
    __block SDLGrid* loc = nil;
    __block SDLWindowState* windowState = nil;

    beforeEach(^{
        loc = [[SDLGrid alloc] init];
        windowState = [[SDLWindowState alloc] init];
    });
    
    it(@"Should set and get correctly", ^ {
        SDLWindowStatus* testStruct = [[SDLWindowStatus alloc] init];

        testStruct.location = loc;
        testStruct.state = windowState;

        expect(testStruct.location).to(equal(loc));
        expect(testStruct.state).to(equal(windowState));
    });

    it(@"Should set and get correctly", ^ {
        SDLWindowStatus* testStruct = [[SDLWindowStatus alloc] initWithLocation:loc state:windowState];

        expect(testStruct.location).to(equal(loc));
        expect(testStruct.state).to(equal(windowState));
    });

    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary* dict = [@{SDLRPCParameterNameLocation:loc,
                                       SDLRPCParameterNameState:windowState
                                       } mutableCopy];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        SDLWindowStatus* testStruct = [[SDLWindowStatus alloc] initWithDictionary:dict];
#pragma clang diagnostic pop

        expect(testStruct.location).to(equal(loc));
        expect(testStruct.state).to(equal(windowState));
    });

    it(@"Should return nil if not set", ^ {
        SDLWindowStatus* testStruct = [[SDLWindowStatus alloc] init];

        expect(testStruct.location).to(beNil());
        expect(testStruct.state).to(beNil());

    });
});

QuickSpecEnd

