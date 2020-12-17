//
//  SDLWindowCapabilitySpec.m
//  SmartDeviceLinkTests

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLWindowCapability.h"

#import "SDLButtonCapabilities.h"
#import "SDLDynamicUpdateCapabilities.h"
#import "SDLImageField.h"
#import "SDLImageType.h"
#import "SDLRPCParameterNames.h"
#import "SDLSoftButtonCapabilities.h"
#import "SDLTextField.h"
#import "SDLTextFieldName.h"
#import "SDLKeyboardCapabilities.h"

QuickSpecBegin(SDLWindowCapabilitySpec)

__block SDLWindowCapability *testStruct = nil;

__block SDLTextField* testTextField = nil;
__block SDLImageField *testImageField = nil;
__block SDLButtonCapabilities *testButtonCapabilities = nil;
__block SDLSoftButtonCapabilities *testSoftButtonsCapabilities = nil;
__block SDLImageType testImageType = nil;
__block NSString *testTextName = nil;
__block NSString *testImageName = nil;
__block NSString *testTemplateAvailable = nil;
__block SDLMenuLayout testMenuLayout = SDLMenuLayoutTiles;
__block SDLDynamicUpdateCapabilities *testDynamicUpdates = nil;
__block SDLKeyboardCapabilities *keyboardCapability = nil;

