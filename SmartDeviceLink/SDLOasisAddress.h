//
//  SDLOasisAddress.h
//

#import "SDLRPCMessage.h"

@interface SDLOasisAddress : SDLRPCStruct {
}

/**
 * Constructs a newly allocated SDLOasisAddress object
 */
- (instancetype)init;

/**
 * Constructs a newly allocated SDLOasisAddress object indicated by the dictionary parameter
 * @param dict The dictionary to use
 */
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

/**
 * @abstract Name of the country (localized)
 *
 * Required, max length = 50
 */
@property (strong) NSString *countryName;

/**
 * @abstract countryCode of the country(ISO 3166-2)
 *
 * Required, max length = 50
 */
@property (strong) NSString *countryCode;

/**
 * @abstract postalCode of location (PLZ, ZIP, PIN, CAP etc.)
 *
 * Required, max length = 16
 */
@property (strong) NSString *postalCode;

/**
 * @abstract Portion of country (e.g. state)
 *
 * Required, max length = 200
 */
@property (strong) NSString *administrativeArea;

/**
 * @abstract Portion of e.g. state (e.g. county)
 *
 * Required, max length = 200
 */
@property (strong) NSString *subAdministrativeArea;

/**
 * @abstract Hypernym for e.g. city/village
 *
 * Required, max length = 200
 */
@property (strong) NSString *locality;

/**
 * @abstract Hypernym for e.g. district
 *
 * Required, max length = 200
 */
@property (strong) NSString *subLocality;

/**
 * @abstract Hypernym for street, road etc.
 *
 * Required, max length = 200
 */
@property (strong) NSString *thoroughfare;

/**
 * @abstract Portion of thoroughfare e.g. house number
 *
 * Required, max length = 200
 */
@property (strong) NSString *subThoroughfare;

@end
