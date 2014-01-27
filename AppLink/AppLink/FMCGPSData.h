//  FMCGPSData.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCCompassDirection.h>
#import <AppLink/FMCDimension.h>
/**
 * Describes the GPS data. Not all data will be available on all carlines.
 * <p><b>Parameter List </b>
 * <table border="1" rules="all">
 * 		<tr>
 * 			<th>Name</th>
 * 			<th>Type</th>
 * 			<th>Description</th>
 * 			<th>AppLink Ver. Available</th>
 * 		</tr>
 * 		<tr>
 * 			<td>longitudeDegrees</td>
 * 			<td>NSNumber * </td>
 * 			<td>Minvalue: - 180
 * 					<br>Maxvalue: 180
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>latitudeDegrees</td>
 * 			<td>NSNumber * </td>
 * 			<td>Minvalue: - 90<br>Maxvalue: 90
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>utcYear</td>
 * 			<td>NSNumber * </td>
 * 			<td>Minvalue: 2010<br>Maxvalue: 2100
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>utcMonth</td>
 * 			<td>NSNumber * </td>
 * 			<td>Minvalue: 1<br>Maxvalue: 12
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>utcDay</td>
 * 			<td>NSNumber * </td>
 * 			<td>Minvalue: 1<br>Maxvalue: 31
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>utcHours</td>
 * 			<td>NSNumber * </td>
 * 			<td>Minvalue: 1<br>Maxvalue: 23
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>utcMinutes</td>
 * 			<td>NSNumber * </td>
 * 			<td>Minvalue: 1<br>Maxvalue: 59
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>utcSeconds</td>
 * 			<td>NSNumber * </td>
 * 			<td>Minvalue: 1<br>Maxvalue: 59
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>pdop</td>
 * 			<td>NSNumber * </td>
 * 			<td>Positional Dilution of Precision<br>Minvalue: 0<br>Maxvalue: 31
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>hdop</td>
 * 			<td>NSNumber * </td>
 * 			<td>Horizontal Dilution of Precision<br>Minvalue: 0<br>Maxvalue: 31
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>vdop</td>
 * 			<td>NSNumber * </td>
 * 			<td>Vertical  Dilution of Precision<br>Minvalue: 0<br>Maxvalue: 31
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>actual</td>
 * 			<td>NSNumber * </td>
 * 			<td>True, if coordinates are based on satellites.
 *					False, if based on dead reckoning
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>satellites</td>
 * 			<td>NSNumber * </td>
 * 			<td>Number of satellites in view
 *					<br>Minvalue: 0
 *					<br>Maxvalue: 31
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>altitude</td>
 * 			<td>NSNumber * </td>
 * 			<td>Altitude in meters
 *					<br>Minvalue: -10000
 *					<br>Maxvalue: 10000
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>heading</td>
 * 			<td>NSNumber * </td>
 * 			<td>The heading. North is 0, East is 90, etc.
 *					<br>Minvalue: 0
 *					<br>Maxvalue: 359.99
 *					<br>Resolution is 0.01
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>speed</td>
 * 			<td>NSNumber * </td>
 * 			<td>The speed in KPH
 *					<br>Minvalue: 0
 *					<br>Maxvalue: 400
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 *  </table>
 * Since <b>AppLink 2.0</b>
 */
@interface FMCGPSData : FMCRPCStruct {}
/**
 * Constructs a newly allocated FMCGPSData object
 */
-(id) init;
/**
 * Constructs a newly allocated FMCGPSData object indicated by the NSMutableDictionary parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract longitude degrees
 * @discussion
 */
@property(assign) NSNumber* longitudeDegrees;
/**
 * @abstract latitude degrees
 * @discussion
 */
@property(assign) NSNumber* latitudeDegrees;
/**
 * @abstract utc year
 * @discussion
 */
@property(assign) NSNumber* utcYear;
/**
 * @abstract utc month 
 * @discussion
 */
@property(assign) NSNumber* utcMonth;
/**
 * @abstract utc day 
 * @discussion
 */
@property(assign) NSNumber* utcDay;
/**
 * @abstract utc hours
 * @discussion
 */
@property(assign) NSNumber* utcHours;
/**
 * @abstract utc minutes
 * @discussion
 */
@property(assign) NSNumber* utcMinutes;
/**
 * @abstract utc seconds
 * @discussion
 */
@property(assign) NSNumber* utcSeconds;

@property(assign) FMCCompassDirection* compassDirection;
/**
 * @abstract the positional dilution of precision
 * @discussion
 */
@property(assign) NSNumber* pdop;
/**
 * @abstract the horizontal dilution of precision
 * @discussion
 */
@property(assign) NSNumber* hdop;
/**
 * @abstract the vertical dilution of precision
 * @discussion
 */
@property(assign) NSNumber* vdop;
/**
 * @abstract the coordinates based on 
 * @discussion 1, if coordinates are based on satellites. 0, if based on dead reckoning
 */
@property(assign) NSNumber* actual;
/**
 * @abstract the number of satellites in view
 * @discussion
 */
@property(assign) NSNumber* satellites;
@property(assign) FMCDimension* dimension;
/**
 * @abstract altitude in meters
 * @discussion
 */
@property(assign) NSNumber* altitude;
/**
 * @abstract  the heading.North is 0, East is 90, etc.
 * @discussion
 */
@property(assign) NSNumber* heading;
/**
 * @abstract speed in KPH
 * @discussion
 */
@property(assign) NSNumber* speed;

@end
