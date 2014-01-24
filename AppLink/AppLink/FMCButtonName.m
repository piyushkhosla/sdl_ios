//  FMCButtonName.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCButtonName.h>

FMCButtonName* FMCButtonName_OK = nil;
FMCButtonName* FMCButtonName_SEEKLEFT = nil;
FMCButtonName* FMCButtonName_SEEKRIGHT = nil;
FMCButtonName* FMCButtonName_TUNEUP = nil;
FMCButtonName* FMCButtonName_TUNEDOWN = nil;
FMCButtonName* FMCButtonName_PRESET_0 = nil;
FMCButtonName* FMCButtonName_PRESET_1 = nil;
FMCButtonName* FMCButtonName_PRESET_2 = nil;
FMCButtonName* FMCButtonName_PRESET_3 = nil;
FMCButtonName* FMCButtonName_PRESET_4 = nil;
FMCButtonName* FMCButtonName_PRESET_5 = nil;
FMCButtonName* FMCButtonName_PRESET_6 = nil;
FMCButtonName* FMCButtonName_PRESET_7 = nil;
FMCButtonName* FMCButtonName_PRESET_8 = nil;
FMCButtonName* FMCButtonName_PRESET_9 = nil;
FMCButtonName* FMCButtonName_CUSTOM_BUTTON = nil;

NSMutableArray* FMCButtonName_values = nil;
@implementation FMCButtonName

+(FMCButtonName*) valueOf:(NSString*) value {
    for (FMCButtonName* item in FMCButtonName.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCButtonName_values == nil) {
        FMCButtonName_values = [[NSMutableArray alloc] initWithObjects:
                FMCButtonName.OK,
                FMCButtonName.SEEKLEFT,
                FMCButtonName.SEEKRIGHT,
                FMCButtonName.TUNEUP,
                FMCButtonName.TUNEDOWN,
                FMCButtonName.PRESET_0,
                FMCButtonName.PRESET_1,
                FMCButtonName.PRESET_2,
                FMCButtonName.PRESET_3,
                FMCButtonName.PRESET_4,
                FMCButtonName.PRESET_5,
                FMCButtonName.PRESET_6,
                FMCButtonName.PRESET_7,
                FMCButtonName.PRESET_8,
                FMCButtonName.PRESET_9,
                FMCButtonName.CUSTOM_BUTTON,
                nil];
    }
    return FMCButtonName_values;
}

+(FMCButtonName*) OK {
    	if (FMCButtonName_OK == nil) {
        		FMCButtonName_OK = [[FMCButtonName alloc] initWithValue:@"OK"];
    	}
    	return FMCButtonName_OK;
}

+(FMCButtonName*) SEEKLEFT {
    	if (FMCButtonName_SEEKLEFT == nil) {
        		FMCButtonName_SEEKLEFT = [[FMCButtonName alloc] initWithValue:@"SEEKLEFT"];
    	}
    	return FMCButtonName_SEEKLEFT;
}

+(FMCButtonName*) SEEKRIGHT {
    	if (FMCButtonName_SEEKRIGHT == nil) {
        		FMCButtonName_SEEKRIGHT = [[FMCButtonName alloc] initWithValue:@"SEEKRIGHT"];
    	}
    	return FMCButtonName_SEEKRIGHT;
}

+(FMCButtonName*) TUNEUP {
    	if (FMCButtonName_TUNEUP == nil) {
        		FMCButtonName_TUNEUP = [[FMCButtonName alloc] initWithValue:@"TUNEUP"];
    	}
    	return FMCButtonName_TUNEUP;
}

+(FMCButtonName*) TUNEDOWN {
    	if (FMCButtonName_TUNEDOWN == nil) {
        		FMCButtonName_TUNEDOWN = [[FMCButtonName alloc] initWithValue:@"TUNEDOWN"];
    	}
    	return FMCButtonName_TUNEDOWN;
}

+(FMCButtonName*) PRESET_0 {
    	if (FMCButtonName_PRESET_0 == nil) {
        		FMCButtonName_PRESET_0 = [[FMCButtonName alloc] initWithValue:@"PRESET_0"];
    	}
    	return FMCButtonName_PRESET_0;
}

+(FMCButtonName*) PRESET_1 {
    	if (FMCButtonName_PRESET_1 == nil) {
        		FMCButtonName_PRESET_1 = [[FMCButtonName alloc] initWithValue:@"PRESET_1"];
    	}
    	return FMCButtonName_PRESET_1;
}

+(FMCButtonName*) PRESET_2 {
    	if (FMCButtonName_PRESET_2 == nil) {
        		FMCButtonName_PRESET_2 = [[FMCButtonName alloc] initWithValue:@"PRESET_2"];
    	}
    	return FMCButtonName_PRESET_2;
}

+(FMCButtonName*) PRESET_3 {
    	if (FMCButtonName_PRESET_3 == nil) {
        		FMCButtonName_PRESET_3 = [[FMCButtonName alloc] initWithValue:@"PRESET_3"];
    	}
    	return FMCButtonName_PRESET_3;
}

+(FMCButtonName*) PRESET_4 {
    	if (FMCButtonName_PRESET_4 == nil) {
        		FMCButtonName_PRESET_4 = [[FMCButtonName alloc] initWithValue:@"PRESET_4"];
    	}
    	return FMCButtonName_PRESET_4;
}

+(FMCButtonName*) PRESET_5 {
    	if (FMCButtonName_PRESET_5 == nil) {
        		FMCButtonName_PRESET_5 = [[FMCButtonName alloc] initWithValue:@"PRESET_5"];
    	}
    	return FMCButtonName_PRESET_5;
}

+(FMCButtonName*) PRESET_6 {
    	if (FMCButtonName_PRESET_6 == nil) {
        		FMCButtonName_PRESET_6 = [[FMCButtonName alloc] initWithValue:@"PRESET_6"];
    	}
    	return FMCButtonName_PRESET_6;
}

+(FMCButtonName*) PRESET_7 {
    	if (FMCButtonName_PRESET_7 == nil) {
        		FMCButtonName_PRESET_7 = [[FMCButtonName alloc] initWithValue:@"PRESET_7"];
    	}
    	return FMCButtonName_PRESET_7;
}

+(FMCButtonName*) PRESET_8 {
    	if (FMCButtonName_PRESET_8 == nil) {
        		FMCButtonName_PRESET_8 = [[FMCButtonName alloc] initWithValue:@"PRESET_8"];
    	}
    	return FMCButtonName_PRESET_8;
}

+(FMCButtonName*) PRESET_9 {
    	if (FMCButtonName_PRESET_9 == nil) {
        		FMCButtonName_PRESET_9 = [[FMCButtonName alloc] initWithValue:@"PRESET_9"];
    	}
    	return FMCButtonName_PRESET_9;
}

+(FMCButtonName*) CUSTOM_BUTTON {
    if (FMCButtonName_CUSTOM_BUTTON == nil) {
        FMCButtonName_CUSTOM_BUTTON = [[FMCButtonName alloc] initWithValue:@"CUSTOM_BUTTON"];
    }
    return FMCButtonName_CUSTOM_BUTTON;
}

@end
