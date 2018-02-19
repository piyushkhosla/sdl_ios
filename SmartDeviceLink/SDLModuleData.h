//
//  SDLModuleData.h
//

#import "SDLRPCMessage.h"
#import "SDLModuleType.h"

@class SDLRadioControlData;
@class SDLClimateControlData;
@class SDLSeatControlData;
@class SDLAudioControlData;
@class SDLHMISettingsControlData;
@class SDLLightControlData;


NS_ASSUME_NONNULL_BEGIN

@interface SDLModuleData : SDLRPCStruct

- (instancetype)initWithRadioControlData:(SDLRadioControlData *)radioControlData;
- (instancetype)initWithClimateControlData:(SDLClimateControlData *)climateControlData;
- (instancetype)initWithseatControlData:(SDLSeatControlData *)seatControlData;
- (instancetype)initWithAudioControlData:(SDLAudioControlData *)audioControlData;
- (instancetype)initWithLightControlData:(SDLLightControlData *)lightControlData;
- (instancetype)initWithHMISettingsControlData:(SDLHMISettingsControlData *)hmiSettingsControlData;

/**
 * The moduleType indicates which type of data should be changed
 * and identifies which data object exists in this struct.
 * For example, if the moduleType is CLIMATE then a "climateControlData" should exist
 */
@property (strong, nonatomic) SDLModuleType moduleType;

@property (nullable, strong, nonatomic) SDLRadioControlData *radioControlData;

@property (nullable, strong, nonatomic) SDLClimateControlData *climateControlData;

@property (nullable, strong, nonatomic) SDLSeatControlData *seatControlData;

@property (nullable, strong, nonatomic) SDLAudioControlData *audioControlData;

@property (nullable, strong, nonatomic) SDLLightControlData *lightControlData;

@property (nullable, strong, nonatomic) SDLHMISettingsControlData *hmiSettingsControlData;

@end

NS_ASSUME_NONNULL_END
