//  FMCAudioType.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCAudioType.h>

FMCAudioType* FMCAudioType_PCM = nil;

NSMutableArray* FMCAudioType_values = nil;
@implementation FMCAudioType

+(FMCAudioType*) valueOf:(NSString*) value {
    for (FMCAudioType* item in FMCAudioType.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCAudioType_values == nil) {
        FMCAudioType_values = [[NSMutableArray alloc] initWithObjects:
                FMCAudioType.PCM,
                nil];
    }
    return FMCAudioType_values;
}

+(FMCAudioType*) PCM {
    	if (FMCAudioType_PCM == nil) {
        		FMCAudioType_PCM = [[FMCAudioType alloc] initWithValue:@"PCM"];
    	}
    	return FMCAudioType_PCM;
}

@end
