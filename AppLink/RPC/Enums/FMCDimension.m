//  FMCDimension.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Enums/FMCDimension.h>

FMCDimension* FMCDimension_NO_FIX = nil;
FMCDimension* FMCDimension_2D = nil;
FMCDimension* FMCDimension_3D = nil;

NSMutableArray* FMCDimension_values = nil;

@implementation FMCDimension

+(FMCDimension*) valueOf:(NSString*) value {
    for (FMCDimension* item in FMCDimension.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCDimension_values == nil) {
        FMCDimension_values = [[NSMutableArray alloc] initWithObjects:
                FMCDimension.NO_FIX,
                FMCDimension._2D,
                FMCDimension._3D,
                nil];
    }
    return FMCDimension_values;
}

+(FMCDimension*) NO_FIX {
    if (FMCDimension_NO_FIX == nil) {
        FMCDimension_NO_FIX = [[FMCDimension alloc] initWithValue:@"NO_FIX"];
    }
    return FMCDimension_NO_FIX;
}

+(FMCDimension*) _2D {
    if (FMCDimension_2D == nil) {
        FMCDimension_2D = [[FMCDimension alloc] initWithValue:@"2D"];
    }
    return FMCDimension_2D;
}

+(FMCDimension*) _3D {
    if (FMCDimension_3D == nil) {
        FMCDimension_3D = [[FMCDimension alloc] initWithValue:@"3D"];
    }
    return FMCDimension_3D;
}

@end
