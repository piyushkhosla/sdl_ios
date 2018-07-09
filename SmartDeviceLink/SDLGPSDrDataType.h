//
//  SDLGPSDrDataType.h
//

#import "SDLRPCStruct.h"
@class SDLGPSDrData;
@class SDLTimeStampType;

@interface SDLGPSDrDataType : SDLRPCStruct

/**
 * @abstract Constructs a new SDLGPSDataType object
 */
- (instancetype)init;

/**
 * @abstract Constructs a new SDLGPSDataType object indicated by the NSMutableDictionary
 * parameter
 * @param dict The dictionary to use
 */
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

/**
 * @abstract Value of type "SDLGPSDrData".
 */
@property (strong, nonatomic) SDLGPSDrData *value;

/**
 *  @abstract
 *      Timestamp in which the SDLGPSDrData value was recorded.
 */
@property (strong, nonatomic) SDLTimeStampType *timeStamp;


@end

