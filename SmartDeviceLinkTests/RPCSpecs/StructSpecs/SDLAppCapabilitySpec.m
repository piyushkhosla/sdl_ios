//
//  SDLAppCapabilitySpec.m
//  SmartDeviceLinkTests
//
//  Created by Ergophobia on 24/07/20.
//  Copyright © 2020 smartdevicelink. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLRPCParameterNames.h"
#import "SDLAppCapability.h"
#import "SDLAppCapabilityType.h"
#import "SDLVideoStreamingCapability.h"

QuickSpecBegin(SDLAppCapabilitySpec)

SDLVideoStreamingCapability* videoStreamingCapability = [[SDLVideoStreamingCapability alloc] init];

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLAppCapability* testStruct = [[SDLAppCapability alloc] init];
        
        testStruct.appCapabilityType = SDLAppCapabilityTypeVideoStreaming;
        testStruct.videoStreamingCapability = videoStreamingCapability;

        expect(testStruct.appCapabilityType).to(equal(SDLAppCapabilityTypeVideoStreaming));
        expect(testStruct.videoStreamingCapability).to(equal(videoStreamingCapability));
    });
    it(@"Should initialize correctly with initWithAppCapabilityType:videoStreamingCapability:", ^ {
        SDLAppCapability* testStruct = [[SDLAppCapability alloc] initWithAppCapabilityType:SDLAppCapabilityTypeVideoStreaming ];
    
        expect(testStruct.appCapabilityType).to(equal(SDLAppCapabilityTypeVideoStreaming));
        expect(testStruct.videoStreamingCapability).to(beNil());
    });
    it(@"Should initialize correctly with initWithAppCapabilityType:videoStreamingCapability:", ^ {
        SDLAppCapability* testStruct = [[SDLAppCapability alloc] initWithAppCapabilityType:SDLAppCapabilityTypeVideoStreaming videoStreamingCapability:videoStreamingCapability];
    
 
        expect(testStruct.appCapabilityType).to(equal(SDLAppCapabilityTypeVideoStreaming));
        expect(testStruct.videoStreamingCapability).to(equal(videoStreamingCapability));

    });
    
    
    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary<NSString *, id> *dict = [@{SDLRPCParameterNameAppCapabilityType:SDLAppCapabilityTypeVideoStreaming,
                                                       SDLRPCParameterNameVideoStreamingCapability:videoStreamingCapability} mutableCopy];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        SDLAppCapability* testStruct = [[SDLAppCapability alloc] initWithDictionary:dict];
#pragma clang diagnostic pop
        
        expect(testStruct.appCapabilityType).to(equal(SDLAppCapabilityTypeVideoStreaming));
        expect(testStruct.videoStreamingCapability).to(equal(videoStreamingCapability));;
    });
    
    it(@"Should return nil if not set", ^ {
        SDLAppCapability* testStruct = [[SDLAppCapability alloc] init];
        
        expect(testStruct.appCapabilityType).to(beNil());
        expect(testStruct.videoStreamingCapability).to(beNil());
    });
});

QuickSpecEnd
