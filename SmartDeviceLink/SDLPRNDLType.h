//  SDLPRNDLType.h
//

#import <SmartDeviceLink/SmartDeviceLink.h>
#import "SDLPRNDL.h"
@class SDLTimeStampType;

@interface SDLPRNDLType : SDLRPCStruct

/**
 * @abstract Constructs a new SDLPRNDLType object
 */
- (instancetype)init;

/**
 * @abstract Constructs a new SDLPRNDLType object indicated by the NSMutableDictionary
 * parameter
 * @param dict The dictionary to use
 */
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

/**
 * @abstract Value of type "PRNDL".
 */
@property (strong, nonatomic) SDLPRNDL value;

/**
 *  @abstract
 *      Timestamp in which the PRNDL value was recorded.
 */
@property (strong, nonatomic) SDLTimeStampType *timeStamp;

@end

