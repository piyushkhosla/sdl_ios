#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLAppHMIType.h"
#import "SDLLanguage.h"
#import "SDLLifecycleConfiguration.h"
#import "SDLSpeechCapabilities.h"
#import "SDLTTSChunk.h"

QuickSpecBegin(SDLLifecycleConfigurationSpec)

describe(@"a lifecycle configuration", ^{
    __block SDLLifecycleConfiguration *testConfig = nil;
    
    context(@"that is created with default settings", ^{
        __block NSString *someAppName = nil;
        __block NSString *someAppId = nil;
        
        beforeEach(^{
            someAppName = @"An App Name";
            someAppId = @"00542596432764329684352896423679";
            
            testConfig = [SDLLifecycleConfiguration defaultConfigurationWithAppName:someAppName appId:someAppId];
        });
        
        it(@"should have properly set properties", ^{
            expect(testConfig.appName).to(match(someAppName));
            expect(testConfig.appId).to(match(someAppId));
            expect(@(testConfig.tcpDebugMode)).to(beFalsy());
            expect(testConfig.tcpDebugIPAddress).to(match(@"192.168.0.1"));
            expect(@(testConfig.tcpDebugPort)).to(equal(@12345));
            expect(@([testConfig.appType isEqualToEnum:SDLAppHMITypeDefault])).to(equal(@YES));
            expect(@(testConfig.isMedia)).to(beFalsy());
            expect(@([testConfig.language isEqualToEnum:SDLLanguageEnUs])).to(equal(@YES));
            expect(@([[testConfig.languagesSupported firstObject] isEqualToEnum:SDLLanguageEnUs])).to(equal(@YES));
            expect(testConfig.shortAppName).to(beNil());
            expect(testConfig.ttsName).to(beNil());
            expect(testConfig.voiceRecognitionCommandNames).to(beNil());
            expect(testConfig.resumeHash).to(beNil());
        });
        
        describe(@"after setting properties manually", ^{
            __block NSString *someShortAppName = nil;
            __block SDLTTSChunk *someTTSChunk = nil;
            __block NSArray<SDLTTSChunk *> *someTTSName = nil;
            __block NSArray<NSString *> *someSynonyms = nil;
            __block NSString *someResumeHashString = nil;
            
            beforeEach(^{
                someTTSChunk = [[SDLTTSChunk alloc] init];
                someTTSChunk.text = @"some tts name";
                someTTSChunk.type = SDLSpeechCapabilitiesText;
                
                someTTSName = @[someTTSChunk];
                someShortAppName = @"Short Name";
                someSynonyms = @[@"Test 1", @"Test 2", @"Test 3", @"Test 4"];
                someResumeHashString = @"testing";
                
                testConfig.appType = SDLAppHMITypeMedia;
                testConfig.language = SDLLanguageArSa;
                testConfig.languagesSupported = @[SDLLanguageArSa, SDLLanguageEnAu, SDLLanguageEnUs];
                testConfig.shortAppName = someShortAppName;
                testConfig.ttsName = someTTSName;
                testConfig.voiceRecognitionCommandNames = someSynonyms;
                testConfig.resumeHash = someResumeHashString;
            });
            
            it(@"should have properly set properties", ^{
                expect(testConfig.appName).to(match(someAppName));
                expect(testConfig.appId).to(match(someAppId));
                expect(@(testConfig.tcpDebugMode)).to(beFalsy());
                expect(testConfig.tcpDebugIPAddress).to(match(@"192.168.0.1"));
                expect(@(testConfig.tcpDebugPort)).to(equal(@12345));
                expect(@([testConfig.appType isEqualToEnum:SDLAppHMITypeMedia])).to(equal(@YES));
                expect(@(testConfig.isMedia)).to(beTruthy());
                expect(@([testConfig.language isEqualToEnum:SDLLanguageArSa])).to(equal(@YES));
                expect(testConfig.languagesSupported).to(haveCount(@3));
                expect(testConfig.shortAppName).to(match(someShortAppName));
                expect(testConfig.ttsName).to(contain(someTTSChunk));
                expect(testConfig.ttsName).to(haveCount(@1));
                expect(testConfig.voiceRecognitionCommandNames).to(haveCount(@(someSynonyms.count)));
                expect(testConfig.resumeHash).to(match(someResumeHashString));
            });
        });
    });
    
    context(@"that is created with debug settings", ^{
        __block NSString *someAppName = nil;
        __block NSString *someAppId = nil;
        __block NSString *someIPAddress = nil;
        __block UInt16 somePort = 0;
        
        beforeEach(^{
            someAppName = @"An App Name";
            someAppId = @"00542596432764329684352896423679";
            someIPAddress = @"1.1.1.1";
            somePort = 42;
            
            testConfig = [SDLLifecycleConfiguration debugConfigurationWithAppName:someAppName appId:someAppId ipAddress:someIPAddress port:somePort];
        });
        
        it(@"should have properly set properties", ^{
            expect(testConfig.appName).to(match(someAppName));
            expect(testConfig.appId).to(match(someAppId));
            expect(@(testConfig.tcpDebugMode)).to(beTruthy());
            expect(testConfig.tcpDebugIPAddress).to(match(someIPAddress));
            expect(@(testConfig.tcpDebugPort)).to(equal(@(somePort)));
            expect(@([testConfig.appType isEqualToEnum:SDLAppHMITypeDefault])).to(equal(@YES));
            expect(@([testConfig.language isEqualToEnum:SDLLanguageEnUs])).to(equal(@YES));
            expect(@([[testConfig.languagesSupported firstObject] isEqualToEnum:SDLLanguageEnUs])).to(equal(@YES));
            expect(testConfig.shortAppName).to(beNil());
            expect(testConfig.ttsName).to(beNil());
            expect(testConfig.voiceRecognitionCommandNames).to(beNil());
            expect(testConfig.resumeHash).to(beNil());
        });
        
        describe(@"after setting properties manually", ^{
            __block NSString *someShortAppName = nil;
            __block SDLTTSChunk *someTTSChunk = nil;
            __block NSArray<SDLTTSChunk *> *someTTSName = nil;
            __block NSArray<NSString *> *someSynonyms = nil;
            __block NSString *someResumeHashString = nil;
            
            beforeEach(^{
                someTTSChunk = [[SDLTTSChunk alloc] init];
                someTTSChunk.text = @"some tts name";
                someTTSChunk.type = SDLSpeechCapabilitiesText;
                
                someShortAppName = @"Short Name 2";
                someTTSName = @[someTTSChunk];
                someSynonyms = @[@"Test 1", @"Test 2"];
                
                testConfig.appType = SDLAppHMITypeMedia;
                testConfig.language = SDLLanguageArSa;
                testConfig.languagesSupported = @[SDLLanguageArSa, SDLLanguageEnAu, SDLLanguageEnUs];
                testConfig.shortAppName = someShortAppName;
                testConfig.ttsName = someTTSName;
                testConfig.voiceRecognitionCommandNames = someSynonyms;
                testConfig.resumeHash = someResumeHashString;
            });
            
            it(@"should have properly set properties", ^{
                expect(testConfig.appName).to(match(someAppName));
                expect(testConfig.appId).to(match(someAppId));
                expect(@(testConfig.tcpDebugMode)).to(beTruthy());
                expect(testConfig.tcpDebugIPAddress).to(match(someIPAddress));
                expect(@(testConfig.tcpDebugPort)).to(equal(@(somePort)));
                expect(@([testConfig.appType isEqualToEnum:SDLAppHMITypeMedia])).to(equal(@YES));
                expect(@(testConfig.isMedia)).to(beTruthy());
                expect(@([testConfig.language isEqualToEnum:SDLLanguageArSa])).to(equal(@YES));
                expect(testConfig.languagesSupported).to(haveCount(@3));
                expect(testConfig.shortAppName).to(match(someShortAppName));
                expect(testConfig.ttsName).to(contain(someTTSChunk));
                expect(testConfig.ttsName).to(haveCount(@1));
                expect(testConfig.voiceRecognitionCommandNames).to(haveCount(@(someSynonyms.count)));
            });
        });
    });
});

QuickSpecEnd
