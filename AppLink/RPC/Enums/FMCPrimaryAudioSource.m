//  FMCPrimaryAudioSource.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Enums/FMCPrimaryAudioSource.h>

FMCPrimaryAudioSource* FMCPrimaryAudioSource_NO_SOURCE_SELECTED = nil;
FMCPrimaryAudioSource* FMCPrimaryAudioSource_USB = nil;
FMCPrimaryAudioSource* FMCPrimaryAudioSource_USB2 = nil;
FMCPrimaryAudioSource* FMCPrimaryAudioSource_BLUETOOTH_STEREO_BTST = nil;
FMCPrimaryAudioSource* FMCPrimaryAudioSource_LINE_IN = nil;
FMCPrimaryAudioSource* FMCPrimaryAudioSource_IPOD = nil;
FMCPrimaryAudioSource* FMCPrimaryAudioSource_MOBILE_APP = nil;

NSMutableArray* FMCPrimaryAudioSource_values = nil;

@implementation FMCPrimaryAudioSource

+(FMCPrimaryAudioSource*) valueOf:(NSString*) value {
    for (FMCPrimaryAudioSource* item in FMCPrimaryAudioSource.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCPrimaryAudioSource_values == nil) {
        FMCPrimaryAudioSource_values = [[NSMutableArray alloc] initWithObjects:
                FMCPrimaryAudioSource.NO_SOURCE_SELECTED,
                FMCPrimaryAudioSource.USB,
                FMCPrimaryAudioSource.USB2,
                FMCPrimaryAudioSource.BLUETOOTH_STEREO_BTST,
                FMCPrimaryAudioSource.LINE_IN,
                FMCPrimaryAudioSource.IPOD,
                FMCPrimaryAudioSource.MOBILE_APP,
                nil];
    }
    return FMCPrimaryAudioSource_values;
}

+(FMCPrimaryAudioSource*) NO_SOURCE_SELECTED {
    if (FMCPrimaryAudioSource_NO_SOURCE_SELECTED == nil) {
        FMCPrimaryAudioSource_NO_SOURCE_SELECTED = [[FMCPrimaryAudioSource alloc] initWithValue:@"NO_SOURCE_SELECTED"];
    }
    return FMCPrimaryAudioSource_NO_SOURCE_SELECTED;
}

+(FMCPrimaryAudioSource*) USB {
    if (FMCPrimaryAudioSource_USB == nil) {
        FMCPrimaryAudioSource_USB = [[FMCPrimaryAudioSource alloc] initWithValue:@"USB"];
    }
    return FMCPrimaryAudioSource_USB;
}

+(FMCPrimaryAudioSource*) USB2 {
    if (FMCPrimaryAudioSource_USB2 == nil) {
        FMCPrimaryAudioSource_USB2 = [[FMCPrimaryAudioSource alloc] initWithValue:@"USB2"];
    }
    return FMCPrimaryAudioSource_USB2;
}

+(FMCPrimaryAudioSource*) BLUETOOTH_STEREO_BTST {
    if (FMCPrimaryAudioSource_BLUETOOTH_STEREO_BTST == nil) {
        FMCPrimaryAudioSource_BLUETOOTH_STEREO_BTST = [[FMCPrimaryAudioSource alloc] initWithValue:@"BLUETOOTH_STEREO_BTST"];
    }
    return FMCPrimaryAudioSource_BLUETOOTH_STEREO_BTST;
}

+(FMCPrimaryAudioSource*) LINE_IN {
    if (FMCPrimaryAudioSource_LINE_IN == nil) {
        FMCPrimaryAudioSource_LINE_IN = [[FMCPrimaryAudioSource alloc] initWithValue:@"LINE_IN"];
    }
    return FMCPrimaryAudioSource_LINE_IN;
}

+(FMCPrimaryAudioSource*) IPOD {
    if (FMCPrimaryAudioSource_IPOD == nil) {
        FMCPrimaryAudioSource_IPOD = [[FMCPrimaryAudioSource alloc] initWithValue:@"IPOD"];
    }
    return FMCPrimaryAudioSource_IPOD;
}

+(FMCPrimaryAudioSource*) MOBILE_APP {
    if (FMCPrimaryAudioSource_MOBILE_APP == nil) {
        FMCPrimaryAudioSource_MOBILE_APP = [[FMCPrimaryAudioSource alloc] initWithValue:@"MOBILE_APP"];
    }
    return FMCPrimaryAudioSource_MOBILE_APP;
}

@end
