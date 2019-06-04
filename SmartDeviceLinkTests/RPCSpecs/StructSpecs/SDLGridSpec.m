//
//  SDLGridSpec.m
//  SmartDeviceLinkTests
//

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLGrid.h"
#import "SDLRPCParameterNames.h"

QuickSpecBegin(SDLGridSpec)

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLGrid *testStruct = [[SDLGrid alloc] init];

        testStruct.col = @(2);
        testStruct.row = @(12);
        testStruct.level = @(1);
        testStruct.colspan = @(23);
        testStruct.rowspan = @(24);
        testStruct.levelspan = @(21);

        expect(testStruct.col).to(equal(@(2)));
        expect(testStruct.row).to(equal(@(12)));
        expect(testStruct.level).to(equal(@(1)));
        expect(testStruct.colspan).to(equal(@(23)));
        expect(testStruct.rowspan).to(equal(@(24)));
        expect(testStruct.levelspan).to(equal(@(21)));

    });

    it(@"Should get correctly when initialized", ^ {
        NSDictionary *dict = @{SDLRPCParameterNameCol : @(2),
                               SDLRPCParameterNameRow : @(12),
                               SDLRPCParameterNameLevel : @(1),
                               SDLRPCParameterNameColSpan : @(12),
                               SDLRPCParameterNameRowSpan : @(24),
                               SDLRPCParameterNameLevelSpan : @(21),
                               };
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        SDLGrid *testStruct = [[SDLGrid alloc] initWithDictionary:dict];
#pragma clang diagnostic pop

        expect(testStruct.col).to(equal(@(2)));
        expect(testStruct.row).to(equal(@(12)));
        expect(testStruct.level).to(equal(@(1)));
        expect(testStruct.colspan).to(equal(@(12)));
        expect(testStruct.rowspan).to(equal(@(24)));
        expect(testStruct.levelspan).to(equal(@(21)));
    });

    it(@"Should return nil if not set", ^ {
        SDLGrid *testStruct = [[SDLGrid alloc] init];

        expect(testStruct.col).to(beNil());
        expect(testStruct.row).to(beNil());
        expect(testStruct.level).to(beNil());
        expect(testStruct.colspan).to(beNil());
        expect(testStruct.rowspan).to(beNil());
        expect(testStruct.levelspan).to(beNil());
    });
});

QuickSpecEnd
