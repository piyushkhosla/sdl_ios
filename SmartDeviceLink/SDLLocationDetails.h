//
//  SDLRPCLocationDetails.h
//

#import "SDLRPCStruct.h"
@class SDLCoordinate;
@class SDLImage;
@class SDLOasisAddress;


@interface SDLLocationDetails : SDLRPCStruct

/**
 * Constructs a newly allocated SDLRPCLocationDetails object
 */
- (instancetype)init;

/**
 * Constructs a newly allocated SDLRPCLocationDetails object indicated by the dictionary parameter
 * @param dict The dictionary to use
 */
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

/**
 * @abstract Latitude/Longitude of the location
 *
 * Optional, SDLCoordinate object
 */
@property (strong) SDLCoordinate *coordinate;

/**
 * @abstract Name of location.
 *
 * Optional, Max String length 500 chars
 */
@property (strong) NSString *locationName;

/**
 * @abstract Location address for display purposes only.
 *
 * Optional, Mutable Array
 */
@property (strong) NSMutableArray *addressLines;

/**
 * @abstract Description intended location / establishment.
 *
 * Optional, Max String length 500 chars
 */
@property (strong) NSString *locationDescription;

/**
 * @abstract Phone number of location / establishment.
 *
 * Optional, Max String length 500 chars
 */
@property (strong) NSString *phoneNumber;

/**
 * @abstract Image / icon of intended location.
 *
 * Optional, SDLImage object
 */
@property (strong) SDLImage *locationImage;

/**
 * @abstract Address to be used by navigation engines for search.
 *
 * Optional, SDLOASISAddress object
 */
@property (strong) SDLOasisAddress *searchAddress;


@end
