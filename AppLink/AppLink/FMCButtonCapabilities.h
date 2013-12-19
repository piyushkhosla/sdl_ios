//  FMCButtonCapabilities.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCButtonName.h>

/**
 * Provides information about the capabilities of a SYNC HMI button.
 * <p><b> Parameter List </b>
 * <table border="1" rules="all">
 * 		<tr>
 * 			<th>Name</th>
 * 			<th>Type</th>
 * 			<th>Description</th>
 * 			<th>AppLink Ver. Available</th>
 * 		</tr>
 * 		<tr>
 * 			<td>name</td>
 * 			<td>FMCButtonName</td>
 * 			<td>The name of the SYNC HMI button.</td>
 * 			<td>AppLink 1.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>shortPressAvailable</td>
 * 			<td>NSNumber * </td>
 * 			<td>The button supports a SHORT press. See FMCButtonPressMode for more information.</td>
 * 			<td>AppLink 1.0</td>
 * 		</tr>
 *     <tr>
 * 			<td>longPressAvailable</td>
 * 			<td>NSNumber * </td>
 * 			<td>The button supports a LONG press. See FMCButtonPressMode for more information.</td>
 * 			<td>AppLink 1.0</td>
 * 		</tr>
 *     <tr>
 * 			<td>upDownAvailable</td>
 * 			<td>NSNumber * </td>
 * 			<td>The button supports "button down" and "button up". When the button is depressed, the <i>FMCOnButtonEvent</i> notification will be invoked with a value of BUTTONDOWN.
 *                  <p> When the button is released, the <i>FMCOnButtonEvent</i> notification will be invoked with a value of BUTTONUP.</td>
 * 			<td>AppLink 1.0</td>
 * 		</tr>
 * </table>
 * Since <b>AppLink 1.0</b><br>
 */
@interface FMCButtonCapabilities : FMCRPCStruct {}

/**
 * Constructs a newly allocated FMCButtonCapabilities object
 */
-(id) init;
/**
 * Constructs a newly allocated FMCButtonCapabilities object indicated by the Hashtable parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract The name of the SYNC HMI button.
 * @discussion
 */
@property(assign) FMCButtonName* name;
/**
 * @abstract A NSNumber value indicates whether the button supports a SHORT press
 * @discussion
 */
@property(assign) NSNumber* shortPressAvailable;
/**
 * @abstract A NSNumber value indicates whether the button supports a LONG press
 * @discussion
 */
@property(assign) NSNumber* longPressAvailable;
/**
 * @abstract A NSNumber value indicates whether the button supports "button down" and "button up"
 * @discussion
 */
@property(assign) NSNumber* upDownAvailable;

@end
