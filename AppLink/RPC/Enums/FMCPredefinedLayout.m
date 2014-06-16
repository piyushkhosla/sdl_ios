//  FMCPredefinedLayout.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Enums/FMCPredefinedLayout.h>

FMCPredefinedLayout* FMCPredefinedLayout_DEFAULT = nil;
FMCPredefinedLayout* FMCPredefinedLayout_MEDIA = nil;
FMCPredefinedLayout* FMCPredefinedLayout_NON_MEDIA = nil;
FMCPredefinedLayout* FMCPredefinedLayout_ONSCREEN_PRESETS = nil;
FMCPredefinedLayout* FMCPredefinedLayout_NAV_FULLSCREEN_MAP = nil;
FMCPredefinedLayout* FMCPredefinedLayout_NAV_LIST = nil;
FMCPredefinedLayout* FMCPredefinedLayout_NAV_KEYBOARD = nil;
FMCPredefinedLayout* FMCPredefinedLayout_GRAPHIC_WITH_TEXT = nil;
FMCPredefinedLayout* FMCPredefinedLayout_TEXT_WITH_GRAPHIC = nil;
FMCPredefinedLayout* FMCPredefinedLayout_TILES_ONLY = nil;
FMCPredefinedLayout* FMCPredefinedLayout_TEXTBUTTONS_ONLY = nil;
FMCPredefinedLayout* FMCPredefinedLayout_GRAPHIC_WITH_TILES = nil;
FMCPredefinedLayout* FMCPredefinedLayout_TILES_WITH_GRAPHIC = nil;
FMCPredefinedLayout* FMCPredefinedLayout_GRAPHIC_WITH_TEXT_AND_SOFTBUTTONS = nil;
FMCPredefinedLayout* FMCPredefinedLayout_TEXT_AND_SOFTBUTTONS_WITH_GRAPHIC = nil;
FMCPredefinedLayout* FMCPredefinedLayout_GRAPHIC_WITH_TEXTBUTTONS = nil;
FMCPredefinedLayout* FMCPredefinedLayout_TEXTBUTTONS_WITH_GRAPHIC = nil;
FMCPredefinedLayout* FMCPredefinedLayout_LARGE_GRAPHIC_WITH_SOFTBUTTONS = nil;
FMCPredefinedLayout* FMCPredefinedLayout_DOUBLE_GRAPHIC_WITH_SOFTBUTTONS = nil;
FMCPredefinedLayout* FMCPredefinedLayout_LARGE_GRAPHIC_ONLY = nil;

NSMutableArray* FMCPredefinedLayout_values = nil;

@implementation FMCPredefinedLayout

+(FMCPredefinedLayout*) valueOf:(NSString*) value {
    for (FMCPredefinedLayout* item in FMCPredefinedLayout.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCPredefinedLayout_values == nil) {
        FMCPredefinedLayout_values = [[NSMutableArray alloc] initWithObjects:
                FMCPredefinedLayout.DEFAULT,
                FMCPredefinedLayout.MEDIA,
                FMCPredefinedLayout.NON_MEDIA,
                FMCPredefinedLayout.ONSCREEN_PRESETS,
                FMCPredefinedLayout.NAV_FULLSCREEN_MAP,
                FMCPredefinedLayout.NAV_LIST,
                FMCPredefinedLayout.NAV_KEYBOARD,
                FMCPredefinedLayout.GRAPHIC_WITH_TEXT,
                FMCPredefinedLayout.TEXT_WITH_GRAPHIC,
                FMCPredefinedLayout.TILES_ONLY,
                FMCPredefinedLayout.TEXTBUTTONS_ONLY,
                FMCPredefinedLayout.GRAPHIC_WITH_TILES,
                FMCPredefinedLayout.TILES_WITH_GRAPHIC,
                FMCPredefinedLayout.GRAPHIC_WITH_TEXT_AND_SOFTBUTTONS,
                FMCPredefinedLayout.TEXT_AND_SOFTBUTTONS_WITH_GRAPHIC,
                FMCPredefinedLayout.GRAPHIC_WITH_TEXTBUTTONS,
                FMCPredefinedLayout.TEXTBUTTONS_WITH_GRAPHIC,
                FMCPredefinedLayout.LARGE_GRAPHIC_WITH_SOFTBUTTONS,
                FMCPredefinedLayout.DOUBLE_GRAPHIC_WITH_SOFTBUTTONS,
                FMCPredefinedLayout.LARGE_GRAPHIC_ONLY,
                nil];
    }
    return FMCPredefinedLayout_values;
}

