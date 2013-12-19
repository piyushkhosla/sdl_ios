//  FMCTurn.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCImage.h>

/**
 * Describes a navigation turn including an optional icon
 * <p><b>Parameter List
 * <table border="1" rules="all">
 * 		<tr>
 * 			<th>Name</th>
 * 			<th>Type</th>
 * 			<th>Description</th>
 * 			<th>AppLink Ver. Available</th>
 * 		</tr>
 * 		<tr>
 * 			<td>navigationText</td>
 * 			<td>String</td>
 * 			<td>Text to describe the turn (e.g. streetname)
 *				 <ul>
 *					<li>Maxlength = 500</li>
 *				 </ul>
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>turnIcon</td>
 * 			<td>Image</td>
 * 			<td>Image to be shown for a turn
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 *  </table>
 * Since AppLink 2.0
 */
@interface FMCTurn : FMCRPCStruct {}

/**
 * @abstract Constructs a newly allocated FMCTurn object
 */
-(id) init;
/**
 * @abstract Constructs a newly allocated FMCTurn object indicated by the NSMutableDictionary parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract The text to describe the turn (e.g. streetname)
 */
@property(assign) NSString* navigationText;
/**
 * @abstract Image to be shown for a turn
 */
@property(assign) FMCImage* turnIcon;

@end