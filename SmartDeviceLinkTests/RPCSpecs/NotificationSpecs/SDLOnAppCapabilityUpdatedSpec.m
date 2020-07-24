//
//  SDLOnAppCapabilityUpdatedSpec.m
//  SmartDeviceLinkTests
//

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLOnAppCapabilityUpdated.h"
#import "SDLRPCParameterNames.h"
#import "SDLRPCFunctionNames.h"
#import "SDLAppCapability.h"

QuickSpecBegin(SDLOnAppCapabilityUpdatedSpec)

SDLAppCapability* appCapabilityObj = [[SDLAppCapability alloc] init];


describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLOnAppCapabilityUpdated* testNotification = [[SDLOnAppCapabilityUpdated alloc] init];
        
        testNotification.appCapability = appCapabilityObj;
        
        expect(testNotification.appCapability).to(equal(appCapabilityObj));
    });
    it(@"Should get correctly when initialized", ^ {
        SDLOnAppCapabilityUpdated* testNotification = [[SDLOnAppCapabilityUpdated alloc] initWithAppCapability:appCapabilityObj];
                
        expect(testNotification.appCapability).to(equal(appCapabilityObj));
    });
    
    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary* dict = [@{SDLRPCParameterNameNotification:
                                     @{SDLRPCParameterNameParameters:
                                     @{SDLRPCParameterNameAppCapability:appCapabilityObj},
                                       SDLRPCParameterNameOperationName:SDLRPCFunctionNameOnAppCapabilityUpdated}} mutableCopy];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        SDLOnAppCapabilityUpdated* testNotification = [[SDLOnAppCapabilityUpdated alloc] initWithDictionary:dict];
#pragma clang diagnostic pop
        
        expect(testNotification.appCapability).to(equal(appCapabilityObj));
    });
    
    it(@"Should return nil if not set", ^ {
        SDLOnAppCapabilityUpdated* testNotification = [[SDLOnAppCapabilityUpdated alloc] init];
        
        expect(testNotification.appCapability).to(beNil());
    });
});

QuickSpecEnd
