//
//  SDLTemplateConfigurationSpec.m
//  SmartDeviceLink


#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLTemplateConfiguration.h"
#import "SDLRPCParameterNames.h"
#import "SDLTemplateColorScheme.h"


QuickSpecBegin(SDLTemplateConfigurationSpec)

SDLTemplateColorScheme *dayColorScheme = [[SDLTemplateColorScheme alloc] init];
SDLTemplateColorScheme *nightColorScheme = [[SDLTemplateColorScheme alloc] init];

describe(@"Getter/Setter Tests", ^ {
    it(@"Should set and get correctly", ^ {
        SDLTemplateConfiguration* testStruct = [[SDLTemplateConfiguration alloc] init];
        
        testStruct.templateString = @"tempString";
        testStruct.dayColorScheme = dayColorScheme;
        testStruct.nightColorScheme = nightColorScheme;

        expect(testStruct.templateString).to(equal(@"tempString"));
        expect(testStruct.dayColorScheme).to(equal(dayColorScheme));
        expect(testStruct.nightColorScheme).to(equal(nightColorScheme));
    });
    
    it(@"Should get correctly when initialized", ^ {
        NSMutableDictionary* dict = [@{SDLRPCParameterNameTemplate:@"tempString",
                                       SDLRPCParameterNameDayColorScheme:dayColorScheme,
                                       SDLRPCParameterNameNightColorScheme:nightColorScheme} mutableCopy];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        SDLTemplateConfiguration* testStruct = [[SDLTemplateConfiguration alloc] initWithDictionary:dict];
#pragma clang diagnostic pop
        
        expect(testStruct.templateString).to(equal(@"tempString"));
        expect(testStruct.dayColorScheme).to(equal(dayColorScheme));
        expect(testStruct.nightColorScheme).to(equal(nightColorScheme));
    });
    
    it(@"Should get correctly when initialized with initWithTemplate", ^ {
        
        SDLTemplateConfiguration* testStruct = [[SDLTemplateConfiguration alloc] initWithTemplate:@"tempString"];
        
        expect(testStruct.templateString).to(equal(@"tempString"));
        expect(testStruct.dayColorScheme).to(beNil());
        expect(testStruct.nightColorScheme).to(beNil());
    });
    
    it(@"Should get correctly when initialized with initWithTemplate:dayColorScheme:nightColorScheme", ^ {

        SDLTemplateConfiguration* testStruct = [[SDLTemplateConfiguration alloc] initWithTemplate:@"tempString" dayColorScheme:dayColorScheme nightColorScheme:nightColorScheme];

        expect(testStruct.templateString).to(equal(@"tempString"));
        expect(testStruct.dayColorScheme).to(equal(dayColorScheme));
        expect(testStruct.nightColorScheme).to(equal(nightColorScheme));
    });
    
    it(@"Should return nil if not set", ^ {
        SDLTemplateConfiguration* testStruct = [[SDLTemplateConfiguration alloc] init];
        
        expect(testStruct.templateString).to(beNil());
        expect(testStruct.dayColorScheme).to(beNil());
        expect(testStruct.nightColorScheme).to(beNil());
    });
});

QuickSpecEnd
