//
//  SDLTurnSignalSpec.m
//  SmartDeviceLinkTests

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLTurnSignal.h"

QuickSpecBegin(SDLTurnSignalSpec)

describe(@"Individual Enum Value Tests", ^ {
    it(@"Should match internal values", ^ {
        expect(SDLTurnSignalOff).to(equal(@"OFF"));
        expect(SDLTurnSignalLeft).to(equal(@"LEFT"));
        expect(SDLTurnSignalRight).to(equal(@"RIGHT"));
        expect(SDLTurnSignalBoth).to(equal(@"BOTH"));

    });
});

QuickSpecEnd

