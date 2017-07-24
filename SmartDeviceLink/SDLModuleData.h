//
//  SDLModuleData.h
//

#import "SDLRPCMessage.h"
@class SDLModuleType;
@class SDLRadioControlData;
@class SDLClimateControlData;

@interface SDLModuleData : SDLRPCStruct

/**
 * The moduleType indicates which type of data should be changed
 * and identifies which data object exists in this struct.
 * For example, if the moduleType is CLIMATE then a "climateControlData" should exist
 */
@property (strong) SDLModuleType *moduleType;

@property (strong) SDLRadioControlData *radioControlData;

@property (strong) SDLClimateControlData *climateControlData;


@end
