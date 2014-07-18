//  FMCPredefinedLayout.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCPredefinedLayout : FMCEnum {}

+(FMCPredefinedLayout*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCPredefinedLayout*) DEFAULT;
+(FMCPredefinedLayout*) MEDIA;
+(FMCPredefinedLayout*) NON_MEDIA;
+(FMCPredefinedLayout*) ONSCREEN_PRESETS;
+(FMCPredefinedLayout*) NAV_FULLSCREEN_MAP;
+(FMCPredefinedLayout*) NAV_LIST;
+(FMCPredefinedLayout*) NAV_KEYBOARD;
+(FMCPredefinedLayout*) GRAPHIC_WITH_TEXT;
+(FMCPredefinedLayout*) TEXT_WITH_GRAPHIC;
+(FMCPredefinedLayout*) TILES_ONLY;
+(FMCPredefinedLayout*) TEXTBUTTONS_ONLY;
+(FMCPredefinedLayout*) GRAPHIC_WITH_TILES;
+(FMCPredefinedLayout*) TILES_WITH_GRAPHIC;
+(FMCPredefinedLayout*) GRAPHIC_WITH_TEXT_AND_SOFTBUTTONS;
+(FMCPredefinedLayout*) TEXT_AND_SOFTBUTTONS_WITH_GRAPHIC;
+(FMCPredefinedLayout*) GRAPHIC_WITH_TEXTBUTTONS;
+(FMCPredefinedLayout*) TEXTBUTTONS_WITH_GRAPHIC;
+(FMCPredefinedLayout*) LARGE_GRAPHIC_WITH_SOFTBUTTONS;
+(FMCPredefinedLayout*) DOUBLE_GRAPHIC_WITH_SOFTBUTTONS;
+(FMCPredefinedLayout*) LARGE_GRAPHIC_ONLY;

@end
