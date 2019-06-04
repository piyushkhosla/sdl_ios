//
//  SDLButtonCapabilitiesSpec.m
//  SmartDeviceLink


#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLButtonCapabilities.h"
#import "SDLButtonName.h"
#import "SDLRPCParameterNames.h"
#import "SDLModuleInfo.h"


QuickSpecBegin(SDLButtonCapabilitiesSpec)

SDLModuleInfo *moduleInfo = [[SDLModuleInfo alloc] init];

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLButtonCapabilities* testStruct = [[SDLButtonCapabilities alloc] init];
        
        testStruct.name = SDLButtonNameTuneUp;
        testStruct.shortPressAvailable = @YES;
        testStruct.longPressAvailable = @YES;
        testStruct.upDownAvailable = @NO;
        testStruct.moduleInfo = moduleInfo;
        
        expect(testStruct.name).to(equal(SDLButtonNameTuneUp));
        expect(testStruct.shortPressAvailable).to(equal(@YES));
        expect(testStruct.longPressAvailable).to(equal(@YES));
        expect(testStruct.upDownAvailable).to(equal(@NO));
        expect(testStruct.moduleInfo).to(equal(moduleInfo));

    });
    
    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary* dict = [@{SDLRPCParameterNameName:SDLButtonNameCustomButton,
                                       SDLRPCParameterNameShortPressAvailable:@YES,
                                       SDLRPCParameterNameLongPressAvailable:@YES,
                                       SDLRPCParameterNameUpDownAvailable:@NO,
                                       SDLRPCParameterNameModuleInfo:moduleInfo
                                       } mutableCopy];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        SDLButtonCapabilities* testStruct = [[SDLButtonCapabilities alloc] initWithDictionary:dict];
#pragma clang diagnostic pop
        
        expect(testStruct.name).to(equal(SDLButtonNameCustomButton));
        expect(testStruct.shortPressAvailable).to(equal(@YES));
        expect(testStruct.longPressAvailable).to(equal(@YES));
        expect(testStruct.upDownAvailable).to(equal(@NO));
        expect(testStruct.moduleInfo).to(equal(moduleInfo));

    });
    
    it(@"Should return nil if not set", ^ {
        SDLButtonCapabilities* testStruct = [[SDLButtonCapabilities alloc] init];
        
        expect(testStruct.name).to(beNil());
        expect(testStruct.shortPressAvailable).to(beNil());
        expect(testStruct.longPressAvailable).to(beNil());
        expect(testStruct.upDownAvailable).to(beNil());
        expect(testStruct.moduleInfo).to(beNil());

    });
});

QuickSpecEnd
