//
//  SDLWindowTypeCapabilitiesSpec.m
//  SmartDeviceLinkTests
//

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLWindowTypeCapabilities.h"
#import "SDLWindowType.h"
#import "SDLRPCParameterNames.h"

QuickSpecBegin( SDLWindowTypeCapabilitiesSpec)

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
         SDLWindowTypeCapabilities* testStruct = [[ SDLWindowTypeCapabilities alloc] init];
        
        testStruct.type = SDLWindowTypeMain;
        testStruct.maximumNumberOfWindows = @(12);
        
        expect(testStruct.type).to(equal(SDLWindowTypeMain));
        expect(testStruct.maximumNumberOfWindows).to(equal(@(12)));
    });
    
    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary* dict = [@{SDLRPCParameterNameType:SDLWindowTypeMain,
                                       SDLRPCParameterNameMaximumNumberOfWindows:@(12)} mutableCopy];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
         SDLWindowTypeCapabilities* testStruct = [[ SDLWindowTypeCapabilities alloc] initWithDictionary:dict];
#pragma clang diagnostic pop
        
        expect(testStruct.type).to(equal(SDLWindowTypeMain));
        expect(testStruct.maximumNumberOfWindows).to(equal(@(12)));
    });
    
    it(@"Should return nil if not set", ^ {
        SDLWindowTypeCapabilities* testStruct = [[ SDLWindowTypeCapabilities alloc] initWithType:SDLWindowTypeMain maximumNumberOfWindows:12];
        
        expect(testStruct.type).to(equal(SDLWindowTypeMain));
        expect(testStruct.maximumNumberOfWindows).to(equal(@(12)));
    });
    
    it(@"Should return nil if not set", ^ {
         SDLWindowTypeCapabilities* testStruct = [[ SDLWindowTypeCapabilities alloc] init];
        
        expect(testStruct.type).to(beNil());
        expect(testStruct.maximumNumberOfWindows).to(beNil());
    });
});

QuickSpecEnd
