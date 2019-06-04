//
//  SDLModuleInfoSpec.m
//  SmartDeviceLinkTests
//

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLModuleInfo.h"
#import "SDLGrid.h"
#import "SDLRPCParameterNames.h"

QuickSpecBegin(SDLModuleInfoSpec)

SDLGrid *locationGrid = [[SDLGrid alloc] init];
SDLGrid *serviceGrid = [[SDLGrid alloc] init];

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLModuleInfo* testStruct = [[SDLModuleInfo alloc] init];
        testStruct.moduleId = @"moduleId";
        testStruct.location = locationGrid;
        testStruct.serviceArea = serviceGrid;
        testStruct.allowMultipleAccess= @(NO);

        expect(testStruct.moduleId).to(equal(@"moduleId"));
        expect(testStruct.location).to(equal(locationGrid));
        expect(testStruct.serviceArea).to(equal(serviceGrid));
        expect(testStruct.allowMultipleAccess).to(equal(@(NO)));
    });

    it(@"Should set and get correctly", ^ {
        SDLModuleInfo* testStruct = [[SDLModuleInfo alloc] initWithModuleId:@"moduleID"];

        expect(testStruct.moduleId).to(equal(@"moduleID"));
        expect(testStruct.location).to(beNil());
        expect(testStruct.serviceArea).to(beNil());
        expect(testStruct.allowMultipleAccess).to(beNil());

    });

    it(@"Should set and get correctly", ^ {
        SDLModuleInfo* testStruct = [[SDLModuleInfo alloc] initWithModuleId:@"moduleID" location:locationGrid serviceArea:serviceGrid allowMultipleAccess:NO];

        expect(testStruct.moduleId).to(equal(@"moduleID"));
        expect(testStruct.location).to(equal(locationGrid));
        expect(testStruct.serviceArea).to(equal(serviceGrid));
        expect(testStruct.allowMultipleAccess).to(equal(@(NO)));
    });

    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary* dict = [@{SDLRPCParameterNameModuleId:@"moduleId",
                                       SDLRPCParameterNameLocation:locationGrid,
                                       SDLRPCParameterNameServiceArea:serviceGrid,
                                       SDLRPCParameterNameAllowMultipleAccess:@(NO)
                                       } mutableCopy];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        SDLModuleInfo* testStruct = [[SDLModuleInfo alloc] initWithDictionary:dict];
#pragma clang diagnostic pop

        expect(testStruct.moduleId).to(equal(@"moduleId"));
        expect(testStruct.location).to(equal(locationGrid));
        expect(testStruct.serviceArea).to(equal(serviceGrid));
        expect(testStruct.allowMultipleAccess).to(equal(@(NO)));

    });

    it(@"Should return nil if not set", ^ {
        SDLModuleInfo* testStruct = [[SDLModuleInfo alloc] init];

        expect(testStruct.moduleId).to(beNil());
        expect(testStruct.location).to(beNil());
        expect(testStruct.serviceArea).to(beNil());
        expect(testStruct.allowMultipleAccess).to(beNil());
    });
});

QuickSpecEnd
