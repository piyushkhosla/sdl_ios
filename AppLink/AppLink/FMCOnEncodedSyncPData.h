//  FMCOnEncodedSyncPData.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCNotification.h>

/**
 * Sends an array of base64 encoded SyncP packets to the application.<br>
 * <b>HMI Status Requirements:</b>
 * <ul>
 * HMILevel:
 * <ul>
 * <li>Can be sent with FULL, LIMITED or BACKGROUND</li>
 * </ul>
 * AudioStreamingState:
 * <ul>
 * <li>Any</li>
 * </ul>
 * SystemContext:
 * <ul>
 * <li>Any</li>
 * </ul>
 * </ul>
 * <b>Parameter List:</b>
 * <table border="1" rules="all">
 * <tr>
 * <th>Name</th>
 * <th>Type</th>
 * <th>Description</th>
 * <th>Req</th>
 * <th>Notes</th>
 * <th>Applink Ver Available</th>
 * </tr>
 * <tr>
 * <td>data</td>
 * <td>NSMutableArray * </td>
 * <td>An array of 1-100 elements, each element containing a base64 encoded SyncP packet.</td>
 * <td></td>
 * <td>The maximum length of each array element is 10000 characters</td>
 * <td>AppLink 1.0</td>
 * </tr>
 * <tr>
 * <td>URL</td>
 * <td>NSString * </td>
 * <td>If blank, the SyncPData will be forwarded to the app. If not blank, the SyncPData will be forwarded to the provided URL.</td>
 * <td>N</td>
 * <td>Maxlength=1000</td>
 * <td>AppLink 2.0</td>
 * </tr>
 * <tr>
 * <td>Timeout</td>
 * <td>NSNumber * </td>
 * <td>If blank, the SyncPData shall be forwarded to the app. If not blank, the SyncPData shall be forwarded with the provided timeout in seconds.</td>
 * <td>N</td>
 * <td>Minvalue=- 2000000000<br>Maxvalue= 2000000000</td>
 * <td>AppLink 2.0</td>
 * </tr>
 * </table>
 *
 * Since <b>AppLink 1.0</b>
 */
@interface FMCOnEncodedSyncPData: FMCRPCNotification {}

/**
 * Constructs a newly allocated FMCOnEncodedSyncPData object
 */
-(id) init;
/**
 * <p>
 * Constructs a newly allocated FMCOnEncodedSyncPData object indicated by the
 * NSMutableDictionary parameter
 * </p>
 *
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract an array of base64 encoded SyncP packets
 * @discussion
 */
@property(assign) NSMutableArray* data;
/**
 * @abstract URL
 * @discussion If blank, the SyncP data will be forwarded to the app.
 If not blank, the SyncP data will be forwarded to the provided URL.
 *
 */
@property(assign) NSString* url;
/**
 * @abstract timeout
 * @discussion
 */
@property(assign) NSNumber* timeout;

@end