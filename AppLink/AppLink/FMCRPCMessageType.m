//  FMCRPCMessageType.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCRPCMessageType.h>

FMCRPCMessageType* FMCRPCMessageType_request = nil;
FMCRPCMessageType* FMCRPCMessageType_response = nil;
FMCRPCMessageType* FMCRPCMessageType_notification = nil;

NSMutableArray* FMCRPCMessageType_values = nil;
@implementation FMCRPCMessageType

+(FMCRPCMessageType*) valueOf:(NSString*) value {
    for (FMCRPCMessageType* item in FMCRPCMessageType.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCRPCMessageType_values == nil) {
        FMCRPCMessageType_values = [[NSMutableArray alloc] initWithObjects:
                FMCRPCMessageType_request,
                FMCRPCMessageType_response,
                FMCRPCMessageType_notification,
                nil];
    }
    return FMCRPCMessageType_values;
}

+(FMCRPCMessageType*) request {
    	if (FMCRPCMessageType_request == nil) {
        		FMCRPCMessageType_request = [[FMCRPCMessageType alloc] initWithValue:@"request"];
    	}
    	return FMCRPCMessageType_request;
}

+(FMCRPCMessageType*) response {
    if (FMCRPCMessageType_response == nil) {
        FMCRPCMessageType_response = [[FMCRPCMessageType alloc] initWithValue:@"response"];
    }
    return FMCRPCMessageType_response;
}

+(FMCRPCMessageType*) notification {
    if (FMCRPCMessageType_notification == nil) {
        FMCRPCMessageType_notification = [[FMCRPCMessageType alloc] initWithValue:@"notification"];
    }
    return FMCRPCMessageType_notification;
}

@end
