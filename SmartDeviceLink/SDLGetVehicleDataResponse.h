//  SDLGetVehicleDataResponse.h
//

#import "SDLRPCResponse.h"

@class SDLAirbagStatus;
@class SDLBeltStatus;
@class SDLBodyInformation;
@class SDLClusterModeStatus;
@class SDLComponentVolumeStatus;
@class SDLDeviceStatus;
@class SDLECallInfo;
@class SDLEmergencyEvent;
@class SDLGPSData;
@class SDLHeadLampStatus;
@class SDLMyKey;
@class SDLPRNDL;
@class SDLTireStatus;
@class SDLVehicleDataEventStatus;
@class SDLWiperStatus;
@class SDLABS_STATE;
@class SDLTirePressureValue;
@class SDLTPMS;
@class SDLTurnSignal;


/**
 * Get Vehicle Data Response is sent, when SDLGetVehicleData has been called
 *
 * Since SmartDeviceLink 2.0
 */
@interface SDLGetVehicleDataResponse : SDLRPCResponse {
}


/**
 * @abstract Constructs a new SDLGetVehicleDataResponse object
 */
- (instancetype)init;

/**
 * @abstract Constructs a new SDLGetVehicleDataResponse object indicated by the NSMutableDictionary
 * parameter
 * @param dict The dictionary to use
 */
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;


/**
 * @abstract A SDLGPSData* value. See GPSData.
 */
@property (strong) SDLGPSData *gps;

/**
 * @abstract The vehicle speed in kilometers per hour.
 */
@property (strong) NSNumber *speed;

/**
 * @abstract The number of revolutions per minute of the engine.
 */
@property (strong) NSNumber *rpm;

/**
 * @abstract The fuel level in the tank (percentage)
 */
@property (strong) NSNumber *fuelLevel;

/**
 * @abstract A SDLComponentVolumeStatus* value. The fuel level state.
 */
@property (strong) SDLComponentVolumeStatus *fuelLevel_State;

/**
 * @abstract The instantaneous fuel consumption in microlitres.
 */
@property (strong) NSNumber *instantFuelConsumption;

/**
 * @abstract The external temperature in degrees celsius.
 */
@property (strong) NSNumber *externalTemperature;

/**
 * @abstract The Vehicle Identification Number
 */
@property (strong) NSString *vin;

/**
 * @abstract See PRNDL.
 */
@property (strong) SDLPRNDL *prndl;

/**
 * @abstract A SDLTireStatus* value. See TireStatus.
 */
@property (strong) SDLTireStatus *tirePressure;

/**
 * @abstract Odometer reading in km.
 */
@property (strong) NSNumber *odometer;

/**
 * @abstract A SDLBeltStatus* value. The status of the seat belts.
 */
@property (strong) SDLBeltStatus *beltStatus;

/**
 * @abstract A SDLBodyInformation* value. The body information including power modes.
 */
@property (strong) SDLBodyInformation *bodyInformation;

/**
 * @abstract A SDLDeviceStatus* value. The device status including signal and battery strength.
 */
@property (strong) SDLDeviceStatus *deviceStatus;

/**
 * @abstract A SDLVehicleDataResult* value. The status of the brake pedal.
 */
@property (strong) SDLVehicleDataEventStatus *driverBraking;

/**
 * @abstract A SDLWiperStatus* value. The status of the wipers.
 */
@property (strong) SDLWiperStatus *wiperStatus;

/**
 * @abstract A SDLHeadLampStatus* value. Status of the head lamps.
 */
@property (strong) SDLHeadLampStatus *headLampStatus;

/**
 * @abstract Torque value for engine (in Nm) on non-diesel variants.
 */
@property (strong) NSNumber *engineTorque;

/**
 * @abstract Accelerator pedal position (percentage depressed)
 */
@property (strong) NSNumber *accPedalPosition;

/**
 * @abstract Range in KM based on fuel consumption/level
 */
@property (strong) NSNumber *fuelRange;

/**
 * @abstract A SDLABS_STATE* value. The status of the abs.
 */
@property (strong) SDLABS_STATE *abs_State;

/**
 * @abstract A SDLTirePressureValue* value. The status of the tirePressureValue.
 */
@property (strong) SDLTirePressureValue *tirePressureValue;

/**
 * @abstract A SDLTPMS* value. The status of the tpms.
 */
@property (strong) SDLTPMS *tpms;

/**
 * @abstract A SDLTurnSignal* value. The status of the turnSignal.
 */
@property (strong) SDLTurnSignal *turnSignal;

/**
 * @abstract Current angle of the steering wheel (in deg)
 */
@property (strong) NSNumber *steeringWheelAngle;
@property (strong) SDLECallInfo *eCallInfo;
@property (strong) SDLAirbagStatus *airbagStatus;
@property (strong) SDLEmergencyEvent *emergencyEvent;
@property (strong) SDLClusterModeStatus *clusterModeStatus;
@property (strong) SDLMyKey *myKey;

@end
