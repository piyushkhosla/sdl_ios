//
//  SDLAudioControlCapabilitiesSpec.m
//  SmartDeviceLinkTests
//

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLAudioControlCapabilities.h"
#import "SDLRPCParameterNames.h"
#import "SDLModuleInfo.h"


QuickSpecBegin( SDLAudioControlCapabilitiesSpec)

SDLModuleInfo *moduleInfo = [[SDLModuleInfo alloc] init];

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLAudioControlCapabilities* testStruct = [[SDLAudioControlCapabilities alloc] init];

        testStruct.moduleName = @"module";
        testStruct.sourceAvailable = @(YES);
        testStruct.keepContextAvailable = @YES;
        testStruct.volumeAvailable = @(NO);
        testStruct.equalizerAvailable = @(NO);
        testStruct.equalizerMaxChannelId = @56;
        testStruct.moduleInfo = moduleInfo;

        expect(testStruct.moduleName).to(equal(@"module"));
        expect(testStruct.keepContextAvailable).to(equal(@YES));
        expect(testStruct.sourceAvailable).to(equal(@(YES)));
        expect(testStruct.volumeAvailable).to(equal(@(NO)));
        expect(testStruct.equalizerAvailable).to(equal(@(NO)));
        expect(testStruct.equalizerMaxChannelId).to(equal(@56));
        expect(testStruct.moduleInfo).to(equal(moduleInfo));

    });

    it(@"Should set and get correctly", ^ {
        SDLAudioControlCapabilities* testStruct = [[SDLAudioControlCapabilities alloc] initWithModuleName:@"module"];

        expect(testStruct.moduleName).to(equal(@"module"));
        expect(testStruct.sourceAvailable).to(beNil());
        expect(testStruct.keepContextAvailable).to(beNil());
        expect(testStruct.volumeAvailable).to(beNil());
        expect(testStruct.equalizerAvailable).to(beNil());
        expect(testStruct.equalizerMaxChannelId).to(beNil());
        expect(testStruct.moduleInfo).to(beNil());

    });

    it(@"Should set and get correctly", ^ {
        SDLAudioControlCapabilities* testStruct = [[SDLAudioControlCapabilities alloc] initWithModuleName:@"module" sourceAvailable:@NO keepContextAvailable:@NO volumeAvailable:@YES equalizerAvailable:@NO equalizerMaxChannelID:@34];

        expect(testStruct.moduleName).to(equal(@"module"));
        expect(testStruct.sourceAvailable).to(equal(@(NO)));
        expect(testStruct.keepContextAvailable).to(equal(@NO));
        expect(testStruct.volumeAvailable).to(equal(@(YES)));
        expect(testStruct.equalizerAvailable).to(equal(@(NO)));
        expect(testStruct.equalizerMaxChannelId).to(equal(@34));
        expect(testStruct.moduleInfo).to(beNil());

    });

    it(@"Should set and get correctly", ^ {
        SDLAudioControlCapabilities* testStruct = [[SDLAudioControlCapabilities alloc] initWithModuleName:@"module" sourceAvailable:@NO keepContextAvailable:@NO volumeAvailable:@YES equalizerAvailable:@NO equalizerMaxChannelID:@34 moduleInfo:moduleInfo];

        expect(testStruct.moduleName).to(equal(@"module"));
        expect(testStruct.sourceAvailable).to(equal(@(NO)));
        expect(testStruct.keepContextAvailable).to(equal(@NO));
        expect(testStruct.volumeAvailable).to(equal(@(YES)));
        expect(testStruct.equalizerAvailable).to(equal(@(NO)));
        expect(testStruct.equalizerMaxChannelId).to(equal(@34));
        expect(testStruct.moduleInfo).to(equal(moduleInfo));

    });


    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary* dict = [@{SDLRPCParameterNameModuleName:@"module",
                                       SDLRPCParameterNameSourceAvailable:@(NO),
                                       SDLRPCParameterNameKeepContextAvailable: @YES,
                                       SDLRPCParameterNameVolumeAvailable:@(YES),
                                       SDLRPCParameterNameEqualizerAvailable:@(NO),
                                       SDLRPCParameterNameEqualizerMaxChannelId:@12,
                                       SDLRPCParameterNameModuleInfo:moduleInfo
                                       } mutableCopy];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        SDLAudioControlCapabilities* testStruct = [[SDLAudioControlCapabilities alloc] initWithDictionary:dict];
#pragma clang diagnostic pop

        expect(testStruct.moduleName).to(equal(@"module"));
        expect(testStruct.sourceAvailable).to(equal(@(NO)));
        expect(testStruct.keepContextAvailable).to(equal(@YES));
        expect(testStruct.volumeAvailable).to(equal(@(YES)));
        expect(testStruct.equalizerAvailable).to(equal(@(NO)));
        expect(testStruct.equalizerMaxChannelId).to(equal(@12));
        expect(testStruct.moduleInfo).to(equal(moduleInfo));


    });

    it(@"Should return nil if not set", ^ {
        SDLAudioControlCapabilities* testStruct = [[SDLAudioControlCapabilities alloc] init];

        expect(testStruct.moduleName).to(beNil());
        expect(testStruct.sourceAvailable).to(beNil());
        expect(testStruct.keepContextAvailable).to(beNil());
        expect(testStruct.volumeAvailable).to(beNil());
        expect(testStruct.equalizerAvailable).to(beNil());
        expect(testStruct.equalizerMaxChannelId).to(beNil());
        expect(testStruct.moduleInfo).to(beNil());


    });
});

QuickSpecEnd
