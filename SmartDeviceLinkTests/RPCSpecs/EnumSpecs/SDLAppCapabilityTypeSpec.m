//
//  SDLAppCapabilityTypeSpec.m
//  SmartDeviceLinkTests
//

#import <Foundation/Foundation.h>
#import <Quick/Quick.h>
#import <Nimble/Nimble.h>
#import "SDLAppCapabilityType.h"

QuickSpecBegin(SDLAppCapabilityTypeSpec)

describe(@"Individual Enum Value Tests", ^ {
    it(@"Should match internal values", ^ {
        expect(SDLAppCapabilityTypeVideoStreaming).to(equal(@"VIDEO_STREAMING"));
    });
});

QuickSpecEnd
