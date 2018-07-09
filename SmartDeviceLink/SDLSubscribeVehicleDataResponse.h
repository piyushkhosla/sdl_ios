//  SDLSubscribeVehicleDataResponse.h
//

#import "SDLRPCResponse.h"

@class SDLVehicleDataResult;

/**
 * Subscribe Vehicle Data Response is sent, when SDLSubscribeVehicleData has been called
 *
 * Since SmartDeviceLink 2.0
 */

NS_ASSUME_NONNULL_BEGIN

@interface SDLSubscribeVehicleDataResponse : SDLRPCResponse

/**
 * A SDLVehicleDataResult* value. See GPSData.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *gps;

/**
 * An array of SDLVehicleDataResult* value. See SDLGPSDataType.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *gpsArray;

/**
 * An array of SDLVehicleDataResult* value. See SDLGPSDrDataType.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *gpsDrArray;

/**
 * A SDLVehicleDataResult* value. The vehicle speed in kilometers per hour.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *speed;

/**
 * An array of SDLVehicleDataResult* value. The vehicle speed in kilometers per hour.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *speedArray;

/**
 * A SDLVehicleDataResult* value. The number of revolutions per minute of the engine.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *rpm;

/**
 * An array of SDLVehicleDataResult* value. The number of revolutions per minute of the engine.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *rpmArray;

/**
 * A SDLVehicleDataResult* value. The fuel level in the tank (percentage)
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *fuelLevel;

/**
 * An array of SDLVehicleDataResult* value. The fuel level in the tank (percentage)
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *fuelLevelArray;

/**
 * A SDLVehicleDataResult* value. The fuel level state.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *fuelLevel_State;

/**
 * A SDLVehicleDataResult* value. The fuel level state.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *fuelLevel_StateArray;

/**
 * An array of SDLVehicleDataResult* value. The instantaneous fuel consumption in microlitres.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *instantFuelConsumption;

/**
 * A SDLVehicleDataResult* value. The external temperature in degrees celsius.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *externalTemperature;

/**
 * An array of SDLVehicleDataResult* value. The external temperature in degrees celsius.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *externalTemperatureArray;

/**
 * A SDLVehicleDataResult* value. See PRNDL.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *prndl;

/**
 * An array of SDLVehicleDataResult* value. See PRNDL.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *prndlArray;

/**
 * A SDLVehicleDataResult* value. See TireStatus.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *tirePressure;

/**
 * An array of SDLVehicleDataResult* value. See TireStatus.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *tirePressureArray;

/**
 * A SDLVehicleDataResult* value. Odometer in km.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *odometer;

/**
 * A SDLVehicleDataResult* value. The status of the seat belts.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *beltStatus;

/**
 * A SDLVehicleDataResult* value. The body information including power modes.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *bodyInformation;

/**
 * A SDLVehicleDataResult* value. The device status including signal and battery strength.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *deviceStatus;

/**
 * A SDLVehicleDataResult* value. The status of the brake pedal.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *driverBraking;

/**
 * An array of SDLVehicleDataResult* value. The status of Vehicle's remaining range.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *fuelRemainingRangeArray;

/**
 * An array of SDLVehicleDataResult* value. The status of brake pedal position (percentage depressed).
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *brakePedalPositionArray;

/**
 * A SDLVehicleDataResult* value. The status of the wipers.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *wiperStatus;

/**
 * A SDLVehicleDataResult* value. Status of the head lamps.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *headLampStatus;

/**
 * A SDLVehicleDataResult* value. Torque value for engine (in Nm) on non-diesel variants.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *engineTorque;

/**
 * An array of SDLVehicleDataResult* value. Torque value for engine (in Nm) on non-diesel variants.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *engineTorqueArray;

/**
 * A SDLVehicleDataResult* value. Accelerator pedal position (percentage depressed)
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *accPedalPosition;

/**
 *  An array of SDLVehicleDataResult* value. Accelerator pedal position (percentage depressed)
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *accPedalPositionArray;

/**
 * A SDLVehicleDataResult* value. Current angle of the steering wheel (in deg)
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *steeringWheelAngle;

/**
 * An array of SDLVehicleDataResult* value. Current angle of the steering wheel (in deg)
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *steeringWheelAngleArray;

/**
 * An array of SDLVehicleDataResult* value. Current accelerometer data.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *accelerometerArray;

/**
 * An array of SDLVehicleDataResult* value. Current Gyroscope data.
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *gyroscopeArray;

/**
 The result of requesting to subscribe to the eCallInfo status
 Optional
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *eCallInfo;

/**
 The result of requesting to subscribe to the @property (strong, nonatomic, nullable) SDLVehicleDataResult *airbagStatus;
 status
 Optional
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *airbagStatus;

/**
 The result of requesting to subscribe to the emergencyEvent status
 Optional
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *emergencyEvent;

/**
 The result of requesting to subscribe to the clusterModes status
 Optional
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *clusterModes;

/**
 The result of requesting to subscribe to the myKey status
 Optional
 */
@property (strong, nonatomic, nullable) SDLVehicleDataResult *myKey;

@end

NS_ASSUME_NONNULL_END

