//  FMCBeltStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCVehicleDataEventStatus.h>

@interface FMCBeltStatus : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) FMCVehicleDataEventStatus* driverBeltDeployed;
@property(strong) FMCVehicleDataEventStatus* passengerBeltDeployed;
@property(strong) FMCVehicleDataEventStatus* passengerBuckleBelted;
@property(strong) FMCVehicleDataEventStatus* driverBuckleBelted;
@property(strong) FMCVehicleDataEventStatus* leftRow2BuckleBelted;
@property(strong) FMCVehicleDataEventStatus* passengerChildDetected;
@property(strong) FMCVehicleDataEventStatus* rightRow2BuckleBelted;
@property(strong) FMCVehicleDataEventStatus* middleRow2BuckleBelted;
@property(strong) FMCVehicleDataEventStatus* middleRow3BuckleBelted;
@property(strong) FMCVehicleDataEventStatus* leftRow3BuckleBelted;
@property(strong) FMCVehicleDataEventStatus* rightRow3BuckleBelted;
@property(strong) FMCVehicleDataEventStatus* leftRearInflatableBelted;
@property(strong) FMCVehicleDataEventStatus* rightRearInflatableBelted;
@property(strong) FMCVehicleDataEventStatus* middleRow1BeltDeployed;
@property(strong) FMCVehicleDataEventStatus* middleRow1BuckleBelted;

@end
