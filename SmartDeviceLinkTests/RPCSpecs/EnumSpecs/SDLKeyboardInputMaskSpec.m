//
//  SDLKeyboardInputMaskSpec.m
//  SmartDeviceLinkTests
//

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLKeyboardInputMask.h"

QuickSpecBegin(SDLKeyboardInputMaskSpec)

describe(@"Individual Enum Value Tests", ^ {
    it(@"Should match internal values", ^ {
        expect(SDLKeyboardInputMaskEnableInputKeyMask).to(equal(@"ENABLE_INPUT_KEY_MASK"));
        expect(SDLKeyboardInputMaskDisableInputKeyMask).to(equal(@"DISABLE_INPUT_KEY_MASK"));
        expect(SDLKeyboardInputMaskUserChoiceInputKeyMask).to(equal(@"USER_CHOICE_INPUT_KEY_MASK"));
    });
});

QuickSpecEnd
