//
//  SDLTemplateConfiguration.m
//

#import "SDLTemplateConfiguration.h"

#import "NSMutableDictionary+Store.h"
#import "SDLRPCParameterNames.h"
#import "SDLRPCFunctionNames.h"
#import "SDLTemplateColorScheme.h"

@implementation SDLTemplateConfiguration

- (instancetype)initWithTemplate:(NSString *)templateString {
    self = [self init];
    if (!self) {
        return nil;
    }
    
    self.templateString = templateString;
    
    return self;
}

- (instancetype)initWithTemplate:(NSString *)templateString dayColorScheme:(SDLTemplateColorScheme *)dayColorScheme nightColorScheme:(SDLTemplateColorScheme *)nightColorScheme {
    self = [self initWithTemplate:templateString];;
    if (!self) {
        return nil;
    }
    
    self.dayColorScheme = dayColorScheme;
    self.nightColorScheme = nightColorScheme;
    
    return self;
}

- (NSString *)templateString {
    return [self.store sdl_objectForName:SDLRPCParameterNameTemplate ofClass:NSString.class error:nil];
}

- (void)setTemplateString:(NSString *)templateString {
    [self.store sdl_setObject:templateString forName:SDLRPCParameterNameTemplate];
}

- (nullable SDLTemplateColorScheme *)dayColorScheme {
    return [self.store sdl_objectForName:SDLRPCParameterNameDayColorScheme ofClass:SDLTemplateColorScheme.class error:nil];
}

- (void)setDayColorScheme:(nullable SDLTemplateColorScheme *)dayColorScheme {
    [self.store sdl_setObject:dayColorScheme forName:SDLRPCParameterNameDayColorScheme];
}

- (nullable SDLTemplateColorScheme *)nightColorScheme {
    return [self.store sdl_objectForName:SDLRPCParameterNameNightColorScheme ofClass:SDLTemplateColorScheme.class error:nil];
}

- (void)setNightColorScheme:(nullable SDLTemplateColorScheme *)nightColorScheme {
    [self.store sdl_setObject:nightColorScheme forName:SDLRPCParameterNameNightColorScheme];
}


@end
