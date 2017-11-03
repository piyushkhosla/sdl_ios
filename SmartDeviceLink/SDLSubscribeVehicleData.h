//  SDLSubscribeVehicleData.h
//


#import "SDLRPCRequest.h"

/**
 * Subscribes for specific published vehicle data items. The data will be only
 * sent, if it has changed. The application will be notified by the
 * onVehicleData notification whenever new data is available. The update rate is
 * very much dependent on sensors, vehicle architecture and vehicle type. Be
 * also prepared for the situation that a signal is not available on a vehicle
 * <p>
 * Function Group: Location, VehicleInfo and DrivingChara
 * <p>
 * <b>HMILevel needs to be FULL, LIMITED or BACKGROUND</b>
 * </p>
 *
 * Since SmartDeviceLink 2.0<br/>
 * See SDLUnsubscribeVehicleData SDLGetVehicleData
 */

NS_ASSUME_NONNULL_BEGIN

@interface SDLSubscribeVehicleData : SDLRPCRequest

- (instancetype)initWithAccelerationPedalPosition:(BOOL)accelerationPedalPosition airbagStatus:(BOOL)airbagStatus beltStatus:(BOOL)beltStatus bodyInformation:(BOOL)bodyInformation clusterModeStatus:(BOOL)clusterModeStatus deviceStatus:(BOOL)deviceStatus driverBraking:(BOOL)driverBraking eCallInfo:(BOOL)eCallInfo emergencyEvent:(BOOL)emergencyEvent engineTorque:(BOOL)engineTorque externalTemperature:(BOOL)externalTemperature fuelLevel:(BOOL)fuelLevel fuelLevelState:(BOOL)fuelLevelState gps:(BOOL)gps headLampStatus:(BOOL)headLampStatus instantFuelConsumption:(BOOL)instantFuelConsumption myKey:(BOOL)myKey odometer:(BOOL)odometer prndl:(BOOL)prndl rpm:(BOOL)rpm speed:(BOOL)speed steeringWheelAngle:(BOOL)steeringWheelAngle tirePressure:(BOOL)tirePressure wiperStatus:(BOOL)wiperStatus;

/**
 * @abstract A SDLVehicleDataResult* value. See GPSData.
 */
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *gps;

/**
 * @abstract A SDLVehicleDataResult* value. The vehicle speed in kilometers per hour.
 */
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *speed;

/**
 * @abstract A SDLVehicleDataResult* value. The number of revolutions per minute of the engine.
 */
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *rpm;

/**
 * @abstract A SDLVehicleDataResult* value. The fuel level in the tank (percentage)
 */
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *fuelLevel;

/**
 * @abstract A SDLVehicleDataResult* value. The fuel level state.
 */
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *fuelLevel_State;

/**
 * @abstract A SDLVehicleDataResult* value. The instantaneous fuel consumption in microlitres.
 */
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *instantFuelConsumption;

/**
 * @abstract A SDLVehicleDataResult* value. The external temperature in degrees celsius.
 */
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *externalTemperature;

/**
 * @abstract A SDLVehicleDataResult* value. See PRNDL.
 */
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *prndl;

/**
 * @abstract A SDLVehicleDataResult* value. See TireStatus.
 */
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *tirePressure;

/**
 * @abstract A SDLVehicleDataResult* value. Odometer in km.
 */
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *odometer;

/**
 * @abstract A SDLVehicleDataResult* value. The status of the seat belts.
 */
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *beltStatus;

/**
 * @abstract A SDLVehicleDataResult* value. The body information including power modes.
 */
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *bodyInformation;

/**
 * @abstract A SDLVehicleDataResult* value. The device status including signal and battery strength.
 */
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *deviceStatus;

/**
 * @abstract A SDLVehicleDataResult* value. The status of the brake pedal.
 */
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *driverBraking;

/**
 * @abstract A SDLVehicleDataResult* value. The status of the wipers.
 */
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *wiperStatus;

/**
 * @abstract A SDLVehicleDataResult* value. Status of the head lamps.
 */
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *headLampStatus;

/**
 * @abstract A SDLVehicleDataResult* value. Torque value for engine (in Nm) on non-diesel variants.
 */
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *engineTorque;

/**
 * @abstract A SDLVehicleDataResult* value. Accelerator pedal position (percentage depressed)
 */
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *accPedalPosition;

/**
 * @abstract A SDLVehicleDataResult* value. Range in KM based on fuel consumption/level
 */
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *fuelRange;

/**
 * @abstract A SDLVehicleDataResult* value. The status of the abs.
 */
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *abs_State;

/**
 * @abstract A SDLVehicleDataResult* value. The status of the tirePressureValue.
 */
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *tirePressureValue;

/**
 * @abstract A SDLVehicleDataResult* value. The status of the tpms.
 */
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *tpms;

/**
 * @abstract A SDLVehicleDataResult* value. The status of the turnSignal.
 */
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *turnSignal;

/**
 * @abstract A SDLVehicleDataResult* value. Current angle of the steering wheel (in deg)
 */
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *steeringWheelAngle;

/**
 * @abstract The estimated percentage of remaining oil life of the engine.
 */
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *engineOilLife;

/**
 * @abstract The status of the park brake as provided by Electric Park Brake (EPB) system.
 *
 */
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *electronicParkBrakeStatus;

@property (strong, nonatomic, nullable) NSNumber<SDLBool> *eCallInfo;
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *airbagStatus;
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *emergencyEvent;
@property (nullable, strong, nonatomic) NSNumber<SDLBool> *clusterModeStatus;
@property (strong, nonatomic, nullable) NSNumber<SDLBool> *myKey;
@end

NS_ASSUME_NONNULL_END
