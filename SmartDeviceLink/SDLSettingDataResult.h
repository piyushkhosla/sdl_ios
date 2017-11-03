//
//  SDLSettingDataResult.h
//  SmartDeviceLink-iOS
//

#import "SDLRPCMessage.h"
#import "SDLSettingDataType.h"
#import "SDLSettingDataResultCode.h"

@interface SDLSettingDataResult : SDLRPCStruct {

}
/**
 * @abstract Defined published data element type.
 */
@property(nullable, strong, nonatomic) SDLSettingDataType dataType;

/**
 * @abstract Published data result code.
 */
@property(nullable, strong, nonatomic) SDLSettingDataResultCode resultCode;

@end
