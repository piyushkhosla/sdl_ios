//  FMCCharacterSet.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCCharacterSet.h>

FMCCharacterSet* FMCCharacterSet_TYPE2SET = nil;
FMCCharacterSet* FMCCharacterSet_TYPE5SET = nil;
FMCCharacterSet* FMCCharacterSet_CID1SET = nil;
FMCCharacterSet* FMCCharacterSet_CID2SET = nil;

NSMutableArray* FMCCharacterSet_values = nil;

@implementation FMCCharacterSet

+(FMCCharacterSet*) valueOf:(NSString*) value {
    for (FMCCharacterSet* item in FMCCharacterSet.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCCharacterSet_values == nil) {
        FMCCharacterSet_values = [[NSMutableArray alloc] initWithObjects:
                FMCCharacterSet.TYPE2SET,
                FMCCharacterSet.TYPE5SET,
                FMCCharacterSet.CID1SET,
                FMCCharacterSet.CID2SET,
                nil];
    }
    return FMCCharacterSet_values;
}

+(FMCCharacterSet*) TYPE2SET {
    if (FMCCharacterSet_TYPE2SET == nil) {
        FMCCharacterSet_TYPE2SET = [[FMCCharacterSet alloc] initWithValue:@"TYPE2SET"];
    }
    return FMCCharacterSet_TYPE2SET;
}

+(FMCCharacterSet*) TYPE5SET {
    if (FMCCharacterSet_TYPE5SET == nil) {
        FMCCharacterSet_TYPE5SET = [[FMCCharacterSet alloc] initWithValue:@"TYPE5SET"];
    }
    return FMCCharacterSet_TYPE5SET;
}

+(FMCCharacterSet*) CID1SET {
    if (FMCCharacterSet_CID1SET == nil) {
        FMCCharacterSet_CID1SET = [[FMCCharacterSet alloc] initWithValue:@"CID1SET"];
    }
    return FMCCharacterSet_CID1SET;
}

+(FMCCharacterSet*) CID2SET {
    if (FMCCharacterSet_CID2SET == nil) {
        FMCCharacterSet_CID2SET = [[FMCCharacterSet alloc] initWithValue:@"CID2SET"];
    }
    return FMCCharacterSet_CID2SET;
}

@end
