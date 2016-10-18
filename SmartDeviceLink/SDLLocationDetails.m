//
//  SDLRPCLocationDetails.m
//

#import "SDLLocationDetails.h"
#import "SDLNames.h"
#import "SDLCoordinate.h"
#import "SDLImage.h"
#import "SDLOasisAddress.h"

@implementation SDLLocationDetails

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

- (instancetype)initWithDictionary:(NSMutableDictionary *)dict {
    if (self = [super initWithDictionary:dict]) {
    }
    return self;
}

- (void)setCoordinate:(SDLCoordinate *)coordinate {
    if (coordinate != nil) {
        [store setObject:coordinate forKey:SDLNameLocationCoordinate];
    } else {
        [store removeObjectForKey:SDLNameLocationCoordinate];
    }
}

- (SDLCoordinate *)coordinate {
    return [store objectForKey:SDLNameLocationCoordinate];
}

- (void)setLocationName:(NSString *)locationName {
    if (locationName != nil) {
        [store setObject:locationName forKey:SDLNameLocationName];
    } else {
        [store removeObjectForKey:SDLNameLocationName];
    }
}

- (NSString *)locationName {
    return [store objectForKey:SDLNameLocationName];
}

- (void)setAddressLines:(NSMutableArray *)addressLines {
    if (addressLines != nil) {
        [store setObject:addressLines forKey:SDLNameAddressLines];
    } else {
        [store removeObjectForKey:SDLNameAddressLines];
    }
}

- (NSMutableArray *)addressLines {
    return [store objectForKey:SDLNameAddressLines];
}

- (void)setLocationDescription:(NSString *)locationDescription {
    if (locationDescription != nil) {
        [store setObject:locationDescription forKey:SDLNameLocationDescription];
    } else {
        [store removeObjectForKey:SDLNameLocationDescription];
    }
}

- (NSString *)locationDescription {
    return [store objectForKey:SDLNameLocationDescription];
}

- (void)setPhoneNumber:(NSString *)phoneNumber {
    if (phoneNumber != nil) {
        [store setObject:phoneNumber forKey:SDLNamePhoneNumber];
    } else {
        [store removeObjectForKey:SDLNamePhoneNumber];
    }
}

- (NSString *)phoneNumber {
    return [store objectForKey:SDLNamePhoneNumber];
}

- (void)setLocationImage:(SDLImage *)locationImage {
    if (locationImage != nil) {
        [store setObject:locationImage forKey:SDLNameLocationImage];
    } else {
        [store removeObjectForKey:SDLNameLocationImage];
    }
}

- (SDLImage *)locationImage {
    return [store objectForKey:SDLNameLocationImage];
}

- (void)setSearchAddress:(SDLOasisAddress *)searchAddress {
    if (searchAddress != nil) {
        [store setObject:searchAddress forKey:SDLNameSearchAddress];
    } else {
        [store removeObjectForKey:SDLNameSearchAddress];
    }
}

- (SDLOasisAddress *)searchAddress {
    return [store objectForKey:SDLNameSearchAddress];
}
@end
