//
//  SDLKeyboardLayoutCapabilitySpec.m
//  SmartDeviceLinkTests
//

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLKeyboardLayoutCapability.h"
#import "SDLRPCParameterNames.h"
#import "SDLKeyboardLayout.h"

QuickSpecBegin(SDLKeyboardLayoutCapabilitySpec)

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLKeyboardLayoutCapability* testStruct = [[SDLKeyboardLayoutCapability alloc] init];
        
        testStruct.keyboardLayout = SDLKeyboardLayoutNumeric;
        testStruct.numConfigurableKeys = @1;
        
        expect(testStruct.keyboardLayout).to(equal(SDLKeyboardLayoutNumeric));
        expect(testStruct.numConfigurableKeys).to(equal(@1));
    });
    
    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary<NSString *, id> *dict = [@{SDLRPCParameterNameKeyboardLayout:SDLKeyboardLayoutNumeric,
                                                       SDLRPCParameterNameNumConfigurableKeys:@1} mutableCopy];
        SDLKeyboardLayoutCapability* testStruct = [[SDLKeyboardLayoutCapability alloc] initWithDictionary:dict];
        
        expect(testStruct.keyboardLayout).to(equal(SDLKeyboardLayoutNumeric));
        expect(testStruct.numConfigurableKeys).to(equal(@1));
    });
    
    it(@"Should get correctly when initialized", ^ {
        SDLKeyboardLayoutCapability* testStruct = [[SDLKeyboardLayoutCapability alloc] initWithKeyboardLayout:SDLKeyboardLayoutNumeric numConfigurableKeys:1];
        
        expect(testStruct.keyboardLayout).to(equal(SDLKeyboardLayoutNumeric));
        expect(testStruct.numConfigurableKeys).to(equal(@1));
    });
    
    it(@"Should return nil if not set", ^ {
        SDLKeyboardLayoutCapability* testStruct = [[SDLKeyboardLayoutCapability alloc] init];
        
        expect(testStruct.keyboardLayout).to(beNil());
        expect(testStruct.numConfigurableKeys).to(beNil());
    });
});

QuickSpecEnd

