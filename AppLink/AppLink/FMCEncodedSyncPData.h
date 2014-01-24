//  FMCEncodedSyncPData.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

/**
 * Sends base64 encoded SyncP packets to the SYNC module
 * <p>
 * Function Group: Base
 * <p>
 * <b>HMILevel needs to be FULL, LIMITED or BACKGROUND</b>
 * </p>
 *
 * Since <b>AppLink 1.0</b><br>
 * see FMCOnEncodedSyncPData
 */
@interface FMCEncodedSyncPData: FMCRPCRequest {}

/**
 * Constructs a new FMCEncodedSyncPData object
 */
-(id) init;
/**
 * Constructs a new FMCEncodedSyncPData object indicated by the NSMutableDictionary
 * parameter
 * <p>
 *
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract an array of 1-100 elements, each element containing a base64
 * encoded SyncP packet
 * @discussion b>Notes: </b>The maximum length of each array element is
 *            10000 characters
 */
@property(assign) NSMutableArray* data;

@end