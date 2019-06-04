//
//  SDLGetInteriorVehicleDataConsentSpec.m
//  SmartDeviceLinkTests
//

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLGetInteriorVehicleDataConsent.h"
#import "SDLRPCParameterNames.h"
#import "SDLRPCFunctionNames.h"

QuickSpecBegin(SDLGetInteriorVehicleDataConsentSpec)

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLGetInteriorVehicleDataConsent* testRequest = [[SDLGetInteriorVehicleDataConsent alloc] init];

        testRequest.moduleType = SDLModuleTypeClimate;
        testRequest.moduleIds = @[@"moduleId1",@"moduleId2"];

        expect(testRequest.moduleType).to(equal(SDLModuleTypeClimate));
        expect(testRequest.moduleIds).to(equal(@[@"moduleId1",@"moduleId2"]));

    });

    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary<NSString *, id> *dict = [@{SDLRPCParameterNameRequest:
                                                           @{SDLRPCParameterNameParameters:
                                                                 @{SDLRPCParameterNameModuleIds:@[@"moduleId1",@"moduleId2"],
                                                                   SDLRPCParameterNameModuleType : SDLModuleTypeAudio
                                                                   },
                                                             SDLRPCParameterNameOperationName:SDLRPCFunctionNameGetInteriorVehicleDataConsent}} mutableCopy];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        SDLGetInteriorVehicleDataConsent* testRequest = [[SDLGetInteriorVehicleDataConsent alloc] initWithDictionary:dict];
#pragma clang diagnostic pop

        expect(testRequest.moduleType).to(equal(SDLModuleTypeAudio));
        expect(testRequest.moduleIds).to(equal(@[@"moduleId1",@"moduleId2"]));
    });

    it(@"Should return nil if not set", ^ {
        SDLGetInteriorVehicleDataConsent* testRequest = [[SDLGetInteriorVehicleDataConsent alloc] init];

        expect(testRequest.moduleType).to(beNil());
        expect(testRequest.moduleIds).to(beNil());

    });
});

QuickSpecEnd
