//
//  SDLButtonPressSpec.m
//  SmartDeviceLink-iOS
//

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLRPCParameterNames.h"
#import "SDLRPCFunctionNames.h"
#import "SDLButtonPress.h"
#import "SDLModuleType.h"
#import "SDLButtonName.h"
#import "SDLButtonPressMode.h"

QuickSpecBegin(SDLButtonPressSpec)

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLButtonPress* testRequest = [[SDLButtonPress alloc] init];
        
        testRequest.moduleType = SDLModuleTypeClimate;
        testRequest.buttonName = SDLButtonNameAC;
        testRequest.buttonPressMode = SDLButtonPressModeShort;
        testRequest.moduleId = @"moduleId";
        
        expect(testRequest.moduleType).to(equal(SDLModuleTypeClimate));
        expect(testRequest.buttonName).to(equal(SDLButtonNameAC));
        expect(testRequest.buttonPressMode).to(equal(SDLButtonPressModeShort));
        expect(testRequest.moduleId).to(equal(@"moduleId"));

    });
    
    it(@"Should get correctly when initialized with a dictionary", ^ {
        NSMutableDictionary<NSString *, id> *dict = [@{SDLRPCParameterNameRequest:
                                                           @{SDLRPCParameterNameParameters:
                                                                 @{SDLRPCParameterNameModuleType : SDLModuleTypeClimate,
                                                                   SDLRPCParameterNameButtonName : SDLButtonNameAC,
                                                                   SDLRPCParameterNameButtonPressMode : SDLButtonPressModeShort,
                                                                   SDLRPCParameterNameModuleId : @"moduleId"
                                                                   },
                                                             SDLRPCParameterNameOperationName:SDLRPCFunctionNameButtonPress}} mutableCopy];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        SDLButtonPress* testRequest = [[SDLButtonPress alloc] initWithDictionary:dict];
#pragma clang diagnostic pop

        expect(testRequest.moduleType).to(equal(SDLModuleTypeClimate));
        expect(testRequest.buttonName).to(equal(SDLButtonNameAC));
        expect(testRequest.buttonPressMode).to(equal(SDLButtonPressModeShort));
        expect(testRequest.moduleId).to(equal(@"moduleId"));

    });

    it(@"Should get correctly when initialized with button name and module type properties", ^ {
        SDLButtonPress* testRequest = [[SDLButtonPress alloc] initWithButtonName:SDLButtonNameAC moduleType:SDLModuleTypeClimate];

        expect(testRequest.buttonName).to(equal(SDLButtonNameAC));
        expect(testRequest.moduleType).to(equal(SDLModuleTypeClimate));
    });

    it(@"Should get correctly when initialized with button name and module type properties", ^ {
        SDLButtonPress* testRequest = [[SDLButtonPress alloc] initWithButtonName:SDLButtonNameAC moduleType:SDLModuleTypeClimate moduleId:@"moduleId"];

        expect(testRequest.buttonName).to(equal(SDLButtonNameAC));
        expect(testRequest.moduleType).to(equal(SDLModuleTypeClimate));
        expect(testRequest.moduleId).to(equal(@"moduleId"));

    });

    it(@"Should return nil if not set", ^ {
        SDLButtonPress* testRequest = [[SDLButtonPress alloc] init];
        
        expect(testRequest.moduleType).to(beNil());
        expect(testRequest.buttonName).to(beNil());
        expect(testRequest.buttonPressMode).to(beNil());
        expect(testRequest.moduleId).to(beNil());

    });
});

QuickSpecEnd
