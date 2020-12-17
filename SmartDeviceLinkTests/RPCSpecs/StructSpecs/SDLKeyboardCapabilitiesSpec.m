//
//  SDLKeyboardCapabilitiesSpec.m
//  SmartDeviceLinkTests
//

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLConfigurableKeyboards.h"
#import "SDLKeyboardCapabilities.h"
#import "SDLKeyboardLayout.h"
#import "SDLRPCParameterNames.h"

QuickSpecBegin(SDLKeyboardCapabilitiesSpec)

__block SDLConfigurableKeyboards *testConfigurableKeyboard = nil;

describe(@"Getter/Setter Tests", ^ {
    beforeEach(^{
        
        testConfigurableKeyboard = [[SDLConfigurableKeyboards alloc] init];
    });
    
    it(@"Should set and get correctly", ^ {
        SDLKeyboardCapabilities* testStruct = [[SDLKeyboardCapabilities alloc] init];
        
        testStruct.configurableKeys = @[testConfigurableKeyboard];
        testStruct.supportedKeyboardLayouts = @[SDLKeyboardLayoutNumeric];
        testStruct.maskInputCharactersSupported = @1;

        expect(testStruct.configurableKeys).to(equal(@[testConfigurableKeyboard]));
        expect(testStruct.supportedKeyboardLayouts).to(equal(@[SDLKeyboardLayoutNumeric]));
        expect(testStruct.maskInputCharactersSupported).to(equal(@1));
    });
      
    
    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary<NSString *, id> *dict = [@{SDLRPCParameterNameSupportedKeyboardLayouts:@[SDLKeyboardLayoutNumeric],
                                                       SDLRPCParameterNameConfigurableKeys:@[testConfigurableKeyboard],
                                                       SDLRPCParameterNameMaskInputCharactersSupported:@1} mutableCopy];
        SDLKeyboardCapabilities* testStruct = [[SDLKeyboardCapabilities alloc] initWithDictionary:dict];
        
        expect(testStruct.configurableKeys).to(equal(@[testConfigurableKeyboard]));
        expect(testStruct.supportedKeyboardLayouts).to(equal(@[SDLKeyboardLayoutNumeric]));
        expect(testStruct.maskInputCharactersSupported).to(equal(@1));
    });
    
    it(@"Should get correctly when initialized", ^ {
        SDLKeyboardCapabilities* testStruct = [[SDLKeyboardCapabilities alloc] initWithMaskInputCharactersSupported:@1 supportedKeyboardLayouts:@[SDLKeyboardLayoutNumeric] configurableKeys:@[testConfigurableKeyboard]];
        
        expect(testStruct.configurableKeys).to(equal(@[testConfigurableKeyboard]));
        expect(testStruct.supportedKeyboardLayouts).to(equal(@[SDLKeyboardLayoutNumeric]));
        expect(testStruct.maskInputCharactersSupported).to(equal(@1));
    });
    
    it(@"Should return nil if not set", ^ {
        SDLKeyboardCapabilities* testStruct = [[SDLKeyboardCapabilities alloc] init];
        
        expect(testStruct.configurableKeys).to(beNil());
        expect(testStruct.supportedKeyboardLayouts).to(beNil());
        expect(testStruct.maskInputCharactersSupported).to(beNil());
    });
});

QuickSpecEnd

