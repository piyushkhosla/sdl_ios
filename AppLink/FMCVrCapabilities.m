//  FMCVrCapabilities.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCVrCapabilities.h>

FMCVrCapabilities* FMCVrCapabilities_TEXT = nil;

NSMutableArray* FMCVrCapabilities_values = nil;

@implementation FMCVrCapabilities

+(FMCVrCapabilities*) valueOf:(NSString*) value {
    for (FMCVrCapabilities* item in FMCVrCapabilities.values) {
        //NOTE: This was added for Sync Module Compatability, V1 module resturns "Text" and a
        //      Gen 1.1 module returns "TEXT", the new if statement makes a case insensitive
        //      check instead to accept both
        //if ([item.value isEqualToString:value]) {
        if (item.value && [item.value caseInsensitiveCompare:value] == NSOrderedSame) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCVrCapabilities_values == nil) {
        FMCVrCapabilities_values = [[NSMutableArray alloc] initWithObjects:
                FMCVrCapabilities.TEXT,
                nil];
    }
    return FMCVrCapabilities_values;
}

+(FMCVrCapabilities*) TEXT {
    if (FMCVrCapabilities_TEXT == nil) {
        FMCVrCapabilities_TEXT = [[FMCVrCapabilities alloc] initWithValue:@"TEXT"];
    }
    return FMCVrCapabilities_TEXT;
}

@end
