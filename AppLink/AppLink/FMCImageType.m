//  FMCImageType.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCImageType.h>

FMCImageType* FMCImageType_STATIC = nil;
FMCImageType* FMCImageType_DYNAMIC = nil;

NSMutableArray* FMCImageType_values = nil;
@implementation FMCImageType

+(FMCImageType*) valueOf:(NSString*) imageType {
    for (FMCImageType* item in FMCImageType.values) {
        if ([item.value isEqualToString:imageType]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCImageType_values == nil) {
        FMCImageType_values = [[NSMutableArray alloc] initWithObjects:
                FMCImageType.STATIC,
                FMCImageType.DYNAMIC,
                nil];
    }
    return FMCImageType_values;
}

+(FMCImageType*) STATIC {
    	if (FMCImageType_STATIC == nil) {
        		FMCImageType_STATIC = [[FMCImageType alloc] initWithValue:@"STATIC"];
    	}
    	return FMCImageType_STATIC;
}

+(FMCImageType*) DYNAMIC {
    	if (FMCImageType_DYNAMIC == nil) {
        		FMCImageType_DYNAMIC = [[FMCImageType alloc] initWithValue:@"DYNAMIC"];
    	}
    	return FMCImageType_DYNAMIC;
}

@end
