//  FMCDeleteFile.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

/**
 * Used to delete a file resident on the SYNC module in the app's local cache.
 * Not supported on first generation SYNC vehicles
 * <p>
 *
 * Since <b>AppLink 2.0</b><br>
 * see FMCPutFile FMCListFiles
 */
@interface FMCDeleteFile : FMCRPCRequest {}

/**
 * Constructs a new FMCDeleteFile object
 */
-(id) init;
/**
 * Constructs a new FMCDeleteFile object indicated by the NSMutableDictionary parameter
 * <p>
 *
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract a file reference name
 * @discussion a String value representing a file reference name
 */
@property(assign) NSString* syncFileName;

@end
