//  FMCListFiles.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

/**
 * Requests the current list of resident filenames for the registered app. Not
 * supported on First generation SYNC vehicles
 * <p>
 *
 * Since <b>AppLink 2.0</b>
 */
@interface FMCListFiles : FMCRPCRequest {}

/**
 * Constructs a new FMCListFiles object
 */
-(id) init;
/**
 * Constructs a new FMCListFiles object indicated by the NSMutableDictionary parameter
 * <p>
 *
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
