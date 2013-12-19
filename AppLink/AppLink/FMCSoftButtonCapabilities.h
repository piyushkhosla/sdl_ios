//  FMCSoftButtonCapabilities.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

/**
 * Contains information about a SoftButton's capabilities.
 * <p><b>Parameter List
 * <table border="1" rules="all">
 * 		<tr>
 * 			<th>Name</th>
 * 			<th>Type</th>
 * 			<th>Description</th>
 * 			<th>AppLink Ver. Available</th>
 * 		</tr>
 * 		<tr>
 * 			<td>shortPressAvailable</td>
 * 			<td>Boolean</td>
 * 			<td>The button supports a short press.
 *					Whenever the button is pressed short, onButtonPressed( SHORT) will be invoked.
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>longPressAvailable</td>
 * 			<td>Boolean</td>
 * 			<td>The button supports a LONG press.
 * 					Whenever the button is pressed long, onButtonPressed( LONG) will be invoked.
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>upDownAvailable</td>
 * 			<td>Boolean</td>
 * 			<td>The button supports "button down" and "button up". Whenever the button is pressed, onButtonEvent( DOWN) will be invoked.
 *					Whenever the button is released, onButtonEvent( UP) will be invoked. *
 *			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>imageSupported</td>
 * 			<td>Boolean</td>
 * 			<td>The button supports referencing a static or dynamic image.
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 *  </table>
 * Since AppLink 2.0
 */
@interface FMCSoftButtonCapabilities : FMCRPCStruct {}

/**
 * @abstract Constructs a newly allocated FMCSoftButtonCapabilities object
 */
-(id) init;
/**
 * @abstract Constructs a newly allocated FMCSoftButtonCapabilities object indicated by the NSMutableDictionary parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract The button supports a short press.
 */
@property(assign) NSNumber* shortPressAvailable;
/**
 * @abstract The button supports a LONG press.
 */
@property(assign) NSNumber* longPressAvailable;
/**
 * @abstract The button supports "button down" and "button up".
 */
@property(assign) NSNumber* upDownAvailable;
/**
 * @abstract The button supports referencing a static or dynamic image.
 */
@property(assign) NSNumber* imageSupported;

@end
