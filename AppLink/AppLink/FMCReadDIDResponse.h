//  FMCReadDIDResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

#import <AppLink/FMCDIDResult.h>

/**
 * Read DID Response is sent, when ReadDID has been called
 *
 * Since AppLink 2.0
 */
@interface FMCReadDIDResponse : FMCRPCResponse {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCDIDResult* didResult;

@end
