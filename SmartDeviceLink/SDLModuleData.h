//
//  SDLModuleData.h
//

#import "SDLRPCMessage.h"
#import "SDLModuleType.h"

@class SDLRadioControlData;
@class SDLObsshControlData;
@class SDLClimateControlData;
@class SDLSeatControlData;
@class SDLAudioControlData;
@class SDLHMISettingsControlData;
@class SDLLightControlData;


NS_ASSUME_NONNULL_BEGIN

/**
 Describes a remote control module's data
 */
@interface SDLModuleData : SDLRPCStruct

/**
 Constructs a newly allocated SDLModuleData object with radio control data

 @param radioControlData The radio control data
 @return An instance of the SDLModuleData class
 */
- (instancetype)initWithRadioControlData:(SDLRadioControlData *)radioControlData;

/**
 Constructs a newly allocated SDLModuleData object with climate control data

 @param climateControlData The climate control data
 @return An instance of the SDLModuleData class
 */
- (instancetype)initWithClimateControlData:(SDLClimateControlData *)climateControlData;

/**
 Constructs a newly allocated SDLModuleData object with audio control data
 
 @param audioControlData The audio control data
 @return An instance of the SDLModuleData class
 */
- (instancetype)initWithAudioControlData:(SDLAudioControlData *)audioControlData;

/**
 Constructs a newly allocated SDLModuleData object with light control data
 
 @param lightControlData The light control data
 @return An instance of the SDLModuleData class
 */
- (instancetype)initWithLightControlData:(SDLLightControlData *)lightControlData;

/**
 Constructs a newly allocated SDLModuleData object with hmi settings data
 
 @param hmiSettingsControlData The hmi settings data
 @return An instance of the SDLModuleData class
 */
- (instancetype)initWithHMISettingsControlData:(SDLHMISettingsControlData *)hmiSettingsControlData;

/**
 Constructs a newly allocated SDLModuleData object with seat control data

 @param seatControlData The seat control data
 @return An instance of the SDLModuleData class
 */
- (instancetype)initWithSeatControlData:(SDLSeatControlData *)seatControlData;

/**
 Constructs a newly allocated SDLModuleData object with tlc control data

 @param obsshControlData The On Board Scale control data
 @return An instance of the SDLModuleData class
 */
- (instancetype)initWithObsshControlData:(nullable SDLObsshControlData *)obsshControlData;

/**
 The moduleType indicates which type of data should be changed and identifies which data object exists in this struct.

 For example, if the moduleType is CLIMATE then a "climateControlData" should exist

 Required
 */
@property (strong, nonatomic) SDLModuleType moduleType;

/**
 Id of a module, published by System Capability.
 
 Optional
 */
@property (nullable, strong, nonatomic) NSString *moduleId;

/**
 The radio control data

 Optional
 */
@property (nullable, strong, nonatomic) SDLRadioControlData *radioControlData;

/**
 The climate control data

 Optional
 */
@property (nullable, strong, nonatomic) SDLClimateControlData *climateControlData;

/**
 The seat control data

 Optional
 */
@property (nullable, strong, nonatomic) SDLSeatControlData *seatControlData;

/**
 The audio control data
 
 Optional
 */
@property (nullable, strong, nonatomic) SDLAudioControlData *audioControlData;

/**
 The light control data
 
 Optional
 */
@property (nullable, strong, nonatomic) SDLLightControlData *lightControlData;

/**
 The hmi control data
 
 Optional
 */
@property (nullable, strong, nonatomic) SDLHMISettingsControlData *hmiSettingsControlData;

/**
 * @since SDL 6.5.0
 */
@property (nullable, strong, nonatomic) SDLObsshControlData *obsshControlData;


@end

NS_ASSUME_NONNULL_END
