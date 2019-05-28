//
//  SDLWindowCapability.m
//

#import "SDLWindowCapability.h"
#import "SDLTextField.h"
#import "SDLImageField.h"
#import "SDLButtonCapabilities.h"
#import "SDLSoftButtonCapabilities.h"

#import "NSMutableDictionary+Store.h"
#import "SDLRPCParameterNames.h"
#import "SDLRPCFunctionNames.h"
#import "SDLTemplateColorScheme.h"

@implementation SDLWindowCapability

- (instancetype)initWithID:(UInt32)windowID textFields:(nullable NSArray<SDLTextField *> *)textFields imageFields:(nullable NSArray<SDLImageField *> *)imageFields imageTypeSupported:(nullable NSArray<SDLImageType> *)imageTypeSupported templatesAvailable:(nullable NSArray<NSString *> *)templatesAvailable numCustomPresetsAvailable:(nullable NSArray<SDLInt> *)numCustomPresetsAvailable buttonCapabilities:(nullable NSArray<SDLButtonCapabilities *> *)buttonCapabilities softButtonCapabilities:(nullable NSArray<SDLSoftButtonCapabilities *> *)softButtonCapabilities {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.windowID = @(windowID);
    self.textFields = textFields;
    self.imageFields = imageFields;
    self.imageTypeSupported = imageTypeSupported;
    self.templatesAvailable = templatesAvailable;
    self.numCustomPresetsAvailable = numCustomPresetsAvailable;
    self.buttonCapabilities = buttonCapabilities;
    self.softButtonCapabilities = softButtonCapabilities;
        
    return self;
}

- (void)setWindowID:(nullable NSNumber<SDLInt> *)windowID {
    [self.store sdl_setObject:windowID forName:SDLRPCParameterNameWindowID];
}

- (nullable NSNumber<SDLInt> *)windowID {
    return [self.store sdl_objectForName:SDLRPCParameterNameWindowID ofClass:NSNumber.class error:nil];
}

- (void)setTextFields:(nullable NSArray<SDLTextField *> *)textFields {
    [self.store sdl_setObject:textFields forName:SDLRPCParameterNameTextFields];
}

- (nullable NSArray<SDLTextField *> *)textFields {
    return [self.store sdl_objectsForName:SDLRPCParameterNameTextFields ofClass:SDLTextField.class error:nil];
}

- (void)setImageFields:(nullable NSArray<SDLImageField *> *)imageFields {
    [self.store sdl_setObject:imageFields forName:SDLRPCParameterNameImageFields];
}

- (nullable NSArray<SDLImageField *> *)imageFields {
    return [self.store sdl_objectsForName:SDLRPCParameterNameImageFields ofClass:SDLImageField.class error:nil];
}

- (void)setImageTypeSupported:(nullable NSArray<SDLImageType> *)imageTypeSupported {
    [self.store sdl_setObject:imageTypeSupported forName:SDLRPCParameterNameImageTypeSupported];
}

- (nullable NSArray<SDLImageType> *)imageTypeSupported {
    return [self.store sdl_enumsForName:SDLRPCParameterNameImageTypeSupported error:nil];
}

- (void)setTemplatesAvailable:(nullable NSArray<NSString *> *)templatesAvailable {
    [self.store sdl_setObject:templatesAvailable forName:SDLRPCParameterNameTemplatesAvailable];
}

- (nullable NSArray<NSString *> *)templatesAvailable {
    return [self.store sdl_objectsForName:SDLRPCParameterNameTemplatesAvailable ofClass:NSString.class error:nil];
}

- (void)setNumCustomPresetsAvailable:(nullable NSArray<NSNumber<SDLInt> *> *)numCustomPresetsAvailable {
    [self.store sdl_setObject:numCustomPresetsAvailable forName:SDLRPCParameterNameNumCustomPresetsAvailable];
}

- (nullable NSArray<NSNumber<SDLInt> *> *)numCustomPresetsAvailable {
    return [self.store sdl_objectsForName:SDLRPCParameterNameNumCustomPresetsAvailable ofClass:NSNumber.class error:nil];
}

- (void)setButtonCapabilities:(nullable NSArray<SDLButtonCapabilities *> *)buttonCapabilities {
    [self.store sdl_setObject:buttonCapabilities forName:SDLRPCParameterNameButtonCapabilities];
}

- (nullable NSArray<SDLButtonCapabilities *> *)buttonCapabilities {
    return [self.store sdl_objectsForName:SDLRPCParameterNameButtonCapabilities ofClass:SDLButtonCapabilities.class error:nil];
}

- (void)setSoftButtonCapabilities:(nullable NSArray<SDLSoftButtonCapabilities *> *)softButtonCapabilities {
    [self.store sdl_setObject:softButtonCapabilities forName:SDLRPCParameterNameSoftButtonCapabilities];
}

- (nullable NSArray<SDLSoftButtonCapabilities *> *)softButtonCapabilities {
    return [self.store sdl_objectsForName:SDLRPCParameterNameSoftButtonCapabilities ofClass:SDLSoftButtonCapabilities.class error:nil];
}


@end
