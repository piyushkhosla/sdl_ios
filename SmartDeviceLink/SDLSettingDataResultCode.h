//
//  SDLSettingDataResultCode.h
//

#import "SDLEnum.h"

/**
 * Defines the setting data result types that can be published and/or subscribed to using SDLSubscribeSettingData
 */
typedef SDLEnum SDLSettingDataResultCode SDL_SWIFT_ENUM;

/**
 @abstract Individual setting data item request or subscription successful
 */
extern SDLSettingDataResultCode const SDLSettingDataResultSuccess;


/**
 @abstract The requested setting data is not a valid ID on the system.
 */
extern SDLSettingDataResultCode const SDLSettingDataResultInvalidId;


/**
 @abstract The requested setting data item is not available for current HMI type.
 */
extern SDLSettingDataResultCode const SDLSettingDataResultDataNotAvailable;


/**
 @abstract The setting data item is already subscribed.
 */
extern SDLSettingDataResultCode const SDLSettingDataResultDataAlreadySubscribed;


/**
 @abstract The setting data item cannot be unsubscribed because it is not currently subscribed.
 */
extern SDLSettingDataResultCode const SDLSettingDataResultDataNotSubscribed;


/**
 @abstract The request for this item is ignored because it is already in progress.
 */
extern SDLSettingDataResultCode const SDLSettingDataResultIgnored;
