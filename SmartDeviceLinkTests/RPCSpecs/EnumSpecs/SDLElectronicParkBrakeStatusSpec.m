//
//  SDLElectronicParkBrakeStatusSpec.m
//  SmartDeviceLinkTests
//

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLElectronicParkBrakeStatus.h"

QuickSpecBegin(SDLElectronicParkBrakeStatusSpec)

describe(@"Individual Enum Value Tests", ^ {
    it(@"Should match internal values", ^ {
        expect(SDLElectronicParkBrakeStateOpen).to(equal(@"OPEN"));
        expect(SDLElectronicParkBrakeClosed).to(equal(@"CLOSED"));
        expect(SDLElectronicParkBrakeStateTransition).to(equal(@"TRANSITION"));
        expect(SDLElectronicParkBrakeStateDriveActive).to(equal(@"DRIVE_ACTIVE"));
        expect(SDLElectronicParkBrakeStateFault).to(equal(@"FAULT"));
    });
});

QuickSpecEnd
