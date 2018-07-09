//  SDLWheelSpeedsData.h
//

#import <SmartDeviceLink/SmartDeviceLink.h>

@interface SDLWheelSpeedsData : SDLRPCStruct

/**
 * @abstract Constructs a new SDLWheelSpeedsData object
 */
- (instancetype)init;

/**
 * @abstract Constructs a new SDLWheelSpeedsData object indicated by the NSMutableDictionary
 * parameter
 * @param dict The dictionary to use
 */
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

/**
 * @abstract Front right wheel rotation count.
 * Interger
 */
@property (strong, nonatomic) NSNumber *whlRotatFr_No_Cnt;

/**
 * @abstract Front left wheel rotation count.
 * Interger
 */
@property (strong, nonatomic) NSNumber *whlRotatFl_No_Cnt;

/**
 * @abstract Rear right wheel rotation count.
 * Interger
 */
@property (strong, nonatomic) NSNumber *whlRotatRr_No_Cnt;

/**
 * @abstract Rear left wheel rotation count.
 * Interger
 */
@property (strong, nonatomic) NSNumber *whlRotatRl_No_Cnt;

/**
 * @abstract Front left wheel direction.
 * Interger
 */
@property (strong, nonatomic) NSNumber *whlDirFr_D_Actl;

/**
 * @abstract Front left wheel direction.
 * Interger
 */
@property (strong, nonatomic) NSNumber *whlDirFl_D_Actl;

/**
 * @abstract Rear right wheel direction.
 * Interger
 */
@property (strong, nonatomic) NSNumber *whlDirRr_D_Actl;

/**
 * @abstract Rear left wheel direction.
 * Interger
 */
@property (strong, nonatomic) NSNumber *whlDirRl_D_Actl;
@end

