//
//  SDLCreateWindowSpec.m
//

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLCreateWindow.h"
#import "SDLRPCParameterNames.h"
#import "SDLRPCFunctionNames.h"


QuickSpecBegin(SDLCreateWindowSpec)

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLCreateWindow* testRequest = [[SDLCreateWindow alloc] init];
        
        testRequest.windowID = @(12);
        testRequest.windowName = @"testWindow";
        testRequest.type = SDLWindowTypeMain;
        testRequest.associatedServiceType = @"media";
        testRequest.duplicateUpdatesFromWindowID = @(23);
        
        expect(testRequest.windowID).to(equal(@(12)));
        expect(testRequest.windowName).to(equal(@"testWindow"));
        expect(testRequest.type).to(equal(SDLWindowTypeMain));
        expect(testRequest.associatedServiceType).to(equal(@"media"));
        expect(testRequest.duplicateUpdatesFromWindowID).to(equal(@(23)));

    });
    
    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary<NSString *, id> *dict = [@{SDLRPCParameterNameRequest:
                                                           @{SDLRPCParameterNameParameters:
                                                                 @{SDLRPCParameterNameWindowID:@(12),
                                                                   SDLRPCParameterNameWindowName:@"testWindow",
                                                                   SDLRPCParameterNameType:SDLWindowTypeMain,
                                                                   SDLRPCParameterNameAssociatedServiceType:@"media",
                                                                   SDLRPCParameterNameDuplicateUpdatesFromWindowID:@(23)
                                                                   },
                                                             SDLRPCParameterNameOperationName:SDLRPCFunctionNameCreateWindow}} mutableCopy];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        SDLCreateWindow* testRequest = [[SDLCreateWindow alloc] initWithDictionary:dict];
#pragma clang diagnostic pop
        
        expect(testRequest.windowID).to(equal(@(12)));
        expect(testRequest.windowName).to(equal(@"testWindow"));
        expect(testRequest.type).to(equal(SDLWindowTypeMain));
        expect(testRequest.associatedServiceType).to(equal(@"media"));
        expect(testRequest.duplicateUpdatesFromWindowID).to(equal(@(23)));
    });
    
    it(@"should properly initialize with intWithId:name:type:", ^{
        
        SDLCreateWindow* testRequest = [[SDLCreateWindow alloc] initWithId:12 name:@"testWindow" type:SDLWindowTypeMain];
        
        expect(testRequest.windowID).to(equal(@(12)));
        expect(testRequest.windowName).to(equal(@"testWindow"));
        expect(testRequest.type).to(equal(SDLWindowTypeMain));
        expect(testRequest.associatedServiceType).to(beNil());
        expect(testRequest.duplicateUpdatesFromWindowID).to(beNil());
    });
    
    it(@"should properly initialize with intWithId:name:type:associatedServiceType:duplicateUpdatesFromWindowID", ^{
        
        SDLCreateWindow* testRequest = [[SDLCreateWindow alloc] initWithId:12 name:@"testWindow" type:SDLWindowTypeMain associatedServiceType:@"media" duplicateUpdatesFromWindowID:23];
        
        expect(testRequest.windowID).to(equal(@(12)));
        expect(testRequest.windowName).to(equal(@"testWindow"));
        expect(testRequest.type).to(equal(SDLWindowTypeMain));
        expect(testRequest.associatedServiceType).to(equal(@"media"));
        expect(testRequest.duplicateUpdatesFromWindowID).to(equal(@(23)));
    });
    
    it(@"Should return nil if not set", ^ {
        SDLCreateWindow* testRequest = [[SDLCreateWindow alloc] init];
        
        expect(testRequest.windowID).to(beNil());
        expect(testRequest.windowName).to(beNil());
        expect(testRequest.type).to(beNil());
        expect(testRequest.associatedServiceType).to(beNil());
        expect(testRequest.duplicateUpdatesFromWindowID).to(beNil());
    });
    
    
});

QuickSpecEnd
