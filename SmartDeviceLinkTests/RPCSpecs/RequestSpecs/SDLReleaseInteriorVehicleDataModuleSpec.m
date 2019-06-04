//
//  SDLReleaseInteriorVehicleDataModuleSpec.m
//  SmartDeviceLinkTests
//

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLReleaseInteriorVehicleDataModule.h"
#import "SDLRPCFunctionNames.h"
#import "SDLRPCParameterNames.h"

QuickSpecBegin(SDLReleaseInteriorVehicleDataModuleSpec)

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLReleaseInteriorVehicleDataModule* testStruct = [[SDLReleaseInteriorVehicleDataModule alloc] init];

        testStruct.moduleType = SDLModuleTypeRadio;
        testStruct.moduleId = @"moduleId";

        expect(testStruct.moduleType).to(equal(SDLModuleTypeRadio));
        expect(testStruct.moduleId).to(equal(@"moduleId"));

    });

    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary* dict = [@{SDLRPCParameterNameRequest:
                                           @{SDLRPCParameterNameParameters:
                                                 @{SDLRPCParameterNameModuleType:SDLModuleTypeSeat,
                                                   SDLRPCParameterNameModuleId:@"moduleId"
                                                   },
                                             SDLRPCParameterNameOperationName:SDLRPCFunctionNameReleaseInteriorVehicleDataModule}} mutableCopy];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        SDLReleaseInteriorVehicleDataModule* testRequest = [[SDLReleaseInteriorVehicleDataModule alloc] initWithDictionary:dict];
#pragma clang diagnostic pop

        expect(testRequest.moduleType).to(equal(SDLModuleTypeSeat));
        expect(testRequest.moduleId).to(equal(@"moduleId"));
    });


    it(@"Should return nil if not set", ^ {
        SDLReleaseInteriorVehicleDataModule* testStruct = [[SDLReleaseInteriorVehicleDataModule alloc] init];

        expect(testStruct.moduleType).to(beNil());
        expect(testStruct.moduleId).to(beNil());
    });

    it(@"should initialize correctly with initWithModuleType:", ^{
        SDLReleaseInteriorVehicleDataModule *testStruct = [[SDLReleaseInteriorVehicleDataModule alloc] initWithModuleType:SDLModuleTypeSeat];

        expect(testStruct.moduleType).to(equal(SDLModuleTypeSeat));
    });

    it(@"should initialize correctly with initWithModuleType: ModuleId:", ^{
        SDLReleaseInteriorVehicleDataModule *testStruct = [[SDLReleaseInteriorVehicleDataModule alloc] initWithModuleType:SDLModuleTypeHMISettings ModuleId:@"ModuleId"];

        expect(testStruct.moduleType).to(equal(SDLModuleTypeHMISettings));
        expect(testStruct.moduleId).to(equal(@"ModuleId"));

    });
    
});

QuickSpecEnd