describe(@"Getter/Setter Tests", ^ {
    beforeEach(^{
        testImageType = SDLImageTypeDynamic;
        testTextName = @"test Text field";
        testImageName = @"test Image field";
        
        testTextField = [[SDLTextField alloc] init];
        testTextField.name = SDLTextFieldNameTertiaryText;
        testImageField = [[SDLImageField alloc] init];
        testImageField.name = testImageName;
        
        testButtonCapabilities = [[SDLButtonCapabilities alloc] init];
        testButtonCapabilities.name = SDLButtonNameOk;
        testButtonCapabilities.shortPressAvailable = @YES;
        testButtonCapabilities.longPressAvailable = @YES;
        testButtonCapabilities.upDownAvailable = @YES;
        
        testSoftButtonsCapabilities = [[SDLSoftButtonCapabilities alloc] init];
        testSoftButtonsCapabilities.imageSupported = @YES;

        testTemplateAvailable = @"myTemplate";
        testDynamicUpdates = [[SDLDynamicUpdateCapabilities alloc] initWithSupportedDynamicImageFieldNames:@[SDLImageFieldNameSubMenuIcon] supportsDynamicSubMenus:@YES];
        keyboardCapability = [[SDLKeyboardCapabilities alloc] init];
    });
    
    it(@"Should set and get correctly", ^ {
        testStruct = [[SDLWindowCapability alloc] init];
        testStruct.windowID = @444;
        testStruct.numCustomPresetsAvailable = @10;
        testStruct.textFields = @[testTextField];
        testStruct.imageFields = @[testImageField];
        testStruct.imageTypeSupported = @[testImageType];
        testStruct.buttonCapabilities = @[testButtonCapabilities];
        testStruct.softButtonCapabilities = @[testSoftButtonsCapabilities];
        testStruct.menuLayoutsAvailable = @[testMenuLayout];
        testStruct.templatesAvailable = @[testTemplateAvailable];
        testStruct.dynamicUpdateCapabilities = testDynamicUpdates;
        testStruct.keyboardCapabilities = keyboardCapability;

        
        expect(testStruct.windowID).to(equal(@444));
        expect(testStruct.textFields).to(equal(@[testTextField]));
        expect(testStruct.imageFields).to(equal(@[testImageField]));
        expect(testStruct.imageTypeSupported).to(equal(@[testImageType]));
        expect(testStruct.numCustomPresetsAvailable).to(equal(@10));
        expect(testStruct.buttonCapabilities).to(equal(@[testButtonCapabilities]));
        expect(testStruct.softButtonCapabilities).to(equal(@[testSoftButtonsCapabilities]));
        expect(testStruct.menuLayoutsAvailable).to(equal(@[testMenuLayout]));
        expect(testStruct.templatesAvailable).to(equal(@[testTemplateAvailable]));
        expect(testStruct.dynamicUpdateCapabilities).to(equal(testDynamicUpdates));
        expect(testStruct.keyboardCapabilities).to(equal(keyboardCapability));

    });

    it(@"Should set and get correctly", ^ {
        testStruct = [[SDLWindowCapability alloc] initWithWindowID:@444 textFields:@[testTextField] imageFields:@[testImageField] imageTypeSupported:@[testImageType] templatesAvailable:@[testTemplateAvailable] numCustomPresetsAvailable:@10 buttonCapabilities:@[testButtonCapabilities] softButtonCapabilities:@[testSoftButtonsCapabilities] menuLayoutsAvailable:@[testMenuLayout] dynamicUpdateCapabilities:testDynamicUpdates];

        expect(testStruct.windowID).to(equal(@444));
        expect(testStruct.textFields).to(equal(@[testTextField]));
        expect(testStruct.imageFields).to(equal(@[testImageField]));
        expect(testStruct.imageTypeSupported).to(equal(@[testImageType]));
        expect(testStruct.numCustomPresetsAvailable).to(equal(@10));
        expect(testStruct.buttonCapabilities).to(equal(@[testButtonCapabilities]));
        expect(testStruct.softButtonCapabilities).to(equal(@[testSoftButtonsCapabilities]));
        expect(testStruct.menuLayoutsAvailable).to(equal(@[testMenuLayout]));
        expect(testStruct.templatesAvailable).to(equal(@[testTemplateAvailable]));
        expect(testStruct.dynamicUpdateCapabilities).to(equal(testDynamicUpdates));
        expect(testStruct.keyboardCapabilities).to(beNil());

    });
    
    it(@"Should set and get correctly", ^ {
        testStruct = [[SDLWindowCapability alloc] initWithWindowID:@444 textFields:@[testTextField] imageFields:@[testImageField] imageTypeSupported:@[testImageType] templatesAvailable:@[testTemplateAvailable] numCustomPresetsAvailable:@10 buttonCapabilities:@[testButtonCapabilities] softButtonCapabilities:@[testSoftButtonsCapabilities] menuLayoutsAvailable:@[testMenuLayout] dynamicUpdateCapabilities:testDynamicUpdates keyboardCapabilities:keyboardCapability];

        expect(testStruct.windowID).to(equal(@444));
        expect(testStruct.textFields).to(equal(@[testTextField]));
        expect(testStruct.imageFields).to(equal(@[testImageField]));
        expect(testStruct.imageTypeSupported).to(equal(@[testImageType]));
        expect(testStruct.numCustomPresetsAvailable).to(equal(@10));
        expect(testStruct.buttonCapabilities).to(equal(@[testButtonCapabilities]));
        expect(testStruct.softButtonCapabilities).to(equal(@[testSoftButtonsCapabilities]));
        expect(testStruct.menuLayoutsAvailable).to(equal(@[testMenuLayout]));
        expect(testStruct.templatesAvailable).to(equal(@[testTemplateAvailable]));
        expect(testStruct.dynamicUpdateCapabilities).to(equal(testDynamicUpdates));
        expect(testStruct.keyboardCapabilities).to(equal(keyboardCapability));

    });
    
    it(@"Should return nil if not set", ^ {
        SDLWindowCapability* testStruct = [[SDLWindowCapability alloc] init];
        
        expect(testStruct.windowID).to(beNil());
        expect(testStruct.textFields).to(beNil());
        expect(testStruct.imageFields).to(beNil());
        expect(testStruct.imageTypeSupported).to(beNil());
        expect(testStruct.numCustomPresetsAvailable).to(beNil());
        expect(testStruct.buttonCapabilities).to(beNil());
        expect(testStruct.softButtonCapabilities).to(beNil());
        expect(testStruct.menuLayoutsAvailable).to(beNil());
        expect(testStruct.templatesAvailable).to(beNil());
        expect(testStruct.dynamicUpdateCapabilities).to(beNil());
        expect(testStruct.keyboardCapabilities).to(beNil());

    });
});

QuickSpecEnd
