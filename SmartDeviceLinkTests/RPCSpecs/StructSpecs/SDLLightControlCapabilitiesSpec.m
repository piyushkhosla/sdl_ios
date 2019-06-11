//
//  SDLLightControlCapabilitiesSpec.m
//  SmartDeviceLinkTests
//

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLLightControlCapabilities.h"
#import "SDLRPCParameterNames.h"
#import "SDLLightCapabilities.h"
#import "SDLModuleInfo.h"

QuickSpecBegin( SDLLightControlCapabilitiesSpec)

SDLLightCapabilities* somelightCapabilities = [[SDLLightCapabilities alloc] init];
SDLModuleInfo *moduleInfo = [[SDLModuleInfo alloc] init];

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLLightControlCapabilities* testStruct = [[SDLLightControlCapabilities alloc] init];

        testStruct.moduleName = @"moduleName";
        testStruct.supportedLights = [@[somelightCapabilities] copy];
        testStruct.moduleInfo = moduleInfo;

        expect(testStruct.moduleName).to(equal(@"moduleName"));
        expect(testStruct.moduleInfo).to(equal(moduleInfo));
        expect(testStruct.supportedLights).to(equal([@[somelightCapabilities] copy]));

    });

    it(@"Should set and get correctly", ^ {
        SDLLightControlCapabilities* testStruct = [[SDLLightControlCapabilities alloc] initWithModuleName:@"moduleName" supportedLights:[@[somelightCapabilities] copy]];

        expect(testStruct.moduleName).to(equal(@"moduleName"));
        expect(testStruct.supportedLights).to(equal([@[somelightCapabilities] copy]));

    });

    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary* dict = [@{SDLRPCParameterNameModuleName:@"moduleName",
                                       SDLRPCParameterNameSupportedLights:[@[somelightCapabilities] copy],
                                       SDLRPCParameterNameModuleInfo:moduleInfo
                                       } mutableCopy];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        SDLLightControlCapabilities* testStruct = [[SDLLightControlCapabilities alloc] initWithDictionary:dict];
#pragma clang diagnostic pop

        expect(testStruct.moduleName).to(equal(@"moduleName"));
        expect(testStruct.moduleInfo).to(equal(moduleInfo));
        expect(testStruct.supportedLights).to(equal([@[somelightCapabilities] copy]));
    });

    it(@"Should return nil if not set", ^ {
        SDLLightControlCapabilities* testStruct = [[SDLLightControlCapabilities alloc] init];

        expect(testStruct.moduleName).to(beNil());
        expect(testStruct.moduleInfo).to(beNil());
        expect(testStruct.supportedLights).to(beNil());
    });
});

QuickSpecEnd
