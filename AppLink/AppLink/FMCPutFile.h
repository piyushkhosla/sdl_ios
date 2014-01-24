//  FMCPutFile.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/FMCFileType.h>

/**
 * @abstract Used to push a binary data onto the SYNC module from a mobile device, such as
 * icons and album art
 * <p>
 *
 * Since AppLink 2.0<br/>
 * See DeleteFile ListFiles
 */
@interface FMCPutFile : FMCRPCRequest {}

/**
 * @abstract Constructs a new FMCPutFile object
 */
-(id) init;
/**
 * @abstract Constructs a new FMCPutFile object indicated by the NSMutableDictionary parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract A file reference name
 *            <br/><b>Notes: </b>Maxlength=500
 */
@property(assign) NSString* syncFileName;
/**
 * @abstract A FileType value representing a selected file type
 */
@property(assign) FMCFileType* fileType;
/**
 * @abstract A value to indicates if the file is meant to persist between
 * sessions / ignition cycles. If set to TRUE, then the system will aim to
 * persist this file through session / cycles. While files with this
 * designation will have priority over others, they are subject to deletion
 * by the system at any time. In the event of automatic deletion by the
 * system, the app will receive a rejection and have to resend the file. If
 * omitted, the value will be set to false
 */
@property(assign) NSNumber* persistentFile;

@end
