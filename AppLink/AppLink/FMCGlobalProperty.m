//  FMCGlobalProperty.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCGlobalProperty.h>

FMCGlobalProperty* FMCGlobalProperty_HELPPROMPT = nil;
FMCGlobalProperty* FMCGlobalProperty_TIMEOUTPROMPT = nil;
FMCGlobalProperty* FMCGlobalProperty_VRHELPTITLE = nil;
FMCGlobalProperty* FMCGlobalProperty_VRHELPITEMS = nil;

NSMutableArray* FMCGlobalProperty_values = nil;
@implementation FMCGlobalProperty

+(FMCGlobalProperty*) valueOf:(NSString*) value {
    for (FMCGlobalProperty* item in FMCGlobalProperty.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCGlobalProperty_values == nil) {
        FMCGlobalProperty_values = [[NSMutableArray alloc] initWithObjects:
                FMCGlobalProperty.HELPPROMPT,
                FMCGlobalProperty.TIMEOUTPROMPT,
                FMCGlobalProperty.VRHELPTITLE,
                FMCGlobalProperty.VRHELPITEMS,
                nil];
    }
    return FMCGlobalProperty_values;
}

+(FMCGlobalProperty*) HELPPROMPT {
    	if (FMCGlobalProperty_HELPPROMPT == nil) {
        		FMCGlobalProperty_HELPPROMPT = [[FMCGlobalProperty alloc] initWithValue:@"HELPPROMPT"];
    	}
    	return FMCGlobalProperty_HELPPROMPT;
}

+(FMCGlobalProperty*) TIMEOUTPROMPT {
    	if (FMCGlobalProperty_TIMEOUTPROMPT == nil) {
        		FMCGlobalProperty_TIMEOUTPROMPT = [[FMCGlobalProperty alloc] initWithValue:@"TIMEOUTPROMPT"];
    	}
    	return FMCGlobalProperty_TIMEOUTPROMPT;
}

+(FMCGlobalProperty*) VRHELPTITLE {
    if (FMCGlobalProperty_VRHELPTITLE == nil) {
        FMCGlobalProperty_VRHELPTITLE = [[FMCGlobalProperty alloc] initWithValue:@"VRHELPTITLE"];
    }
    return FMCGlobalProperty_VRHELPTITLE;
}

+(FMCGlobalProperty*) VRHELPITEMS {
    if (FMCGlobalProperty_VRHELPITEMS == nil) {
        FMCGlobalProperty_VRHELPITEMS = [[FMCGlobalProperty alloc] initWithValue:@"VRHELPITEMS"];
    }
    return FMCGlobalProperty_VRHELPITEMS;
}

@end
