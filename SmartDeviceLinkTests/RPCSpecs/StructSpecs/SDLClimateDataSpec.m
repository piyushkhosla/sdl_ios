//
//  SDLClimateData.m
//  SmartDeviceLink


#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLClimateData.h"
#import "SDLTemperature.h"
#import "SDLRPCParameterNames.h"


QuickSpecBegin(SDLClimateDataSpec)

__block SDLTemperature* temp = [[SDLTemperature alloc] init];

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLClimateData* testStruct = [[SDLClimateData alloc] init];
        
        testStruct.externalTemperature = temp;
        testStruct.cabinTemperature = temp;
        testStruct.atmosphericPressure = @27;

        
        expect(testStruct.externalTemperature).to(equal(temp));
        expect(testStruct.cabinTemperature).to(equal(temp));
        expect(testStruct.atmosphericPressure).to(equal(@27));

    });
    
    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary<NSString *, id> *dict = [@{SDLRPCParameterNameExternalTemperature:temp,
                                                       SDLRPCParameterNameCabinTemperature:temp,
                                                       SDLRPCParameterNameAtmosphericPressure:@45} mutableCopy];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        SDLClimateData* testStruct = [[SDLClimateData alloc] initWithDictionary:dict];
#pragma clang diagnostic pop
        
        expect(testStruct.externalTemperature).to(equal(temp));
        expect(testStruct.cabinTemperature).to(equal(temp));
        expect(testStruct.atmosphericPressure).to(equal(@45));
    });
    
    it(@"Should get correctly when initialized with initWithExternalTemperature:cabinTemperature:atmosphericPressure", ^{
            SDLClimateData* testStruct = [[SDLClimateData alloc] initWithExternalTemperature:temp cabinTemperature:temp atmosphericPressure:43];
        
            expect(testStruct.externalTemperature).to(equal(temp));
            expect(testStruct.cabinTemperature).to(equal(temp));
            expect(testStruct.atmosphericPressure).to(equal(@43));

    });
    
    it(@"Should return nil if not set", ^ {
            SDLClimateData* testStruct = [[SDLClimateData alloc] init];
        
            expect(testStruct.externalTemperature).to(beNil());
            expect(testStruct.cabinTemperature).to(beNil());
            expect(testStruct.atmosphericPressure).to(beNil());


    });
});

QuickSpecEnd
