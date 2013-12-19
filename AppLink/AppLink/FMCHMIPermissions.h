//  FMCHMIPermissions.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

/**
 * Defining sets of HMI levels, which are permitted or prohibited for a given RPC.
 * <p><b>Parameter List </b>
 * <table border="1" rules="all">
 * 		<tr>
 * 			<th>Name</th>
 * 			<th>Type</th>
 * 			<th>Description</th>
 * 			<th>AppLink Ver. Available</th>
 * 		</tr>
 * 		<tr>
 * 			<td>allowed</td>
 * 			<td>NSMutableArray* </td>
 * 			<td>A set of all HMI levels that are permitted for this given RPC.
 * 					<ul>
 *					<li>Min: 0</li>
 *					<li>Max: 100</li>
 *					</ul>
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 * 		<tr>
 * 			<td>userDisallowed</td>
 * 			<td>NSMutableArray* </td>
 * 			<td>A set of all HMI levels that are prohibated for this given RPC.
 * 					<ul>
 *					<li>Min: 0</li>
 *					<li>Max: 100</li>
 *					</ul>
 * 			</td>
 * 			<td>AppLink 2.0</td>
 * 		</tr>
 *  </table>
 * Since <b>AppLink 2.0</b>
 */
@interface FMCHMIPermissions : FMCRPCStruct {}

/**
 * Constructs a newly allocated FMCHMIPermissions object
 */
-(id) init;
/**
 * Constructs a newly allocated FMCHMIPermissions object indicated by the NSMutableDictionary parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract a set of all HMI levels that are permitted for this given RPC
 * @discussion
 */
@property(assign) NSMutableArray* allowed;
/**
 * @abstract a set of all HMI levels that are prohibited for this given RPC
 * @discussion
 */
@property(assign) NSMutableArray* userDisallowed;

@end