+(FMCPredefinedLayout*) DEFAULT {
    if (FMCPredefinedLayout_DEFAULT == nil) {
        FMCPredefinedLayout_DEFAULT = [[FMCPredefinedLayout alloc] initWithValue:@"DEFAULT"];
    }
    return FMCPredefinedLayout_DEFAULT;
}

+(FMCPredefinedLayout*) MEDIA {
    if (FMCPredefinedLayout_MEDIA == nil) {
        FMCPredefinedLayout_MEDIA = [[FMCPredefinedLayout alloc] initWithValue:@"MEDIA"];
    }
    return FMCPredefinedLayout_MEDIA;
}

+(FMCPredefinedLayout*) NON_MEDIA {
    if (FMCPredefinedLayout_NON_MEDIA == nil) {
        FMCPredefinedLayout_NON_MEDIA = [[FMCPredefinedLayout alloc] initWithValue:@"NON-MEDIA"];
    }
    return FMCPredefinedLayout_NON_MEDIA;
}

+(FMCPredefinedLayout*) ONSCREEN_PRESETS {
    if (FMCPredefinedLayout_ONSCREEN_PRESETS == nil) {
        FMCPredefinedLayout_ONSCREEN_PRESETS = [[FMCPredefinedLayout alloc] initWithValue:@"ONSCREEN_PRESETS"];
    }
    return FMCPredefinedLayout_ONSCREEN_PRESETS;
}

+(FMCPredefinedLayout*) NAV_FULLSCREEN_MAP {
    if (FMCPredefinedLayout_NAV_FULLSCREEN_MAP == nil) {
        FMCPredefinedLayout_NAV_FULLSCREEN_MAP = [[FMCPredefinedLayout alloc] initWithValue:@"NAV_FULLSCREEN_MAP"];
    }
    return FMCPredefinedLayout_NAV_FULLSCREEN_MAP;
}

+(FMCPredefinedLayout*) NAV_LIST {
    if (FMCPredefinedLayout_NAV_LIST == nil) {
        FMCPredefinedLayout_NAV_LIST = [[FMCPredefinedLayout alloc] initWithValue:@"NAV_LIST"];
    }
    return FMCPredefinedLayout_NAV_LIST;
}

+(FMCPredefinedLayout*) NAV_KEYBOARD {
    if (FMCPredefinedLayout_NAV_KEYBOARD == nil) {
        FMCPredefinedLayout_NAV_KEYBOARD = [[FMCPredefinedLayout alloc] initWithValue:@"NAV_KEYBOARD"];
    }
    return FMCPredefinedLayout_NAV_KEYBOARD;
}

+(FMCPredefinedLayout*) GRAPHIC_WITH_TEXT {
    if (FMCPredefinedLayout_GRAPHIC_WITH_TEXT == nil) {
        FMCPredefinedLayout_GRAPHIC_WITH_TEXT = [[FMCPredefinedLayout alloc] initWithValue:@"GRAPHIC_WITH_TEXT"];
    }
    return FMCPredefinedLayout_GRAPHIC_WITH_TEXT;
}

+(FMCPredefinedLayout*) TEXT_WITH_GRAPHIC {
    if (FMCPredefinedLayout_TEXT_WITH_GRAPHIC == nil) {
        FMCPredefinedLayout_TEXT_WITH_GRAPHIC = [[FMCPredefinedLayout alloc] initWithValue:@"TEXT_WITH_GRAPHIC"];
    }
    return FMCPredefinedLayout_TEXT_WITH_GRAPHIC;
}

+(FMCPredefinedLayout*) TILES_ONLY {
    if (FMCPredefinedLayout_TILES_ONLY == nil) {
        FMCPredefinedLayout_TILES_ONLY = [[FMCPredefinedLayout alloc] initWithValue:@"TILES_ONLY"];
    }
    return FMCPredefinedLayout_TILES_ONLY;
}

+(FMCPredefinedLayout*) TEXTBUTTONS_ONLY {
    if (FMCPredefinedLayout_TEXTBUTTONS_ONLY == nil) {
        FMCPredefinedLayout_TEXTBUTTONS_ONLY = [[FMCPredefinedLayout alloc] initWithValue:@"TEXTBUTTONS_ONLY"];
    }
    return FMCPredefinedLayout_TEXTBUTTONS_ONLY;
}

+(FMCPredefinedLayout*) GRAPHIC_WITH_TILES {
    if (FMCPredefinedLayout_GRAPHIC_WITH_TILES == nil) {
        FMCPredefinedLayout_GRAPHIC_WITH_TILES = [[FMCPredefinedLayout alloc] initWithValue:@"GRAPHIC_WITH_TILES"];
    }
    return FMCPredefinedLayout_GRAPHIC_WITH_TILES;
}

