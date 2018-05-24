//
//  SDLAddSubMenuSpec.m
//  SmartDeviceLink


#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLAddSubMenu.h"
#import "SDLNames.h"
#import "SDLMenuParams.h"

QuickSpecBegin(SDLAddSubMenuSpec)

__block SDLMenuParams* menuParams = [[SDLMenuParams alloc] init];

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLAddSubMenu* testRequest = [[SDLAddSubMenu alloc] init];
        
        testRequest.menuID = @4345645;
        testRequest.position = @27;
        testRequest.menuName = @"Welcome to the menu";
        testRequest.menuParams = menuParams;
        
        expect(testRequest.menuID).to(equal(@4345645));
        expect(testRequest.position).to(equal(@27));
        expect(testRequest.menuName).to(equal(@"Welcome to the menu"));
        expect(testRequest.menuParams).to(equal(menuParams));
    });
    
    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary<NSString *, id> *dict = [@{SDLNameRequest:
                                                           @{SDLNameParameters:
                                                                 @{SDLNameMenuId:@4345645,
                                                                   SDLNamePosition:@27,
                                                                   SDLNameMenuName:@"Welcome to the menu",
                                                                   SDLNameMenuParams:menuParams},
                                                             SDLNameOperationName:SDLNameAddSubMenu}} mutableCopy];
        SDLAddSubMenu* testRequest = [[SDLAddSubMenu alloc] initWithDictionary:dict];

        expect(testRequest.menuID).to(equal(@4345645));
        expect(testRequest.position).to(equal(@27));
        expect(testRequest.menuName).to(equal(@"Welcome to the menu"));
        expect(testRequest.menuParams).to(equal(menuParams));
    });
    
    it(@"Should return nil if not set", ^ {
        SDLAddSubMenu* testRequest = [[SDLAddSubMenu alloc] init];
        
        expect(testRequest.menuID).to(beNil());
        expect(testRequest.position).to(beNil());
        expect(testRequest.menuName).to(beNil());
        expect(testRequest.menuParams).to(beNil());
    });

    it(@"Should return nil if not set", ^ {
        SDLAddSubMenu* testRequest = [[SDLAddSubMenu alloc] initWithMenuParams:menuParams];

        expect(testRequest.menuParams).to(equal(menuParams));
        expect(testRequest.menuID).to(beNil());
        expect(testRequest.position).to(beNil());
        expect(testRequest.menuName).to(beNil());
    });
    
});

QuickSpecEnd
