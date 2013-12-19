//  FMCImage.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCImageType.h>

/**
 *Specifies, which image shall be used, e.g. in FMCAlerts or on FMCSoftbuttons provided the display supports it.
 *<p><b>Parameter List</b>
 * <table border="1" rules="all">
 * 		<tr>
 * 			<th>Name</th>
 * 			<th>Type</th>
 * 			<th>Description</th>
 * 			<th>AppLink Ver. Available</th>
 * 		</tr>
 * 		<tr>
 * 			<td>value</td>
 * 			<td>NSString* </td>
 * 			<td>Either the static hex icon value or the binary image file name identifier (sent by FMCPutFile).
 * 					<ul>
 *					<li>Min: 0</li>
 *					<li>Max: 65535</li>
 *					</ul>
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>imageType</td>
 * 			<td>FMCImageType* </td>
 * 			<td>Describes, whether it is a static or dynamic image.</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 *  </table>
 * Since <b>AppLink 2.0</b>
 */
@interface FMCImage : FMCRPCStruct {}

/**
 * Constructs a newly allocated FMCImage object
 */
-(id) init;
/**
 * Constructs a newly allocated FMCImage object indicated by the NSMutableDictionary parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract the static hex icon value or the binary image file name identifier (sent by FMCPutFile)
 * @discussion
 */
@property(assign) NSString* value;
/**
 * @abstract the image type
 * @discussion
 */
@property(assign) FMCImageType* imageType;

@end
