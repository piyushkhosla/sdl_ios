//
//  SDLWindowCapabilitySpec.m
//  SmartDeviceLinkTests
//

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLRPCParameterNames.h"
#import "SDLWindowCapability.h"
#import "SDLTextField.h"
#import "SDLImageField.h"
#import "SDLImageType.h"
#import "SDLButtonCapabilities.h"
#import "SDLSoftButtonCapabilities.h"

QuickSpecBegin(SDLWindowCapabilitySpec)

SDLTextField *textField = [[SDLTextField alloc] init];
SDLImageField *imageField = [[SDLImageField alloc] init];
SDLButtonCapabilities *btnCapabilities = [[SDLButtonCapabilities alloc] init];
SDLSoftButtonCapabilities *softBtnCapabilities = [[SDLSoftButtonCapabilities alloc ] init];

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLWindowCapability* testStruct = [[SDLWindowCapability alloc] init];
        
        testStruct.windowID = @(12);
        testStruct.textFields = @[textField];
        testStruct.imageFields = @[imageField];
        testStruct.imageTypeSupported = @[SDLImageTypeStatic];
        testStruct.templatesAvailable = @[@"temp1"];
        testStruct.numCustomPresetsAvailable = @[@(1)];
        testStruct.buttonCapabilities = @[btnCapabilities];
        testStruct.softButtonCapabilities = @[softBtnCapabilities];
   
        expect(testStruct.windowID).to(equal(@(12)));
        expect(testStruct.textFields).to(equal(@[textField]));
        expect(testStruct.imageFields).to(equal(@[imageField]));
        expect(testStruct.imageTypeSupported).to(equal(@[SDLImageTypeStatic]));
        expect(testStruct.templatesAvailable).to(equal(@[@"temp1"]));
        expect(testStruct.numCustomPresetsAvailable).to(equal(@[@(1)]));
        expect(testStruct.buttonCapabilities).to(equal(@[btnCapabilities]));
        expect(testStruct.softButtonCapabilities).to(equal(@[softBtnCapabilities]));
    });
    
    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary* dict = [@{SDLRPCParameterNameWindowID:(@(12)),
                                       SDLRPCParameterNameTextFields:@[textField],
                                       SDLRPCParameterNameImageFields:@[imageField],
                                       SDLRPCParameterNameImageTypeSupported:@[SDLImageTypeStatic],
                                       SDLRPCParameterNameTemplatesAvailable:@[@"temp1"],
                                           SDLRPCParameterNameNumCustomPresetsAvailable:@[@(1)],
                                           SDLRPCParameterNameButtonCapabilities:@[btnCapabilities],
                                           SDLRPCParameterNameSoftButtonCapabilities:@[softBtnCapabilities],
                                       } mutableCopy];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        SDLWindowCapability* testStruct = [[SDLWindowCapability alloc] initWithDictionary:dict];
#pragma clang diagnostic pop
        
        expect(testStruct.windowID).to(equal(@(12)));
        expect(testStruct.textFields).to(equal(@[textField]));
        expect(testStruct.imageFields).to(equal(@[imageField]));
        expect(testStruct.imageTypeSupported).to(equal(@[SDLImageTypeStatic]));
        expect(testStruct.templatesAvailable).to(equal(@[@"temp1"]));
        expect(testStruct.numCustomPresetsAvailable).to(equal(@[@(1)]));
        expect(testStruct.buttonCapabilities).to(equal(@[btnCapabilities]));
        expect(testStruct.softButtonCapabilities).to(equal(@[softBtnCapabilities]));
    });
    
    it(@"Should get correctly when initialized", ^ {
        SDLWindowCapability* testStruct = [[SDLWindowCapability alloc] initWithID:12 textFields:@[textField] imageFields:@[imageField] imageTypeSupported:@[SDLImageTypeStatic] templatesAvailable:@[@"temp1"] numCustomPresetsAvailable:@[@(1)] buttonCapabilities:@[btnCapabilities] softButtonCapabilities:@[softBtnCapabilities]];
        
        expect(testStruct.windowID).to(equal(@(12)));
        expect(testStruct.textFields).to(equal(@[textField]));
        expect(testStruct.imageFields).to(equal(@[imageField]));
        expect(testStruct.imageTypeSupported).to(equal(@[SDLImageTypeStatic]));
        expect(testStruct.templatesAvailable).to(equal(@[@"temp1"]));
        expect(testStruct.numCustomPresetsAvailable).to(equal(@[@(1)]));
        expect(testStruct.buttonCapabilities).to(equal(@[btnCapabilities]));
        expect(testStruct.softButtonCapabilities).to(equal(@[softBtnCapabilities]));
        
    });
    
    it(@"Should return nil if not set", ^ {
        SDLWindowCapability* testStruct = [[SDLWindowCapability alloc] init];
        
        expect(testStruct.windowID).to(beNil());
        expect(testStruct.textFields).to(beNil());
        expect(testStruct.imageFields).to(beNil());
        expect(testStruct.imageTypeSupported).to(beNil());
        expect(testStruct.templatesAvailable).to(beNil());
        expect(testStruct.numCustomPresetsAvailable).to(beNil());
        expect(testStruct.buttonCapabilities).to(beNil());
        expect(testStruct.softButtonCapabilities).to(beNil());

    });
});

QuickSpecEnd
