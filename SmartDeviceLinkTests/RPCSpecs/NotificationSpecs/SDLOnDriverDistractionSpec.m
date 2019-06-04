//
//  SDLOnDriverDistractionSpec.m
//  SmartDeviceLink


#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLDriverDistractionState.h"
#import "SDLOnDriverDistraction.h"
#import "SDLRPCParameterNames.h"
#import "SDLRPCFunctionNames.h"

QuickSpecBegin(SDLOnDriverDistractionSpec)

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLOnDriverDistraction* testNotification = [[SDLOnDriverDistraction alloc] init];
        
        testNotification.state = SDLDriverDistractionStateOn;
        testNotification.lockScreenDismissalEnabled = @(NO);
        
        expect(testNotification.state).to(equal(SDLDriverDistractionStateOn));
        expect(testNotification.lockScreenDismissalEnabled).to(equal(@(NO)));

    });
    
    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary* dict = [@{SDLRPCParameterNameNotification:
                                           @{SDLRPCParameterNameParameters:
                                                 @{SDLRPCParameterNameState:SDLDriverDistractionStateOn,
                                                   SDLRPCParameterNameLockScreenDismissalEnabled:@(YES)
                                                   },
                                             SDLRPCParameterNameOperationName:SDLRPCFunctionNameOnDriverDistraction}} mutableCopy];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        SDLOnDriverDistraction* testNotification = [[SDLOnDriverDistraction alloc] initWithDictionary:dict];
#pragma clang diagnostic pop
        
        expect(testNotification.state).to(equal(SDLDriverDistractionStateOn));
        expect(testNotification.lockScreenDismissalEnabled).to(equal(@(YES)));
    });
    
    it(@"Should return nil if not set", ^ {
        SDLOnDriverDistraction* testNotification = [[SDLOnDriverDistraction alloc] init];
        
        expect(testNotification.state).to(beNil());
        expect(testNotification.lockScreenDismissalEnabled).to(beNil());
    });
});

QuickSpecEnd
