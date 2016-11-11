//
//  SDLSettingDataResult.h
//  SmartDeviceLink-iOS
//

#import "SDLRPCMessage.h"

@class SDLSettingDataType;
@class SDLSettingDataResultCode;

@interface SDLSettingDataResult : SDLRPCStruct {

}
/**
 * @abstract Defined published data element type.
 */
@property(strong)SDLSettingDataType *dataType;

/**
 * @abstract Published data result code.
 */
@property(strong)SDLSettingDataResultCode *resultCode;

@end
