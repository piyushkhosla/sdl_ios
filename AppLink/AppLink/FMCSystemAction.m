//  FMCSystemAction.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCSystemAction.h>

FMCSystemAction* FMCSystemAction_DEFAULT_ACTION = nil;
FMCSystemAction* FMCSystemAction_STEAL_FOCUS = nil;
FMCSystemAction* FMCSystemAction_KEEP_CONTEXT = nil;

NSMutableArray* FMCSystemAction_values = nil;
@implementation FMCSystemAction

+(FMCSystemAction*) valueOf:(NSString*) value {
    for (FMCSystemAction* item in FMCSystemAction.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCSystemAction_values == nil) {
        FMCSystemAction_values = [[NSMutableArray alloc] initWithObjects:
                FMCSystemAction.DEFAULT_ACTION,
                FMCSystemAction.STEAL_FOCUS,
                FMCSystemAction.KEEP_CONTEXT,
                nil];
    }
    return FMCSystemAction_values;
}

+(FMCSystemAction*) DEFAULT_ACTION {
    	if (FMCSystemAction_DEFAULT_ACTION == nil) {
        		FMCSystemAction_DEFAULT_ACTION = [[FMCSystemAction alloc] initWithValue:@"DEFAULT_ACTION"];
    	}
    	return FMCSystemAction_DEFAULT_ACTION;
}

+(FMCSystemAction*) STEAL_FOCUS {
    	if (FMCSystemAction_STEAL_FOCUS == nil) {
        		FMCSystemAction_STEAL_FOCUS = [[FMCSystemAction alloc] initWithValue:@"STEAL_FOCUS"];
    	}
    	return FMCSystemAction_STEAL_FOCUS;
}

+(FMCSystemAction*) KEEP_CONTEXT {
    	if (FMCSystemAction_KEEP_CONTEXT == nil) {
        		FMCSystemAction_KEEP_CONTEXT = [[FMCSystemAction alloc] initWithValue:@"KEEP_CONTEXT"];
    	}
    	return FMCSystemAction_KEEP_CONTEXT;
}

@end
