//
//  SDLSeatLocationSpec.m
//  SmartDeviceLinkTests
//

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLSeatLocation.h"
#import "SDLGrid.h"
#import "SDLRPCParameterNames.h"

QuickSpecBegin(SDLSeatLocationSpec)

SDLGrid *someGrid = [[SDLGrid alloc] init];

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLSeatLocation* testStruct = [[SDLSeatLocation alloc] init];

        testStruct.grid = someGrid;

        expect(testStruct.grid).to(equal(someGrid));
    });

    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary<NSString *, id> *dict = [@{SDLRPCParameterNameGrid:someGrid} mutableCopy];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        SDLSeatLocation* testStruct = [[SDLSeatLocation alloc] initWithDictionary:dict];
#pragma clang diagnostic pop

        expect(testStruct.grid).to(equal(someGrid));
    });

    it(@"Should return nil if not set", ^ {
        SDLSeatLocation* testStruct = [[SDLSeatLocation alloc] initWithGrid:someGrid];

        expect(testStruct.grid).to(equal(someGrid));
    });

    it(@"Should return nil if not set", ^ {
        SDLSeatLocation* testStruct = [[SDLSeatLocation alloc] init];

        expect(testStruct.grid).to(beNil());
    });
});

QuickSpecEnd
