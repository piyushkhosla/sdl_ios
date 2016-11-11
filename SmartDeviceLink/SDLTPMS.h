//
//  SDLTPMS.h
//  SmartDeviceLink-iOS
//


#import "SDLEnum.h"

@interface SDLTPMS : SDLEnum

/**
 @abstract get SDLTPMS according value string
 @param value NSString
 @return SDLTPMS object
 */
+ (SDLTPMS *)valueOf:(NSString *)value;
/**
 @abstract declare an array to store all possible SDLTPMS values
 @return the array
 */
+ (NSArray *)values;

/**
 State is unknown
 **/
+ (SDLTPMS *)UNKNOWN;

/**
TPMS system is in a state of Fault
 **/
+ (SDLTPMS *)SYSTEM_FAULT;

/**
Sensor is faulty
 **/
+ (SDLTPMS *)SENSOR_FAULT;

/**
 Low Composite state
 **/
+ (SDLTPMS *)LOW;

/**
System Active Composite state
 **/
+ (SDLTPMS *)SYSTEM_ACTIVE;

/**
Train left front tire
 **/
+ (SDLTPMS *)TRAIN_LF_TIRE;

/**
 Train right front tire
 **/
+ (SDLTPMS *)TRAIN_RF_TIRE;

/**
Train right rear tire
 **/
+ (SDLTPMS *)TRAIN_RR_TIRE;

/**
Train outer right rear tire
 **/
+ (SDLTPMS *)TRAIN_ORR_TIRE;

/**
Train inner right rear tire
 **/
+ (SDLTPMS *)TRAIN_IRR_TIRE;

/**
Train left rear tire
 **/
+ (SDLTPMS *)TRAIN_LR_TIRE;

/**
Train outer left rear tire
 **/
+ (SDLTPMS *)TRAIN_OLR_TIRE;

/**
Train inner left rear tire
 **/
+ (SDLTPMS *)TRAIN_ILR_TIRE;

/**
Training Complete
 **/
+ (SDLTPMS *)TRAINING_COMPLETE;

/**
Tires are not trained
 **/
+ (SDLTPMS *)TIRES_NOT_TRAINED;
@end
