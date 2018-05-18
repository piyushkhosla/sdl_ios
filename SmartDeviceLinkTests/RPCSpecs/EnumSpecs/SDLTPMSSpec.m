//
//  SDLTouchTypeSpec.m
//  SmartDeviceLink


#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLTPMS.h"

QuickSpecBegin(SDLTPMSSpec)

describe(@"Individual Enum Value Tests", ^ {
    it(@"Should match internal values", ^ {
        expect(SDLTPMSUnknown).to(equal(@"UNKNOWN"));
        expect(SDLTPMSSystemFault).to(equal(@"SYSTEM_FAULT"));
        expect(SDLTPMSSensorFault).to(equal(@"SENSOR_FAULT"));
        expect(SDLTPMSLow).to(equal(@"LOW"));
        expect(SDLTPMSSystemActive).to(equal(@"SYSTEM_ACTIVE"));
        expect(SDLTPMSTrain).to(equal(@"TRAIN"));
        expect(SDLTPMSTrainingComplete).to(equal(@"TRAINING_COMPLETE"));
        expect(SDLTPMSNotTrained).to(equal(@"NOT_TRAINED"));
    });
});

QuickSpecEnd

