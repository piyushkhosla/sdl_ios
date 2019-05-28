//
//  SDLDisplayCapabilitySpec.m
//  SmartDeviceLinkTests
//

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLDisplayCapability.h"
#import "SDLWindowCapability.h"
#import "SDLWindowTypeCapabilities.h"
#import "SDLRPCParameterNames.h"


QuickSpecBegin(SDLDisplayCapabilitySpec)

SDLWindowCapability *windowCapabilty = [[SDLWindowCapability alloc] init];
SDLWindowTypeCapabilities *windowCapabilties = [[SDLWindowTypeCapabilities alloc] init];

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLDisplayCapability* testStruct = [[SDLDisplayCapability alloc] init];

        testStruct.displayName = @"testName";
        testStruct.windowTypeSupported = @[windowCapabilties];
        testStruct.windowCapabilities = @[windowCapabilty];

        expect(testStruct.displayName).to(equal(@"testName"));
        expect(testStruct.windowTypeSupported).to(equal(@[windowCapabilties]));
        expect(testStruct.windowCapabilities).to(equal(@[windowCapabilty]));
    });

    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary* dict = [@{SDLRPCParameterNameDisplayName:@"testName",
                                       SDLRPCParameterNameWindowTypeSupported:@[windowCapabilties],
                                       SDLRPCParameterNameWindowCapabilities:@[windowCapabilty]} mutableCopy];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        SDLDisplayCapability* testStruct = [[SDLDisplayCapability alloc] initWithDictionary:dict];
#pragma clang diagnostic pop

        expect(testStruct.displayName).to(equal(@"testName"));
        expect(testStruct.windowTypeSupported).to(equal([@[windowCapabilties] copy]));
        expect(testStruct.windowCapabilities).to(equal(@[windowCapabilty]));
    });

    it(@"Should get correctly when initialized with initWithDisplayName:windowTypeSupported:windowCapabilities:", ^ {
        SDLDisplayCapability* testStruct = [[SDLDisplayCapability alloc] initWithDisplayName:@"testName" windowTypeSupported:[@[windowCapabilties] copy] windowCapabilities:@[windowCapabilty]];

        expect(testStruct.displayName).to(equal(@"testName"));
        expect(testStruct.windowTypeSupported).to(equal([@[windowCapabilties] copy]));
        expect(testStruct.windowCapabilities).to(equal(@[windowCapabilty]));
    });

    it(@"Should return nil if not set", ^ {
        SDLDisplayCapability* testStruct = [[SDLDisplayCapability alloc] init];

        expect(testStruct.displayName).to(beNil());
        expect(testStruct.windowTypeSupported).to(beNil());
        expect(testStruct.windowCapabilities).to(beNil());
    });
});

QuickSpecEnd
