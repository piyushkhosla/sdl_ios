//  FMCChangeRegistration.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/FMCLanguage.h>

/**
 * If the app recognizes during the app registration that the Sync HMI language
 * (voice/TTS and/or display) does not match the app language, the app will be
 * able (but does not need) to change this registration with changeRegistration
 * prior to app being brought into focus
 * <p>
 * Function Group: Base
 * <p>
 * <b>HMILevel can by any</b>
 * <p>
 *
 * Since <b>AppLink 2.0</b><br>
 * see FMCRegisterAppInterface
 */
@interface FMCChangeRegistration : FMCRPCRequest {}

/**
 * Constructs a new FMCChangeRegistration object
 */
-(id) init;
/**
 * Constructs a new FMCChangeRegistration object indicated by the NSMutableDictionary
 * parameter
 * <p>
 *
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract the language app want to change to 
 * @discussion
 */
@property(strong) FMCLanguage* language;
/**
 * @abstract  HMI display language
 * @discussion
 */
@property(strong) FMCLanguage* hmiDisplayLanguage;

@end
