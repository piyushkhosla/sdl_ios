//
//  SDLSeatLocationCapabilitySpec.m
//  SmartDeviceLinkTests
//

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLSeatLocationCapability.h"
#import "SDLSeatLocation.h"
#import "SDLRPCParameterNames.h"

QuickSpecBegin(SDLSeatLocationCapabilitySpec)

SDLSeatLocation *seatLoc = [[SDLSeatLocation alloc] init];

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLSeatLocationCapability* testStruct = [[SDLSeatLocationCapability alloc] init];

        testStruct.col = @(1);
        testStruct.row = @(2);
        testStruct.level = @(3);
        testStruct.seats = @[seatLoc];


        expect(testStruct.col).to(equal(@(1)));
        expect(testStruct.row).to(equal(@(2)));
        expect(testStruct.level).to(equal(@(3)));
        expect(testStruct.seats).to(equal(@[seatLoc]));

    });

    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary<NSString *, id> *dict = [@{SDLRPCParameterNameCol:@(1),
                                                       SDLRPCParameterNameRow:@(2),
                                                       SDLRPCParameterNameLevel:@(3),
                                                       SDLRPCParameterNameSeats:@[seatLoc]
                                                       } mutableCopy];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        SDLSeatLocationCapability* testStruct = [[SDLSeatLocationCapability alloc] initWithDictionary:dict];
#pragma clang diagnostic pop

        expect(testStruct.col).to(equal(@(1)));
        expect(testStruct.row).to(equal(@(2)));
        expect(testStruct.level).to(equal(@(3)));
        expect(testStruct.seats).to(equal(@[seatLoc]));    });

    it(@"Should return nil if not set", ^ {
        SDLSeatLocationCapability* testStruct = [[SDLSeatLocationCapability alloc] init];

        expect(testStruct.col).to(beNil());
        expect(testStruct.row).to(beNil());
        expect(testStruct.level).to(beNil());
        expect(testStruct.seats).to(beNil());
    });

    it(@"Should return nil if not set", ^ {
        SDLSeatLocationCapability* testStruct = [[SDLSeatLocationCapability alloc] initWithColumn:1 row:2 level:3 seats:@[seatLoc]];

        expect(testStruct.col).to(equal(@(1)));
        expect(testStruct.row).to(equal(@(2)));
        expect(testStruct.level).to(equal(@(3)));
        expect(testStruct.seats).to(equal(@[seatLoc]));
    });
});

QuickSpecEnd
