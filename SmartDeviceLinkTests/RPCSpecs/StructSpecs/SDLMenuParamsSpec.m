//
//  SDLMenuParamsSpec.m
//  SmartDeviceLink


#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLMenuParams.h"
#import "SDLNames.h"
#import "SDLImage.h"

QuickSpecBegin(SDLMenuParamsSpec)

describe(@"Initialization tests", ^{
    __block UInt32 testParentId = 504320489;
    __block UInt16 testPosition = testPosition;
    __block NSString *testMenuName = @"Test Menu";
    __block SDLImage *menuIcon = [[SDLImage alloc] init];

    it(@"should properly initialize init", ^{
        SDLMenuParams* testStruct = [[SDLMenuParams alloc] init];

        expect(testStruct.parentID).to(beNil());
        expect(testStruct.position).to(beNil());
        expect(testStruct.menuName).to(beNil());
        expect(testStruct.menuIcon).to(beNil());
    });

    it(@"should properly initialize initWithDictionary", ^{
        NSMutableDictionary* dict = [@{SDLNameParentId:@(testParentId),
                                       SDLNamePosition:@(testPosition),
                                       SDLNameMenuName:testMenuName,
                                       SDLNameMenuIcon:menuIcon
                                       } mutableCopy];
        SDLMenuParams* testStruct = [[SDLMenuParams alloc] initWithDictionary:dict];

        expect(testStruct.parentID).to(equal(@(testParentId)));
        expect(testStruct.position).to(equal(@(testPosition)));
        expect(testStruct.menuName).to(equal(testMenuName));
        expect(testStruct.menuIcon).to(equal(menuIcon));
    });

    it(@"should properly initialize initWithMenuName", ^{
        SDLMenuParams* testStruct = [[SDLMenuParams alloc] initWithMenuName:testMenuName];

        expect(testStruct.parentID).to(beNil());
        expect(testStruct.position).to(beNil());
        expect(testStruct.menuName).to(equal(testMenuName));
        expect(testStruct.menuIcon).to(beNil());
    });

    it(@"should properly initialize initWithMenuName:parentId:position:", ^{
        SDLMenuParams* testStruct = [[SDLMenuParams alloc] initWithMenuName:testMenuName parentId:testParentId position:testPosition menuIcon:menuIcon];

        expect(testStruct.parentID).to(equal(@(testParentId)));
        expect(testStruct.position).to(equal(@(testPosition)));
        expect(testStruct.menuName).to(equal(testMenuName));
        expect(testStruct.menuIcon).to(equal(menuIcon));
    });

    it(@"Should set and get correctly", ^{
        SDLMenuParams* testStruct = [[SDLMenuParams alloc] init];

        testStruct.parentID = @504320489;
        testStruct.position = @256;
        testStruct.menuName = @"Menu";
        testStruct.menuIcon = menuIcon;

        expect(testStruct.parentID).to(equal(@504320489));
        expect(testStruct.position).to(equal(@256));
        expect(testStruct.menuName).to(equal(@"Menu"));
        expect(testStruct.menuIcon).to(equal(menuIcon));
    });
});

QuickSpecEnd
