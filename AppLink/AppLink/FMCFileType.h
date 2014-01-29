//  FMCFileType.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * Enumeration listing possible file tpyes.
 *
 * This enum is avaliable since <font color=red><b> AppLink 2.0 </b></font>
 */
@interface FMCFileType : FMCEnum {}

/**
 * Convert String to FMCFileType
 * @param value String
 * @return FMCFileType
 */
+(FMCFileType*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCFileType
 @result return an array that store all possible FMCFileType
 */
+(NSMutableArray*) values;

/*!
 @abstract file type : BMP
 @result FMCFileType with value of <font color=gray><i> GRAPHIC_BMP </i></font>
 */
+(FMCFileType*) GRAPHIC_BMP;
/*!
 @abstract file type : JPEG
 @result FMCFileType with value of <font color=gray><i> GRAPHIC_JPEG </i></font>
 */
+(FMCFileType*) GRAPHIC_JPEG;
/*!
 @abstract file type : PNG
 @result FMCFileType with value of <font color=gray><i> GRAPHIC_PNG </i></font>
 */
+(FMCFileType*) GRAPHIC_PNG;
/*!
 @abstract file type : WAVE
 @result FMCFileType with value of <font color=gray><i> AUDIO_WAVE </i></font>
 */
+(FMCFileType*) AUDIO_WAVE;
/*!
 @abstract file type : MP3
 @result FMCFileType with value of <font color=gray><i> AUDIO_MP3 </i></font>
 */
+(FMCFileType*) AUDIO_MP3;
/*!
 @abstract file type : BINARY
 @result FMCFileType with value of <font color=gray><i> BINARY </i></font>
 */
+(FMCFileType*) BINARY;

@end