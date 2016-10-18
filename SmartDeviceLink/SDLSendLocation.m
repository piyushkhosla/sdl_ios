//
//  SDLSendLocation.m
//  SmartDeviceLink

#import "SDLSendLocation.h"
#import "SDLDeliveryMode.h"
#import "SDLNames.h"
#import "SDLImage.h"
#import "SDLDateTime.h"
#import "SDLOasisAddress.h"

@implementation SDLSendLocation

- (instancetype)init {
    self = [super initWithName:SDLNameSendLocation];
    if (!self) {
        return nil;
    }

    return self;
}

- (void)setLongitudeDegrees:(NSNumber *)longitudeDegrees {
    if (longitudeDegrees != nil) {
        parameters[SDLNameLongitudeDegrees] = longitudeDegrees;
    } else {
        [parameters removeObjectForKey:SDLNameLongitudeDegrees];
    }
}

- (NSNumber *)longitudeDegrees {
    return parameters[SDLNameLongitudeDegrees];
}

- (void)setLatitudeDegrees:(NSNumber *)latitudeDegrees {
    if (latitudeDegrees != nil) {
        parameters[SDLNameLatitudeDegrees] = latitudeDegrees;
    } else {
        [parameters removeObjectForKey:SDLNameLatitudeDegrees];
    }
}

- (NSNumber *)latitudeDegrees {
    return parameters[SDLNameLatitudeDegrees];
}

- (void)setLocationName:(NSString *)locationName {
    if (locationName != nil) {
        parameters[SDLNameLocationName] = locationName;
    } else {
        [parameters removeObjectForKey:SDLNameLocationName];
    }
}

- (NSString *)locationName {
    return parameters[SDLNameLocationName];
}

- (void)setAddressLines:(NSArray<NSString *> *)addressLines {
    if (addressLines != nil) {
        parameters[SDLNameAddressLines] = addressLines;
    } else {
        [parameters removeObjectForKey:SDLNameAddressLines];
    }
}

- (NSString *)locationDescription {
    return parameters[SDLNameLocationDescription];
}

- (void)setLocationDescription:(NSString *)locationDescription {
    if (locationDescription != nil) {
        parameters[SDLNameLocationDescription] = locationDescription;
    } else {
        [parameters removeObjectForKey:SDLNameLocationDescription];
    }
}

- (NSArray<NSString *> *)addressLines {
    return parameters[SDLNameAddressLines];
}

- (void)setPhoneNumber:(NSString *)phoneNumber {
    if (phoneNumber != nil) {
        parameters[SDLNamePhoneNumber] = phoneNumber;
    } else {
        [parameters removeObjectForKey:SDLNamePhoneNumber];
    }
}

- (NSString *)phoneNumber {
    return parameters[SDLNamePhoneNumber];
}

- (void)setLocationImage:(SDLImage *)locationImage {
    if (locationImage != nil) {
        parameters[SDLNameLocationImage] = locationImage;
    } else {
        [parameters removeObjectForKey:SDLNameLocationImage];
    }
}

- (SDLImage *)locationImage {
    id obj = parameters[SDLNameLocationImage];
    if (obj == nil || [obj isKindOfClass:[SDLImage class]]) {
        return (SDLImage *)obj;
    } else {
        return [[SDLImage alloc] initWithDictionary:obj];
    }
}

- (void)setDeliveryMode:(SDLDeliveryMode *)deliveryMode {
    if (deliveryMode != nil) {
        parameters[SDLNameDeliveryMode] = deliveryMode;
    } else {
        [parameters removeObjectForKey:SDLNameDeliveryMode];
    }
}

- (SDLDeliveryMode *)deliveryMode {
    id obj = [parameters objectForKey:SDLNameDeliveryMode];
    if (obj == nil || [obj isKindOfClass:SDLDeliveryMode.class]) {
        return (SDLDeliveryMode *)obj;
    } else {
        return [SDLDeliveryMode valueOf:(NSString *)obj];
    }
}

- (void)setTimeStamp:(SDLDateTime *)timeStamp {
    if (timeStamp != nil) {
        parameters[SDLNameDateTimeStamp] = timeStamp;
    } else {
        [parameters removeObjectForKey:SDLNameDateTimeStamp];
    }
}

- (SDLDateTime *)timeStamp {
    id obj = parameters[SDLNameDateTimeStamp];
    if (obj == nil || [obj isKindOfClass:[SDLDateTime class]]) {
        return (SDLDateTime *)obj;
    } else {
        return [[SDLDateTime alloc] initWithDictionary:obj];
    }
}

- (void)setAddress:(SDLOasisAddress *)address {
    if (address != nil) {
        parameters[SDLNameAddress] = address;
    } else {
        [parameters removeObjectForKey:SDLNameAddress];
    }
}

- (SDLOasisAddress *)address {
    id obj = [parameters objectForKey:SDLNameAddress];
    if (obj == nil || [obj isKindOfClass:[SDLOasisAddress class]]) {
        return (SDLOasisAddress *)obj;
    } else {
        return [[SDLOasisAddress alloc] initWithDictionary:obj];
    }
}
@end
