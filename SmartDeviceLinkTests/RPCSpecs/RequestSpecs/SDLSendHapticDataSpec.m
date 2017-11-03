//
//  SDLSendHapticDataSpec.m
//  SmartDeviceLink-iOS
//
<<<<<<< HEAD
//  Created by Nicole on 8/2/17.
=======
//  Created by Nicole on 8/4/17.
>>>>>>> release/5.0.0
//  Copyright © 2017 smartdevicelink. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLNames.h"
<<<<<<< HEAD
#import "SDLSendHapticData.h"
#import "SDLHapticRect.h"
=======
#import "SDLHapticRect.h"
#import "SDLRectangle.h"
#import "SDLSendHapticData.h"
>>>>>>> release/5.0.0

QuickSpecBegin(SDLSendHapticDataSpec)

describe(@"Initialization Tests", ^ {
    __block SDLHapticRect *testStruct = nil;

    beforeEach(^{
<<<<<<< HEAD
        NSMutableDictionary *dict = [@{NAMES_id:@2,
                                       NAMES_hapticRectData: @{
                                               NAMES_x:@20,
                                               NAMES_y:@200,
                                               NAMES_width:@2000,
                                               NAMES_height:@3000
                                               }} mutableCopy];
         testStruct = [[SDLHapticRect alloc] initWithDictionary:dict];
=======
        testStruct = [[SDLHapticRect alloc] initWithId:123 rect:[[SDLRectangle alloc] initWithX:23.1 y:45.6 width:69.0 height:69]];
>>>>>>> release/5.0.0
    });

    context(@"Getter/Setter Tests", ^ {
        it(@"Should set and get correctly", ^ {
            SDLSendHapticData *testRequest = [[SDLSendHapticData alloc] init];
            testRequest.hapticRectData = [@[testStruct] mutableCopy];

            expect(testRequest.hapticRectData).to(equal(@[testStruct]));
        });
    });

    context(@"Init tests", ^{
        it(@"Should get correctly when initialized with a dictionary", ^ {
<<<<<<< HEAD
            NSMutableDictionary* dict = [@{NAMES_request:
                                               @{NAMES_parameters:
                                                     @{NAMES_hapticRectData:@[testStruct]},
                                                 NAMES_operation_name:NAMES_SendHapticData}} mutableCopy];
=======
            NSMutableDictionary* dict = [@{SDLNameRequest:
                                               @{SDLNameParameters:
                                                     @{SDLNameHapticRectData:@[testStruct]},
                                                 SDLNameOperationName:SDLNameSendHapticData}} mutableCopy];
>>>>>>> release/5.0.0
            SDLSendHapticData *testRequest = [[SDLSendHapticData alloc] initWithDictionary:dict];

            expect(testRequest.hapticRectData).to(equal(@[testStruct]));
        });

        it(@"Should initialize correctly with initWithType:", ^{
<<<<<<< HEAD
            SDLSendHapticData *testRequest = [[SDLSendHapticData alloc] initWithHapticRectData:[NSMutableArray arrayWithArray:@[testStruct]]];
=======
            SDLSendHapticData *testRequest = [[SDLSendHapticData alloc] initWithHapticRectData:@[testStruct]];
>>>>>>> release/5.0.0

            expect(testRequest.hapticRectData).to(equal(@[testStruct]));
        });

        it(@"Should return nil if not set", ^ {
            SDLSendHapticData *testRequest = [[SDLSendHapticData alloc] init];
<<<<<<< HEAD
            
=======

>>>>>>> release/5.0.0
            expect(testRequest.hapticRectData).to(beNil());
        });
    });
});

<<<<<<< HEAD


=======
>>>>>>> release/5.0.0
QuickSpecEnd
