//
//  SDLPredefinedWindowsSpec.m
//  SmartDeviceLinkTests
//

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLPredefinedWindows.h"

QuickSpecBegin(SDLPredefinedWindowsSpec)

describe(@"Individual Enum Value Tests", ^ {
    it(@"Should match internal values", ^ {
        expect(SDLPredefinedWindowDefault).to(equal(@"DEFAULT_WINDOW"));
        expect(SDLPredefinedWindowPrimaryWidget).to(equal(@"PRIMARY_WIDGET"));

    });
});

QuickSpecEnd
