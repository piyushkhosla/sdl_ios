//  FMCTextAlignment.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCTextAlignment.h>

FMCTextAlignment* FMCTextAlignment_LEFT_ALIGNED = nil;
FMCTextAlignment* FMCTextAlignment_RIGHT_ALIGNED = nil;
FMCTextAlignment* FMCTextAlignment_CENTERED = nil;

NSMutableArray* FMCTextAlignment_values = nil;
@implementation FMCTextAlignment

+(FMCTextAlignment*) valueOf:(NSString*) value {
    for (FMCTextAlignment* item in FMCTextAlignment.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCTextAlignment_values == nil) {
        FMCTextAlignment_values = [[NSMutableArray alloc] initWithObjects:
                FMCTextAlignment.LEFT_ALIGNED,
                FMCTextAlignment.RIGHT_ALIGNED,
                FMCTextAlignment.CENTERED,
                nil];
    }
    return FMCTextAlignment_values;
}

+(FMCTextAlignment*) LEFT_ALIGNED {
    	if (FMCTextAlignment_LEFT_ALIGNED == nil) {
        		FMCTextAlignment_LEFT_ALIGNED = [[FMCTextAlignment alloc] initWithValue:@"LEFT_ALIGNED"];
    	}
    	return FMCTextAlignment_LEFT_ALIGNED;
}

+(FMCTextAlignment*) RIGHT_ALIGNED {
    	if (FMCTextAlignment_RIGHT_ALIGNED == nil) {
        		FMCTextAlignment_RIGHT_ALIGNED = [[FMCTextAlignment alloc] initWithValue:@"RIGHT_ALIGNED"];
    	}
    	return FMCTextAlignment_RIGHT_ALIGNED;
}

+(FMCTextAlignment*) CENTERED {
    	if (FMCTextAlignment_CENTERED == nil) {
        		FMCTextAlignment_CENTERED = [[FMCTextAlignment alloc] initWithValue:@"CENTERED"];
    	}
    	return FMCTextAlignment_CENTERED;
}

@end