+(FMCPredefinedLayout*) TILES_WITH_GRAPHIC {
    if (FMCPredefinedLayout_TILES_WITH_GRAPHIC == nil) {
        FMCPredefinedLayout_TILES_WITH_GRAPHIC = [[FMCPredefinedLayout alloc] initWithValue:@"TILES_WITH_GRAPHIC"];
    }
    return FMCPredefinedLayout_TILES_WITH_GRAPHIC;
}

+(FMCPredefinedLayout*) GRAPHIC_WITH_TEXT_AND_SOFTBUTTONS {
    if (FMCPredefinedLayout_GRAPHIC_WITH_TEXT_AND_SOFTBUTTONS == nil) {
        FMCPredefinedLayout_GRAPHIC_WITH_TEXT_AND_SOFTBUTTONS = [[FMCPredefinedLayout alloc] initWithValue:@"GRAPHIC_WITH_TEXT_AND_SOFTBUTTONS"];
    }
    return FMCPredefinedLayout_GRAPHIC_WITH_TEXT_AND_SOFTBUTTONS;
}

+(FMCPredefinedLayout*) TEXT_AND_SOFTBUTTONS_WITH_GRAPHIC {
    if (FMCPredefinedLayout_TEXT_AND_SOFTBUTTONS_WITH_GRAPHIC == nil) {
        FMCPredefinedLayout_TEXT_AND_SOFTBUTTONS_WITH_GRAPHIC = [[FMCPredefinedLayout alloc] initWithValue:@"TEXT_AND_SOFTBUTTONS_WITH_GRAPHIC"];
    }
    return FMCPredefinedLayout_TEXT_AND_SOFTBUTTONS_WITH_GRAPHIC;
}

+(FMCPredefinedLayout*) GRAPHIC_WITH_TEXTBUTTONS {
    if (FMCPredefinedLayout_GRAPHIC_WITH_TEXTBUTTONS == nil) {
        FMCPredefinedLayout_GRAPHIC_WITH_TEXTBUTTONS = [[FMCPredefinedLayout alloc] initWithValue:@"GRAPHIC_WITH_TEXTBUTTONS"];
    }
    return FMCPredefinedLayout_GRAPHIC_WITH_TEXTBUTTONS;
}

+(FMCPredefinedLayout*) TEXTBUTTONS_WITH_GRAPHIC {
    if (FMCPredefinedLayout_TEXTBUTTONS_WITH_GRAPHIC == nil) {
        FMCPredefinedLayout_TEXTBUTTONS_WITH_GRAPHIC = [[FMCPredefinedLayout alloc] initWithValue:@"TEXTBUTTONS_WITH_GRAPHIC"];
    }
    return FMCPredefinedLayout_TEXTBUTTONS_WITH_GRAPHIC;
}

+(FMCPredefinedLayout*) LARGE_GRAPHIC_WITH_SOFTBUTTONS {
    if (FMCPredefinedLayout_LARGE_GRAPHIC_WITH_SOFTBUTTONS == nil) {
        FMCPredefinedLayout_LARGE_GRAPHIC_WITH_SOFTBUTTONS = [[FMCPredefinedLayout alloc] initWithValue:@"LARGE_GRAPHIC_WITH_SOFTBUTTONS"];
    }
    return FMCPredefinedLayout_LARGE_GRAPHIC_WITH_SOFTBUTTONS;
}

+(FMCPredefinedLayout*) DOUBLE_GRAPHIC_WITH_SOFTBUTTONS {
    if (FMCPredefinedLayout_DOUBLE_GRAPHIC_WITH_SOFTBUTTONS == nil) {
        FMCPredefinedLayout_DOUBLE_GRAPHIC_WITH_SOFTBUTTONS = [[FMCPredefinedLayout alloc] initWithValue:@"DOUBLE_GRAPHIC_WITH_SOFTBUTTONS"];
    }
    return FMCPredefinedLayout_DOUBLE_GRAPHIC_WITH_SOFTBUTTONS;
}

+(FMCPredefinedLayout*) LARGE_GRAPHIC_ONLY {
    if (FMCPredefinedLayout_LARGE_GRAPHIC_ONLY == nil) {
        FMCPredefinedLayout_LARGE_GRAPHIC_ONLY = [[FMCPredefinedLayout alloc] initWithValue:@"LARGE_GRAPHIC_ONLY"];
    }
    return FMCPredefinedLayout_LARGE_GRAPHIC_ONLY;
}

@end
