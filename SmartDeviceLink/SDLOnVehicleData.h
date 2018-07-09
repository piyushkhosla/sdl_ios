//  SDLOnVehicleData.h
//

#import "SDLRPCNotification.h"

#import "SDLComponentVolumeStatus.h"
#import "SDLPRNDL.h"
#import "SDLVehicleDataEventStatus.h"
#import "SDLWiperStatus.h"

@class SDLAirbagStatus;
@class SDLAccPedalPositionType;
@class SDLAxisSensorDataType;
@class SDLBeltStatus;
@class SDLBodyInformation;
@class SDLBrakePedalPositionType;
@class SDLClusterModeStatus;
@class SDLComponentVolumeStatusType;
@class SDLDeviceStatus;
@class SDLECallInfo;
@class SDLEmergencyEvent;
@class SDLEngineTorqueType;
@class SDLExternalTemperatureType;
@class SDLFuelLevelType;
@class SDLFuelRemainingRangeType;
@class SDLGPSData;
@class SDLGPSDataType;
@class SDLGPSDrDataType;
@class SDLHeadLampStatus;
@class SDLMyKey;
@class SDLPRNDLType;
@class SDLRpmType;
@class SDLSpeedType;
@class SDLSteeringWheelAngleType;
@class SDLTireStatus;
@class SDLTireStatusType;
@class SDLWheelSpeedsDataType;


/**
 * Request vehicle data.
 *
 * Since SmartDeviceLink 2.0
 */

NS_ASSUME_NONNULL_BEGIN

@interface SDLOnVehicleData : SDLRPCNotification

/**
 The car current GPS coordinates
 */
@property (nullable, strong, nonatomic) SDLGPSData *gps;

/**
 * An array of SDLGPSDataType* type.
 * See SDLGPSDataType.
 */
@property (nullable, strong, nonatomic) NSMutableArray <SDLGPSDataType*> *gpsArray;

/**
 * An array of SDLGPSDrDataType* type.
 * See SDLGPSDrDataType.
 */
@property (nullable, strong, nonatomic) NSMutableArray <SDLGPSDrDataType*> *gpsDrArray;

/**
 *  The vehicle speed in kilometers per hour
 */
@property (nullable, strong, nonatomic) NSNumber<SDLFloat> *speed;

/**
 * An array of the vehicle speed in kilometers per hour.
 */
@property (nullable, strong, nonatomic) NSMutableArray <SDLSpeedType *> *speedArray;

/**
 * The number of revolutions per minute of the engine.
 */
@property (nullable, strong, nonatomic) NSNumber<SDLInt> *rpm;

/**
 * An array of the number of revolutions per minute of
 * the engine.
 */
@property (nullable, strong, nonatomic) NSMutableArray <SDLRpmType *> *rpmArray;

/**
 * The fuel level in the tank (percentage)
 */
@property (nullable, strong, nonatomic) NSNumber<SDLFloat> *fuelLevel;

/**
 * An array of the fuel level in the tank (percentage)
 */
@property (nullable, strong, nonatomic) NSMutableArray <SDLFuelLevelType *> *fuelLevelArray;

/**
 * A SDLComponentVolumeStatus* value. The fuel level state.
 */
@property (nullable, strong, nonatomic) SDLComponentVolumeStatus fuelLevel_State;

/**
 * An array of the fuel level state.
 */
@property (nullable, strong, nonatomic) NSMutableArray <SDLComponentVolumeStatusType *> *fuelLevel_StateArray;

/**
 * The instantaneous fuel consumption in microlitres.
 */
@property (nullable, strong, nonatomic) NSNumber<SDLFloat> *instantFuelConsumption;

/**
 * The external temperature in degrees celsius.
 */
@property (nullable, strong, nonatomic) NSNumber<SDLFloat> *externalTemperature;

/**
 * An array of the external temperature in degrees celsius.
 */
@property (nullable, strong, nonatomic) NSMutableArray <SDLExternalTemperatureType *> *externalTemperatureArray;

/**
 * The Vehicle Identification Number
 */
@property (nullable, strong, nonatomic) NSString *vin;

/**
 * See PRNDL.
 */
@property (nullable, strong, nonatomic) SDLPRNDL prndl;

