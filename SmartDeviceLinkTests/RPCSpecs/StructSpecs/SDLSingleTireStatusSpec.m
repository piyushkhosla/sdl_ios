//
//  SDLSingleTireStatusSpec.m
//  SmartDeviceLink


#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLSingleTireStatus.h"
#import "SDLComponentVolumeStatus.h"
#import "SDLNames.h"
#import "SDLTPMS.h"

QuickSpecBegin(SDLSingleTireStatusSpec)

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLSingleTireStatus* testStruct = [[SDLSingleTireStatus alloc] init];
        
        testStruct.status = SDLComponentVolumeStatusNormal;
        testStruct.tpms = SDLTPMSLow;
        testStruct.pressure = @32.1;

        expect(testStruct.status).to(equal(SDLComponentVolumeStatusNormal));
        expect(testStruct.tpms).to(equal(SDLTPMSLow));
        expect(testStruct.pressure).to(equal(@32.1));

    });
    
    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary* dict = [@{SDLNameStatus:SDLComponentVolumeStatusLow,
                                       SDLNameTpms:SDLTPMSUnknown,
                                       SDLNamePressure:@32.1
                                       } mutableCopy];
        SDLSingleTireStatus* testStruct = [[SDLSingleTireStatus alloc] initWithDictionary:dict];
        
        expect(testStruct.status).to(equal(SDLComponentVolumeStatusLow));
        expect(testStruct.tpms).to(equal(SDLTPMSUnknown));
        expect(testStruct.pressure).to(equal(@32.1));
    });
    
    it(@"Should return nil if not set", ^ {
        SDLSingleTireStatus* testStruct = [[SDLSingleTireStatus alloc] init];
        
        expect(testStruct.status).to(beNil());
        expect(testStruct.tpms).to(beNil());
        expect(testStruct.pressure).to(beNil());
    });
});

QuickSpecEnd
