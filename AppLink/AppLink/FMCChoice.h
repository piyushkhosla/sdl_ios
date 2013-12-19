//  FMCChoice.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCImage.h>

/**
 * A choice is an option which a user can select either via the menu or via voice recognition (VR) during an application initiated interaction.
 * <p><b> Parameter List</b>
 * <table border="1" rules="all">
 * 		<tr>
 * 			<th>Name</th>
 * 			<th>Type</th>
 * 			<th>Description</th>
 * 			<th>AppLink Ver. Available</th>
 * 		</tr>
 * 		<tr>
 * 			<td>choiceID</td>
 * 			<td>NSNumber * </td>
 * 			<td>Application-scoped identifier that uniquely identifies this choice.
 *             <br/>Min: 0
 *				<br/>Max: 65535
 *			</td>
 * 			<td>AppLink 1.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>menuName</td>
 * 			<td>NSString * </td>
 * 			<td>Text which appears in menu, representing this choice.
 *				<br/>Min: 1
 *				<br/>Max: 100
 * 			</td>
 * 			<td>AppLink 1.0</td>
 * 		</tr>
 *     <tr>
 * 			<td>vrCommands</td>
 * 			<td>NSMutableArray *</td>
 * 			<td>An array of strings to be used as VR synonyms for this choice. If this array is provided, it must have at least one non-empty element</td>
 * 			<td>AppLink 1.0</td>
 * 		</tr>
 *     <tr>
 * 			<td>image</td>
 * 			<td>FMCImage * </td>
 * 			<td>Either a static hex icon value or a binary image file  name identifier (sent by PutFile).</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * </table>
 *
 * Since <b>AppLink 1.0</b><br>
 */
@interface FMCChoice : FMCRPCStruct {}

/**
 * Constructs a newly allocated FMCChoice object
 */
-(id) init;
/**
 * Constructs a newly allocated FMCChoice object indicated by the NSMutableDictionary parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract the application-scoped identifier that uniquely identifies this choice
 * @discussion <b>Note:</b>Min: 0  Max: 65535
 */
@property(assign) NSNumber* choiceID;
/**
 * @abstract Text which appears in menu, representing this choice
 *				<br/>Min: 1
 *				<br/>Max: 100
 * @discussion
 */
@property(assign) NSString* menuName;
/**
 * @abstract an array of strings to be used as VR synonyms for this choice
 * @discussion if this array is provided, it must have at least one non-empty element
 */
@property(assign) NSMutableArray* vrCommands;
/**
 * @abstract the image of the choice
 * @discussion
 */
@property(assign) FMCImage* image;

@end
