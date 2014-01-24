//  FMCDisplayType.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCDisplayType.h>

FMCDisplayType* FMCDisplayType_CID = nil;
FMCDisplayType* FMCDisplayType_TYPE2 = nil;
FMCDisplayType* FMCDisplayType_TYPE5 = nil;
FMCDisplayType* FMCDisplayType_NGN = nil;
FMCDisplayType* FMCDisplayType_GEN2_4_DMA = nil;
FMCDisplayType* FMCDisplayType_GEN2_8_DMA = nil;
FMCDisplayType* FMCDisplayType_GEN2_4_HUD = nil;
FMCDisplayType* FMCDisplayType_MFD3 = nil;
FMCDisplayType* FMCDisplayType_MFD4 = nil;
FMCDisplayType* FMCDisplayType_MFD5 = nil;


NSMutableArray* FMCDisplayType_values = nil;
@implementation FMCDisplayType

+(FMCDisplayType*) valueOf:(NSString*) value {
    for (FMCDisplayType* item in FMCDisplayType.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCDisplayType_values == nil) {
        FMCDisplayType_values = [[NSMutableArray alloc] initWithObjects:
                FMCDisplayType.CID,
                FMCDisplayType.TYPE2,
                FMCDisplayType.TYPE5,
                FMCDisplayType.NGN,
                FMCDisplayType.GEN2_4_DMA,
                FMCDisplayType.GEN2_8_DMA,
                FMCDisplayType.GEN2_4_HUD,
                FMCDisplayType.MFD3,
                FMCDisplayType.MFD4,
                FMCDisplayType.MFD5,
                nil];
    }
    return FMCDisplayType_values;
}

+(FMCDisplayType*) CID {
    	if (FMCDisplayType_CID == nil) {
        		FMCDisplayType_CID = [[FMCDisplayType alloc] initWithValue:@"CID"];
    	}
    	return FMCDisplayType_CID;
}

+(FMCDisplayType*) TYPE2 {
    	if (FMCDisplayType_TYPE2 == nil) {
        		FMCDisplayType_TYPE2 = [[FMCDisplayType alloc] initWithValue:@"TYPE2"];
    	}
    	return FMCDisplayType_TYPE2;
}

+(FMCDisplayType*) TYPE5 {
    	if (FMCDisplayType_TYPE5 == nil) {
        		FMCDisplayType_TYPE5 = [[FMCDisplayType alloc] initWithValue:@"TYPE5"];
    	}
    	return FMCDisplayType_TYPE5;
}

+(FMCDisplayType*) NGN {
    	if (FMCDisplayType_NGN == nil) {
        		FMCDisplayType_NGN = [[FMCDisplayType alloc] initWithValue:@"NGN"];
    	}
    	return FMCDisplayType_NGN;
}

+(FMCDisplayType*) GEN2_4_DMA {
    	if (FMCDisplayType_GEN2_4_DMA == nil) {
        		FMCDisplayType_GEN2_4_DMA = [[FMCDisplayType alloc] initWithValue:@"GEN2_4_DMA"];
    	}
    	return FMCDisplayType_GEN2_4_DMA;
}

+(FMCDisplayType*) GEN2_8_DMA {
    	if (FMCDisplayType_GEN2_8_DMA == nil) {
        		FMCDisplayType_GEN2_8_DMA = [[FMCDisplayType alloc] initWithValue:@"GEN2_8_DMA"];
    	}
    	return FMCDisplayType_GEN2_8_DMA;
}

+(FMCDisplayType*) GEN2_4_HUD {
    	if (FMCDisplayType_GEN2_4_HUD == nil) {
        		FMCDisplayType_GEN2_4_HUD = [[FMCDisplayType alloc] initWithValue:@"GEN2_4_HUD"];
    	}
    	return FMCDisplayType_GEN2_4_HUD;
}

+(FMCDisplayType*) MFD3 {
    if (FMCDisplayType_MFD3 == nil) {
        FMCDisplayType_MFD3 = [[FMCDisplayType alloc] initWithValue:@"MFD3"];
    }
    return FMCDisplayType_MFD3;
}

+(FMCDisplayType*) MFD4 {
    if (FMCDisplayType_MFD4 == nil) {
        FMCDisplayType_MFD4 = [[FMCDisplayType alloc] initWithValue:@"MFD4"];
    }
    return FMCDisplayType_MFD4;
}

+(FMCDisplayType*) MFD5 {
    if (FMCDisplayType_MFD5 == nil) {
        FMCDisplayType_MFD5 = [[FMCDisplayType alloc] initWithValue:@"MFD5"];
    }
    return FMCDisplayType_MFD5;
}

@end
