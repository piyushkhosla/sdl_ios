//  FMCShow.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/FMCTextAlignment.h>
#import <AppLink/FMCImage.h>

@interface FMCShow : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) NSString* mainField1;
@property(strong) NSString* mainField2;
@property(strong) NSString* mainField3;
@property(strong) NSString* mainField4;
@property(strong) FMCTextAlignment* alignment;
@property(strong) NSString* statusBar;
@property(strong) NSString* mediaClock DEPRECATED_ATTRIBUTE;
@property(strong) NSString* mediaTrack;
@property(strong) FMCImage* graphic;
@property(strong) FMCImage* secondaryGraphic;
@property(strong) NSMutableArray* softButtons;
@property(strong) NSMutableArray* customPresets;

@end
