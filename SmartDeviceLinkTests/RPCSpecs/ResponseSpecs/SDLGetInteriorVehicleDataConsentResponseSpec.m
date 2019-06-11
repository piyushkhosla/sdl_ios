//
//  SDLGetInteriorVehicleDataConsentResponseSpec.m
//  SmartDeviceLinkTests
//

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLGetInteriorVehicleDataConsentResponse.h"
#import "SDLRPCParameterNames.h"
#import "SDLRPCFunctionNames.h"

QuickSpecBegin(SDLGetInteriorVehicleDataConsentResponseSpec)

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLGetInteriorVehicleDataConsentResponse* testResponse = [[SDLGetInteriorVehicleDataConsentResponse alloc] init];

        testResponse.allowed = @[@(YES),@(NO),@(YES)];

        expect(testResponse.allowed).to(equal(@[@(YES),@(NO),@(YES)]));
    });

    it(@"Should get correctly when initialized", ^ {
        NSDictionary<NSString *, id> *dict = @{SDLRPCParameterNameResponse:
                                                   @{SDLRPCParameterNameParameters:
                                                         @{SDLRPCParameterNameAllowed:@[@(YES),@(NO),@(YES)],
                                                           },
                                                     SDLRPCParameterNameOperationName:SDLRPCFunctionNameGetInteriorVehicleDataConsent}};
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        SDLGetInteriorVehicleDataConsentResponse* testResponse = [[SDLGetInteriorVehicleDataConsentResponse alloc] initWithDictionary:dict];
#pragma clang diagnostic pop

        expect(testResponse.allowed).to(equal(@[@(YES),@(NO),@(YES)]));
    });

    it(@"Should return nil if not set", ^ {
        SDLGetInteriorVehicleDataConsentResponse* testResponse = [[SDLGetInteriorVehicleDataConsentResponse alloc] init];

         expect(testResponse.allowed).to(beNil());
    });
});

QuickSpecEnd
