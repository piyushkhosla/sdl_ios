//  FMCImageFieldName.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCImageFieldName : FMCEnum {}

+(FMCImageFieldName*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCImageFieldName*) softButtonImage;
+(FMCImageFieldName*) choiceImage;
+(FMCImageFieldName*) choiceSecondaryImage;
+(FMCImageFieldName*) vrHelpItem;
+(FMCImageFieldName*) turnIcon;
+(FMCImageFieldName*) menuIcon;
+(FMCImageFieldName*) cmdIcon;
+(FMCImageFieldName*) appIcon;
+(FMCImageFieldName*) graphic;
+(FMCImageFieldName*) showConstantTBTIcon;
+(FMCImageFieldName*) showConstantTBTNextTurnIcon;

@end
