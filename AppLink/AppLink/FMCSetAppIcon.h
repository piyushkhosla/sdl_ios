//  FMCSetAppIcon.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

/**
 * Used to set existing local file on SYNC as the app's icon. Not supported on
 * first generation SYNC vehicles
 * <p>
 *
 * Since AppLink 2.0
 */
@interface FMCSetAppIcon : FMCRPCRequest {}

/**
 * @abstract Constructs a new FMCSetAppIcon object
 */
-(id) init;
/**
 * @abstract Constructs a new FMCSetAppIcon object indicated by the NSMutableDictionary parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract A file reference name
 * @discussion A String value representing a file reference name
 *            <p>
 *            <b>Notes: </b>Maxlength=500
 */
@property(assign) NSString* syncFileName;

@end
