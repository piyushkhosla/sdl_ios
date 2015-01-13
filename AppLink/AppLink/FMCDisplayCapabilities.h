//  FMCDisplayCapabilities.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCDisplayType.h>
#import <AppLink/FMCScreenParams.h>

/**
 * Contains information about the display for the SYNC system to which the application is currently connected.
 * <p><b> Parameter List </b>
 * <table border="1" rules="all">
 * 		<tr>
 * 			<th>Name</th>
 * 			<th>Type</th>
 * 			<th>Description</th>
 * 			<th>AppLink Ver. Available</th>
 * 		</tr>
 * 		<tr>
 * 			<td>displayType</td>
 * 			<td>FMCDisplayType * </td>
 * 			<td>The type of display
 *			</td>
 * 			<td>AppLink 1.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>textFields</td>
 * 			<td>NSMutableArray * </td>
 * 			<td>An array of TextField structures, each of which describes a field in the HMI which the application can write to using operations such as <i>FMCShow</i>, <i>FMCSetMediaClockTimer</i>, etc.
 *					 This array of TextField structures identify all the text fields to which the application can write on the current display (identified by DisplayType ).
 * 			</td>
 * 			<td>AppLink 1.0</td>
 * 		</tr>
 *     <tr>
 * 			<td>mediaClockFormats</td>
 * 			<td>NSMutableArray * </td>
 * 			<td>An array of MediaClockFormat elements, defining the valid string formats used in specifying the contents of the media clock field</td>
 * 			<td>AppLink 1.0</td>
 * 		</tr>
 *     <tr>
 * 			<td>graphicSupported</td>
 * 			<td>NSNumber * </td>
 * 			<td>The display's persistent screen supports referencing a static or dynamic image.</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * </table>
 * Since <b>AppLink 1.0</b><br>
 */
@interface FMCDisplayCapabilities : FMCRPCStruct {}

/**
 * Constructs a newly allocated FMCDisplayCapabilities object
 */
-(id) init;
/**
 * Constructs a newly allocated FMCDisplayCapabilities object indicated by the NSMutableDictionary parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract the type of display
 * @discussion
 */
@property(strong) FMCDisplayType* displayType;
/**
 * @abstract an array of FMCTextField structures, each of which describes a field in the HMI which the application can write to using operations such as <i>FMCShow</i>, <i>FMCSetMediaClockTimer</i>, etc.
 * @discussion  This array of FMCTextField structures identify all the text fields to which the application can write on the current display (identified by FMCDisplayType ).
 */
@property(strong) NSMutableArray* textFields;
/**
 * @abstract an array of FMCImageField elements
 * @discussion A set of all fields that support images. See FMCImageField.
 */
@property(strong) NSMutableArray* imageFields;
/**
 * @abstract an array of FMCMediaClockFormat elements, defining the valid string formats used in specifying the contents of the media clock field
 * @discussion
 */
@property(strong) NSMutableArray* mediaClockFormats;
/**
 * @abstract the display's persistent screen supports.
 * @discussion
 * Since <b>AppLink 2.0</b>
 */
@property(strong) NSNumber* graphicSupported;
/**
 * @abstract Number of presets the screen supports.
 * @discussion The number of on-screen custom presets available (if any)
 */
@property(strong) NSMutableArray* templatesAvailable;
@property(strong) FMCScreenParams* screenParams;
@property(strong) NSNumber* numCustomPresetsAvailable;

@end
