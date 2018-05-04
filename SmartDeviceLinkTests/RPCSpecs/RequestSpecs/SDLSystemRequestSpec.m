//
//  SDLSystemRequestSpec.m
//  SmartDeviceLink


#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLSystemRequest.h"
#import "SDLRequestType.h"
#import "SDLNames.h"

QuickSpecBegin(SDLSystemRequestSpec)

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLSystemRequest* testRequest = [[SDLSystemRequest alloc] init];
        
        testRequest.requestType = SDLRequestTypeAuthenticationRequest;
        testRequest.requestSubType = @"OEM_SPECIFIC";
        testRequest.fileName = @"AnotherFile";
        
        expect(testRequest.requestType).to(equal(SDLRequestTypeAuthenticationRequest));
        expect(testRequest.requestSubType).to(equal(@"OEM_SPECIFIC"));
        expect(testRequest.fileName).to(equal(@"AnotherFile"));
    });
    
    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary* dict = [@{SDLNameRequest:
                                           @{SDLNameParameters:
                                                 @{SDLNameRequestType:SDLRequestTypeAuthenticationRequest,
                                                   SDLNameFilename:@"AnotherFile",
                                                   SDLNameRequestSubType:@"OEM_SPECIFIC"
                                                   },
                                             SDLNameOperationName:SDLNameSystemRequest}} mutableCopy];
        SDLSystemRequest* testRequest = [[SDLSystemRequest alloc] initWithDictionary:dict];
        
        expect(testRequest.requestType).to(equal(SDLRequestTypeAuthenticationRequest));
        expect(testRequest.requestSubType).to(equal(@"OEM_SPECIFIC"));
        expect(testRequest.fileName).to(equal(@"AnotherFile"));
    });
    
    it(@"Should return nil if not set", ^ {
        SDLSystemRequest* testRequest = [[SDLSystemRequest alloc] init];
        
        expect(testRequest.requestType).to(beNil());
        expect(testRequest.requestSubType).to(beNil());
        expect(testRequest.fileName).to(beNil());
    });
});

QuickSpecEnd
