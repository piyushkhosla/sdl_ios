//
//  FMCImageFieldName.h
//  AppLink
//
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCImageFieldName : FMCEnum

+ (NSMutableArray*)values;
+ (FMCImageFieldName*)valueOf:(NSString*) value;
+ (FMCImageFieldName*)softButtonImage;
+ (FMCImageFieldName*)choiceImage;
+ (FMCImageFieldName*)choiceSecondaryImage;
+ (FMCImageFieldName*)vrHelpItem;
+ (FMCImageFieldName*)turnIcon;
+ (FMCImageFieldName*)menuIcon;
+ (FMCImageFieldName*)cmdIcon;
+ (FMCImageFieldName*)appIcon;
+ (FMCImageFieldName*)graphic;

@end
