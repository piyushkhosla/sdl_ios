//
//  SDLKeyboardCapabilitiesSpec.m
//  SmartDeviceLinkTests
//

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLKeyboardLayoutCapability.h"
#import "SDLKeyboardCapabilities.h"
#import "SDLKeyboardLayout.h"
#import "SDLRPCParameterNames.h"

QuickSpecBegin(SDLKeyboardCapabilitiesSpec)

__block SDLKeyboardLayoutCapability *testConfigurableKeyboard = nil;

describe(@"Getter/Setter Tests", ^ {
    beforeEach(^{
        
        testConfigurableKeyboard = [[SDLKeyboardLayoutCapability alloc] init];
    });
    
    it(@"Should set and get correctly", ^ {
        SDLKeyboardCapabilities* testStruct = [[SDLKeyboardCapabilities alloc] init];
        
        testStruct.supportedKeyboards = @[testConfigurableKeyboard];
        testStruct.maskInputCharactersSupported = @1;

        expect(testStruct.supportedKeyboards).to(equal(@[testConfigurableKeyboard]));
        expect(testStruct.maskInputCharactersSupported).to(equal(@1));
    });
      
    
    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary<NSString *, id> *dict = [@{SDLRPCParameterNameSupportedKeyboards:@[testConfigurableKeyboard],
                                                       SDLRPCParameterNameMaskInputCharactersSupported:@1} mutableCopy];
        SDLKeyboardCapabilities* testStruct = [[SDLKeyboardCapabilities alloc] initWithDictionary:dict];
        
        expect(testStruct.supportedKeyboards).to(equal(@[testConfigurableKeyboard]));
        expect(testStruct.maskInputCharactersSupported).to(equal(@1));
    });
    
    it(@"Should get correctly when initialized", ^ {
        SDLKeyboardCapabilities* testStruct = [[SDLKeyboardCapabilities alloc] initWithMaskInputCharactersSupported:@1 supportedKeyboards:@[testConfigurableKeyboard]];
        
        expect(testStruct.supportedKeyboards).to(equal(@[testConfigurableKeyboard]));
        expect(testStruct.maskInputCharactersSupported).to(equal(@1));
    });
    
    it(@"Should return nil if not set", ^ {
        SDLKeyboardCapabilities* testStruct = [[SDLKeyboardCapabilities alloc] init];
        
        expect(testStruct.supportedKeyboards).to(beNil());
        expect(testStruct.maskInputCharactersSupported).to(beNil());
    });
});

QuickSpecEnd

