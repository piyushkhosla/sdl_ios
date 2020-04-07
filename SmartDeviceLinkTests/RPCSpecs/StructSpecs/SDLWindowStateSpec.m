//
//  SDLWindowState.m
//  SmartDeviceLinkTests
//

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLRPCParameterNames.h"
#import "SDLWindowState.h"

QuickSpecBegin(SDLWindowStateSpec)

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLWindowState* testStruct = [[SDLWindowState alloc] init];

        testStruct.approximatePosition = @12;
        testStruct.deviation = @4;

        expect(testStruct.approximatePosition).to(equal(@12));
        expect(testStruct.deviation).to(equal(@4));
    });

    it(@"Should set and get correctly", ^ {
        SDLWindowState* testStruct = [[SDLWindowState alloc] initWithApproximatePosition:23 deviation:54];

        expect(testStruct.approximatePosition).to(equal(@23));
        expect(testStruct.deviation).to(equal(@54));
    });

    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary* dict = [@{SDLRPCParameterNameApproximatePosition:@32,
                                       SDLRPCParameterNameDeviation:@67
                                       } mutableCopy];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        SDLWindowState* testStruct = [[SDLWindowState alloc] initWithDictionary:dict];
#pragma clang diagnostic pop

        expect(testStruct.approximatePosition).to(equal(@32));
        expect(testStruct.deviation).to(equal(@67));
    });

    it(@"Should return nil if not set", ^ {
        SDLWindowState* testStruct = [[SDLWindowState alloc] init];

        expect(testStruct.approximatePosition).to(beNil());
        expect(testStruct.deviation).to(beNil());

    });
});

QuickSpecEnd
