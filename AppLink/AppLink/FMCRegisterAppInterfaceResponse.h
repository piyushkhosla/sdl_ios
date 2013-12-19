//  FMCRegisterAppInterfaceResponse.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

#import <AppLink/FMCDisplayCapabilities.h>
#import <AppLink/FMCLanguage.h>
#import <AppLink/FMCPresetBankCapabilities.h>
#import <AppLink/FMCSyncMsgVersion.h>
#import <AppLink/FMCVehicleType.h>

/**
 * @abstract Register AppInterface Response is sent, when FMCRegisterAppInterface has been called
 *
 * Since AppLink 1.0
 */
@interface FMCRegisterAppInterfaceResponse : FMCRPCResponse {}

/**
 * @abstract Constructs a new FMCRegisterAppInterfaceResponse object
 */
-(id) init;
/**
 * Constructs a new FMCRegisterAppInterfaceResponse object indicated by the NSMutableDictionary
 * parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract The version of the SYNC&reg; AppLink interface
 * @discussion a SyncMsgVersion object representing version of the SYNC&reg;
 *            AppLink interface
 *            <p>
 *            <b>Notes: </b>To be compatible, app msg major version number
 *            must be less than or equal to SYNC&reg; major version number.
 *            If msg versions are incompatible, app has 20 seconds to
 *            attempt successful RegisterAppInterface (w.r.t. msg version)
 *            on underlying protocol session, else will be terminated. Major
 *            version number is a compatibility declaration. Minor version
 *            number indicates minor functional variations (e.g. features,
 *            capabilities, bug fixes) when sent from SYNC&reg; to app (in
 *            RegisterAppInterface response). However, the minor version
 *            number sent from the app to SYNC&reg; (in RegisterAppInterface
 *            request) is ignored by SYNC&reg;
 */
@property(assign) FMCSyncMsgVersion* syncMsgVersion;
/**
 * @abstract Sets an enumeration indicating what language the application intends to
 * use for user interaction (Display, TTS and VR)
 */
@property(assign) FMCLanguage* language;
/**
 * @abstract An enumeration indicating what language the application intends to
 * use for user interaction ( Display)
 * @since AppLink 2.0
 */
@property(assign) FMCLanguage* hmiDisplayLanguage;
/**
 * @abstract Display Capabilities
 */
@property(assign) FMCDisplayCapabilities* displayCapabilities;
/**
 * @abstract Button Capabilities
 */
@property(assign) NSMutableArray* buttonCapabilities;
/**
 * @abstract SoftButton Capabilities
 */
@property(assign) NSMutableArray* softButtonCapabilities;
/**
 * @abstract Preset BankCapabilities
 */
@property(assign) FMCPresetBankCapabilities* presetBankCapabilities;
/**
 * @abstract Gets/Sets hmiZoneCapabilities when application interface is registered.
 */
@property(assign) NSMutableArray* hmiZoneCapabilities;
/**
 * @abstract Gets/Sets speechCapabilities when application interface is registered.
 */
@property(assign) NSMutableArray* speechCapabilities;
/**
 * @abstract Gets/Sets vrCapabilities when application interface is registered.
 */
@property(assign) NSMutableArray* vrCapabilities;
/**
 * @abstract Gets/Sets AudioPassThruCapabilities when application interface is registered.
 */
@property(assign) NSMutableArray* audioPassThruCapabilities;
/**
 * @abstract Gets/Sets VehicleType when application interface is registered.
 */
@property(assign) FMCVehicleType* vehicleType;


@end