/**
 * See PRNDLType.
 */
@property (nullable, strong, nonatomic) NSMutableArray <SDLPRNDLType *> *prndlArray;

/**
 * A SDLTireStatus* value. See TireStatus.
 */
@property (nullable, strong, nonatomic) SDLTireStatus *tirePressure;

/**
 * A SDLTireStatusType* value. See TireStatusType.
 */
@property (nullable, strong, nonatomic) NSMutableArray <SDLTireStatusType *> *tirePressureArray;

/**
 * Odometer reading in km.
 */
@property (nullable, strong, nonatomic) NSNumber<SDLInt> *odometer;

/**
 * A SDLBeltStatus* value. The status of the seat belts.
 */
@property (nullable, strong, nonatomic) SDLBeltStatus *beltStatus;

/**
 * A SDLBodyInformation* value. The body information including power modes.
 */
@property (nullable, strong, nonatomic) SDLBodyInformation *bodyInformation;

/**
 * A SDLDeviceStatus* value. The device status including signal and battery strength.
 */
@property (nullable, strong, nonatomic) SDLDeviceStatus *deviceStatus;

/**
 * A SDLVehicleDataResult* value. The status of the brake pedal.
 */
@property (nullable, strong, nonatomic) SDLVehicleDataEventStatus driverBraking;

/**
 * A SDLFuelRemainingRangeType* value. An array of vehicle's remaining range.
 */
@property (nullable, strong, nonatomic) NSMutableArray <SDLFuelRemainingRangeType *> *fuelRemainingRangeArray;

/**
 * A SDLBrakePedalPositionType* value. An array of brake pedal position (percentage depressed).
 */
@property (nullable, strong, nonatomic) NSMutableArray <SDLBrakePedalPositionType *> *brakePedalPositionArray;

/**
 * A SDLWiperStatus* value. The status of the wipers.
 */
@property (nullable, strong, nonatomic) SDLWiperStatus wiperStatus;

/**
 * A SDLHeadLampStatus* value. Status of the head lamps.
 */
@property (nullable, strong, nonatomic) SDLHeadLampStatus *headLampStatus;

/**
 * Torque value for engine (in Nm) on non-diesel variants.
 */
@property (nullable, strong, nonatomic) NSNumber<SDLFloat> *engineTorque;

/**
 * An array of torque values for engine (in Nm) on non-diesel variants.
 */
@property (nullable, strong, nonatomic) NSMutableArray <SDLEngineTorqueType *> *engineTorqueArray;

/**
 * Accelerator pedal position (percentage depressed)
 */
@property (nullable, strong, nonatomic) NSNumber<SDLFloat> *accPedalPosition;

/**
 * An array of accelerator pedal position (percentage depressed)
 */
@property (nullable, strong, nonatomic) NSMutableArray <SDLAccPedalPositionType *> *accPedalPositionArray;

/**
 * An array of the angle of the steering wheel (in deg)
 */
@property (nullable, strong, nonatomic) NSMutableArray <SDLSteeringWheelAngleType *> *steeringWheelAngleArray;

/**
 * An array of accelerometer data.
 */
@property (nullable, strong, nonatomic) NSMutableArray <SDLAxisSensorDataType *> *accelerometerArray;

/**
 * An array of Gyroscope data
 */
@property (nullable, strong, nonatomic) NSMutableArray <SDLAxisSensorDataType *> *gyroscopeArray;

/**
 * An array of Wheel speeds data
 */
@property (nullable, strong, nonatomic) NSMutableArray <SDLWheelSpeedsDataType *> *wheelSpeedsArray;

/**
 * Current angle of the steering wheel (in deg)
 */
@property (nullable, strong, nonatomic) NSNumber<SDLFloat> *steeringWheelAngle;
@property (nullable, strong, nonatomic) SDLECallInfo *eCallInfo;
@property (nullable, strong, nonatomic) SDLAirbagStatus *airbagStatus;
@property (nullable, strong, nonatomic) SDLEmergencyEvent *emergencyEvent;
@property (nullable, strong, nonatomic) SDLClusterModeStatus *clusterModeStatus;
@property (nullable, strong, nonatomic) SDLMyKey *myKey;


@end

NS_ASSUME_NONNULL_END

