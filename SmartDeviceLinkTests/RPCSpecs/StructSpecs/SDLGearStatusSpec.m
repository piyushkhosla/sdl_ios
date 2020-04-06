//
//  SDLGearStatusSpec.m
//  SmartDeviceLinkTests
//

#import <Foundation/Foundation.h>
#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLGearStatus.h"
#import "SDLPRNDL.h"
#import "SDLTransmissionType.h"
#import "SDLRPCParameterNames.h"


QuickSpecBegin(SDLGearStatusSpec)

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLGearStatus* testStruct = [[SDLGearStatus alloc] init];

        testStruct.userSelectedGear = SDLPRNDLSixth;
        testStruct.actualGear = SDLPRNDLNinth;
        testStruct.transmissionType = SDLTransmissionTypeManual;

        expect(testStruct.userSelectedGear).to(equal(SDLPRNDLSixth));
        expect(testStruct.actualGear).to(equal(SDLPRNDLNinth));
        expect(testStruct.transmissionType).to(equal(SDLTransmissionTypeManual));
    });

    it(@"Should set and get correctly", ^ {
        SDLGearStatus* testStruct = [[SDLGearStatus alloc] initWithUserSelectedGear:SDLPRNDLSixth actualGear:SDLPRNDLTenth transmissionType:SDLTransmissionTypeSemiAutomatic];

        expect(testStruct.userSelectedGear).to(equal(SDLPRNDLSixth));
        expect(testStruct.actualGear).to(equal(SDLPRNDLTenth));
        expect(testStruct.transmissionType).to(equal(SDLTransmissionTypeSemiAutomatic));
    });

    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary* dict = [@{SDLRPCParameterNameUserSelectedGear:SDLPRNDLDrive,
                                       SDLRPCParameterNameActualGear:SDLPRNDLNeutral,
                                       SDLRPCParameterNameTransmissionType:SDLTransmissionTypeElectricVariable
                                       } mutableCopy];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        SDLGearStatus* testStruct = [[SDLGearStatus alloc] initWithDictionary:dict];
#pragma clang diagnostic pop

        expect(testStruct.userSelectedGear).to(equal(SDLPRNDLDrive));
        expect(testStruct.actualGear).to(equal(SDLPRNDLNeutral));
        expect(testStruct.transmissionType).to(equal(SDLTransmissionTypeElectricVariable));

    });

    it(@"Should return nil if not set", ^ {
        SDLGearStatus* testStruct = [[SDLGearStatus alloc] init];
        
        expect(testStruct.userSelectedGear).to(beNil());
        expect(testStruct.actualGear).to(beNil());
        expect(testStruct.transmissionType).to(beNil());
    });
});

QuickSpecEnd
