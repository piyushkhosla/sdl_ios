//
//  SDLOasisAddress.m
//

#import "SDLOasisAddress.h"
#import "SDLNames.h"

@implementation SDLOasisAddress

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

- (void)setCountryName:(NSString *)countryName {
    if (countryName != nil) {
        [store setObject:countryName forKey:SDLCountryName];
    } else {
        [store removeObjectForKey:SDLCountryName];
    }
}

- (NSString *)countryName {
    return [store objectForKey:SDLCountryName];
}

- (void)setCountryCode:(NSString *)countryCode {
    if (countryCode != nil) {
        [store setObject:countryCode forKey:SDLCountryCode];
    } else {
        [store removeObjectForKey:SDLCountryCode];
    }
}

- (NSString *)countryCode {
    return [store objectForKey:SDLCountryCode];
}

- (void)setPostalCode:(NSString *)postalCode {
    if (postalCode != nil) {
        [store setObject:postalCode forKey:SDLNamePostalCode];
    } else {
        [store removeObjectForKey:SDLNamePostalCode];
    }
}

- (NSString *)postalCode {
    return [store objectForKey:SDLNamePostalCode];
}

- (void)setAdministrativeArea:(NSString *)administrativeArea {
    if (administrativeArea != nil) {
        [store setObject:administrativeArea forKey:SDLNameAdministrativeArea];
    } else {
        [store removeObjectForKey:SDLNameAdministrativeArea];
    }
}

- (NSString *)administrativeArea {
    return [store objectForKey:SDLNameAdministrativeArea];
}

- (void)setSubAdministrativeArea:(NSString *)subAdministrativeArea {
    if (subAdministrativeArea != nil) {
        [store setObject:subAdministrativeArea forKey:SDLNameSubAdministrativeArea];
    } else {
        [store removeObjectForKey:SDLNameSubAdministrativeArea];
    }
}

- (NSString *)subAdministrativeArea {
    return [store objectForKey:SDLNameSubAdministrativeArea];
}

- (void)setLocality:(NSString *)locality {
    if (locality != nil) {
        [store setObject:locality forKey:SDLNameLocality];
    } else {
        [store removeObjectForKey:SDLNameLocality];
    }
}

- (NSString *)locality {
    return [store objectForKey:SDLNameLocality];
}

- (void)setSubLocality:(NSString *)subLocality {
    if (subLocality != nil) {
        [store setObject:subLocality forKey:SDLNameSubLocality];
    } else {
        [store removeObjectForKey:SDLNameSubLocality];
    }
}

- (NSString *)subLocality {
    return [store objectForKey:SDLNameSubLocality];
}

- (void)setThoroughfare:(NSString *)thoroughfare {
    if (thoroughfare != nil) {
        [store setObject:thoroughfare forKey:SDLNameThoroughfare];
    } else {
        [store removeObjectForKey:SDLNameThoroughfare];
    }
}

- (NSString *)thoroughfare {
    return [store objectForKey:SDLNameThoroughfare];
}

- (void)setSubThoroughfare:(NSString *)subThoroughfare {
    if (subThoroughfare != nil) {
        [store setObject:subThoroughfare forKey:SDLNameSubThoroughfare];
    } else {
        [store removeObjectForKey:SDLNameSubThoroughfare];
    }
}

- (NSString *)subThoroughfare {
    return [store objectForKey:SDLNameSubThoroughfare];
}

@end
