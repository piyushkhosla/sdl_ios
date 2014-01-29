//  FMCGetDTCs.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

/**
 * This RPC allows to request diagnostic module trouble codes from a certain
 * vehicle module
 * <p>
 * Function Group: ProprietaryData
 * <p>
 * <b>HMILevel needs to be FULL, LIMITED or BACKGROUND</b>
 * <p>
 */
@interface FMCGetDTCs : FMCRPCRequest {}

/**
 * Constructs a new FMCGetDTCs object
 */
-(id) init;
/**
 * Constructs a new FMCGetDTCs object indicated by the NSMutableDictionary parameter
 * <p>
 *
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract a name of the module to receive the DTC form
 * @discussion an NSNumber value representing a name of the module to receive
 *            the DTC form
 *            <p>
 *            <b>Notes: </b>Minvalue:0; Maxvalue:65535
 */
@property(assign) NSNumber* ecuName;


/**
 * DTC Mask Byte to be sent in diagnostic request to module.
 * @param NSNumber* dtcMask Minvalue:0; Maxvalue:255
 */
@property(assign) NSNumber* dtcMask;

@end