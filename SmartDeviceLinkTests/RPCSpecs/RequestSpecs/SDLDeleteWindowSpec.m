//
//  SDLDeleteWindowSpec.m
//

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLDeleteWindow.h"
#import "SDLRPCParameterNames.h"
#import "SDLRPCFunctionNames.h"

QuickSpecBegin(SDLDeleteWindowSpec)

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLDeleteWindow* testRequest = [[SDLDeleteWindow alloc] init];
        
        testRequest.windowID = @(12);
        
        expect(testRequest.windowID).to(equal(@(12)));
    });
    
    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary<NSString *, id> *dict = [@{SDLRPCParameterNameRequest:
                                                           @{SDLRPCParameterNameParameters:
                                                                 @{SDLRPCParameterNameWindowID:@(12)},
                                                             SDLRPCParameterNameOperationName:SDLRPCFunctionNameDeleteWindow}} mutableCopy];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        SDLDeleteWindow* testRequest = [[SDLDeleteWindow alloc] initWithDictionary:dict];
#pragma clang diagnostic pop
        
        expect(testRequest.windowID).to(equal(@(12)));
    });
    
    it(@"Should return nil if not set", ^ {
        SDLDeleteWindow* testRequest = [[SDLDeleteWindow alloc] init];
        
        expect(testRequest.windowID).to(beNil());
    });
});

QuickSpecEnd
