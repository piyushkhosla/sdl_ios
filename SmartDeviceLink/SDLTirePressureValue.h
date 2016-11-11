//
//  SDLTirePressureValue.h
//

#import "SDLRPCMessage.h"

/**
 * The value of tire pressure.
 */
@interface SDLTirePressureValue : SDLRPCStruct {
}

/**
 * @abstract Constructs a newly allocated SDLTirePressureValue object
 */
- (instancetype)init;

/**
 * @abstract Constructs a newly allocated SDLTirePressureValue object indicated by the dictionary parameter
 *
 * @param dict The dictionary to use to construct the object
 */
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

/**
 * @abstract The pressure value of left front tire in kilo pascal.
 *
 */
@property (strong) NSNumber *leftFront;

/**
 * @abstract The pressure value of right front tire in kilo pascal.
 *
 */
@property (strong) NSNumber *rightFront;

/**
 * @abstract The pressure value of left rear tire/outer left rear tire on dual tire vehicles in kilo pascal.
 *
 */
@property (strong) NSNumber *leftRear;

/**
 * @abstract The pressure value of right rear tire/outer left rear tire on dual tire vehicles in kilo pascal.
 *
 */
@property (strong) NSNumber *rightRear;

/**
 * @abstract The pressure value of the inner left rear on dual tire vehicles in kilo pascal.
 *
 */
@property (strong) NSNumber *innerLeftRear;

/**
 * @abstract The pressure value of the inner right rear on dual tire vehicles in kilo pascal.
 *
 */
@property (strong) NSNumber *innerRightRear;

/**
 * @abstract The manufacturer recommended pressure value of the front tires in kilo pascal.
 *
 */
@property (strong) NSNumber *frontRecommended;

/**
 * @abstract The manufacturer recommended pressure value of the rear tires in kilo pascal.
 *
 */
@property (strong) NSNumber *rearRecommended;



@end
