//  FMCAppInterfaceUnregisteredReason.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * Indicates reason why app interface was unregistered. The application is being disconnected by SYNC.
 *
 * This enum is avaliable since <font color=red><b>AppLink 1.0</b></font>
 */
@interface FMCAppInterfaceUnregisteredReason : FMCEnum {
}

/**
 * @abstract Convert String to FMCAppInterfaceUnregisteredReason
 * @param value NSString
 * @result FMCAppInterfaceUnregisteredReason
 */
+(FMCAppInterfaceUnregisteredReason*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCAppInterfaceUnregisteredReason
 @result return an array that store all possible FMCAppInterfaceUnregisteredReason
 */
+(NSMutableArray*) values;

/**
 * @abstract  Vehicle ignition turned off.
 * @result FMCAppInterfaceUnregisteredReason with value <font color=gray><i>IGNITION_OFF</i></font>
 * @since <font color=red><b>AppLink 1.0</b></font>
 */
+(FMCAppInterfaceUnregisteredReason*) IGNITION_OFF;
/**
 * @abstract  Bluetooth was turned off, causing termination of a necessary Bluetooth connection.
 * @result FMCAppInterfaceUnregisteredReason with value <font color=gray><i>BLUETOOTH_OFF</i></font>
 * @since <font color=red><b>AppLink 1.0</b></font>
 */
+(FMCAppInterfaceUnregisteredReason*) BLUETOOTH_OFF;
/**
 * @abstract  USB was disconnected, causing termination of a necessary iAP connection.
 * @result FMCAppInterfaceUnregisteredReason with value <font color=gray><i>USB_DISCONNECTED</i></font>
 * @since <font color=red><b>AppLink 1.0</b></font>
 */
+(FMCAppInterfaceUnregisteredReason*) USB_DISCONNECTED;
/**
 * @abstract  Application attempted AppLink RPC request while HMILevel
 * = NONE. App must have HMILevel other than NONE to issue RPC requests or
 * get notifications or RPC responses.
 * @result FMCAppInterfaceUnregisteredReason with value <font color=gray><i>REQUEST_WHILE_IN_NONE_HMI_LEVEL</i></font>
 * @since <font color=red><b>AppLink 1.0</b></font>
 */
+(FMCAppInterfaceUnregisteredReason*) REQUEST_WHILE_IN_NONE_HMI_LEVEL;
/**
 * @abstract  Either too many -- or too many per unit of time -- requests were made by
 * the application.
 * @result FMCAppInterfaceUnregisteredReason with value <font color=gray><i>TOO_MANY_REQUESTS</i></font>
 * @since <font color=red><b>AppLink 1.0</b></font>
 */
+(FMCAppInterfaceUnregisteredReason*) TOO_MANY_REQUESTS;
/**
 * @abstract  The application has issued requests which cause driver distraction rules
 * to be violated.
 * @result FMCAppInterfaceUnregisteredReason with value <font color=gray><i>DRIVER_DISTRACTION_VIOLATION</i></font>
 * @since <font color=red><b>AppLink 1.0</b></font>
 */
+(FMCAppInterfaceUnregisteredReason*) DRIVER_DISTRACTION_VIOLATION;
+(FMCAppInterfaceUnregisteredReason*) LANGUAGE_CHANGE;
/**
 * @abstract  The user performed a MASTER RESET on the SYNC platform, causing removal
 * of a necessary Bluetooth pairing.
 * @result FMCAppInterfaceUnregisteredReason with value <font color=gray><i>MASTER_RESET</i></font>
 * @since <font color=red><b>AppLink 1.0</b></font>
 */
+(FMCAppInterfaceUnregisteredReason*) MASTER_RESET;
/**
 * @abstract  The user restored settings to FACTORY DEFAULTS on the SYNC platform.
 * @result FMCAppInterfaceUnregisteredReason with value <font color=gray><i>FACTORY_DEFAULTS</i></font>
 * @since <font color=red><b>AppLink 1.0</b></font>
 */
+(FMCAppInterfaceUnregisteredReason*) FACTORY_DEFAULTS;
/**
 * @abstract  The app is not being authorized by Ford to be connected to SYNC.
 * @result FMCAppInterfaceUnregisteredReason with value <font color=gray><i>APP_UNAUTHORIZED</i></font>
 * @since <font color=red><b>AppLink 2.0</b></font>
 */
+(FMCAppInterfaceUnregisteredReason*) APP_UNAUTHORIZED;

@end
