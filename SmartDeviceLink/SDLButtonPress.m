//
//  SDLButtonPress.m
//

#import "SDLButtonPress.h"
#import "SDLNames.h"
#import "SDLModuleType.h"
#import "SDLButtonName.h"
#import "SDLButtonPressMode.h"

@implementation SDLButtonPress

- (instancetype)init {
    if (self = [super initWithName:NAMES_ButtonPress]) {
    }
    return self;
}

- (instancetype)initWithDictionary:(NSMutableDictionary *)dict {
    if (self = [super initWithDictionary:dict]) {
    }
    return self;
}

- (void)setModuleType:(SDLModuleType *)moduleType {
    if (moduleType != nil) {
        [parameters setObject:moduleType forKey:NAMES_moduleType];
    } else {
        [parameters removeObjectForKey:NAMES_moduleType];
    }
}

- (SDLModuleType *)moduleType {
    return [parameters objectForKey:NAMES_moduleType];
}

- (void)setButtonName:(SDLButtonName *)buttonName {
    if (buttonName != nil) {
        [parameters setObject:buttonName forKey:NAMES_buttonName];
    } else {
        [parameters removeObjectForKey:NAMES_buttonName];
    }
}

- (SDLButtonName *)buttonName {
    return [parameters objectForKey:NAMES_buttonName];
}

- (void)setButtonPressMode:(SDLButtonPressMode *)buttonPressMode {
    if (buttonPressMode != nil) {
        [parameters setObject:buttonPressMode forKey:NAMES_buttonPressMode];
    } else {
        [parameters removeObjectForKey:NAMES_buttonPressMode];
    }
}

- (SDLButtonPressMode *)buttonPressMode {
    return [parameters objectForKey:NAMES_buttonPressMode];
}


@end
