//
//  FMCImageFieldName.m
//  AppLink
//
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.
//
//

#import <AppLink/FMCImageFieldName.h>

NSMutableArray* FMCImageFieldName_values = nil;
FMCImageFieldName* FMCImageFieldName_softButtonImage = nil;
FMCImageFieldName* FMCImageFieldName_choiceImage = nil;
FMCImageFieldName* FMCImageFieldName_choiceSecondaryImage = nil;
FMCImageFieldName* FMCImageFieldName_vrHelpItem = nil;
FMCImageFieldName* FMCImageFieldName_turnIcon = nil;
FMCImageFieldName* FMCImageFieldName_menuIcon = nil;
FMCImageFieldName* FMCImageFieldName_cmdIcon = nil;
FMCImageFieldName* FMCImageFieldName_appIcon = nil;
FMCImageFieldName* FMCImageFieldName_graphic = nil;

@implementation FMCImageFieldName

+ (FMCImageFieldName*)valueOf:(NSString*)value
{
    for (FMCImageFieldName* item in FMCImageFieldName.values)
    {
        if ([item.value isEqualToString:value])
        {
            return item;
        }
    }

    return nil;
}

+ (NSMutableArray*)values
{
    if (FMCImageFieldName_values == nil)
    {
        FMCImageFieldName_values = [[NSMutableArray alloc] initWithObjects:
                                    FMCImageFieldName_softButtonImage,
                                    FMCImageFieldName_choiceImage,
                                    FMCImageFieldName_choiceSecondaryImage,
                                    FMCImageFieldName_vrHelpItem,
                                    FMCImageFieldName_turnIcon,
                                    FMCImageFieldName_menuIcon,
                                    FMCImageFieldName_cmdIcon,
                                    FMCImageFieldName_appIcon,
                                    FMCImageFieldName_graphic,
                                    nil];
    }

    return FMCImageFieldName_values;
}

+ (FMCImageFieldName*)softButtonImage
{
    if (FMCImageFieldName_softButtonImage == nil)
    {
        FMCImageFieldName_softButtonImage = [[FMCImageFieldName alloc] initWithValue:@"softButtonImage"];
    }

    return FMCImageFieldName_softButtonImage;
}

+ (FMCImageFieldName*)choiceImage
{
    if (FMCImageFieldName_choiceImage == nil)
    {
        FMCImageFieldName_choiceImage = [[FMCImageFieldName alloc] initWithValue:@"choiceImage"];
    }

    return FMCImageFieldName_choiceImage;
}

+ (FMCImageFieldName*)choiceSecondaryImage
{
    if (FMCImageFieldName_choiceSecondaryImage == nil)
    {
        FMCImageFieldName_choiceSecondaryImage = [[FMCImageFieldName alloc] initWithValue:@"choiceSecondaryImage"];
    }

    return FMCImageFieldName_choiceSecondaryImage;
}

+ (FMCImageFieldName*)vrHelpItem
{
    if (FMCImageFieldName_vrHelpItem == nil)
    {
        FMCImageFieldName_vrHelpItem = [[FMCImageFieldName alloc] initWithValue:@"vrHelpItem"];
    }

    return FMCImageFieldName_vrHelpItem;
}

+ (FMCImageFieldName*)turnIcon
{
    if (FMCImageFieldName_turnIcon == nil)
    {
        FMCImageFieldName_turnIcon = [[FMCImageFieldName alloc] initWithValue:@"turnIcon"];
    }

    return FMCImageFieldName_turnIcon;
}

+ (FMCImageFieldName*)menuIcon
{
    if (FMCImageFieldName_menuIcon == nil)
    {
        FMCImageFieldName_menuIcon = [[FMCImageFieldName alloc] initWithValue:@"menuIcon"];
    }

    return FMCImageFieldName_menuIcon;
}

+ (FMCImageFieldName*)cmdIcon
{
    if (FMCImageFieldName_cmdIcon == nil)
    {
        FMCImageFieldName_cmdIcon = [[FMCImageFieldName alloc] initWithValue:@"cmdIcon"];
    }

    return FMCImageFieldName_cmdIcon;
}

+ (FMCImageFieldName*)appIcon
{
    if (FMCImageFieldName_appIcon == nil)
    {
        FMCImageFieldName_appIcon = [[FMCImageFieldName alloc] initWithValue:@"appIcon"];
    }

    return FMCImageFieldName_appIcon;
}

+ (FMCImageFieldName*)graphic
{
    if (FMCImageFieldName_graphic == nil)
    {
        FMCImageFieldName_graphic = [[FMCImageFieldName alloc] initWithValue:@"graphic"];
    }

    return FMCImageFieldName_graphic;
}


@end
