//  FMCResult.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCResult.h>

FMCResult* FMCResult_SUCCESS = nil;
FMCResult* FMCResult_INVALID_DATA = nil;
FMCResult* FMCResult_UNSUPPORTED_REQUEST = nil;
FMCResult* FMCResult_OUT_OF_MEMORY = nil;
FMCResult* FMCResult_TOO_MANY_PENDING_REQUESTS = nil;
FMCResult* FMCResult_INVALID_ID = nil;
FMCResult* FMCResult_DUPLICATE_NAME = nil;
FMCResult* FMCResult_TOO_MANY_APPLICATIONS = nil;
FMCResult* FMCResult_APPLICATION_REGISTERED_ALREADY = nil;
FMCResult* FMCResult_UNSUPPORTED_VERSION = nil;
FMCResult* FMCResult_WRONG_LANGUAGE = nil;
FMCResult* FMCResult_APPLICATION_NOT_REGISTERED = nil;
FMCResult* FMCResult_IN_USE = nil;
FMCResult* FMCResult_VEHICLE_DATA_NOT_ALLOWED = nil;
FMCResult* FMCResult_VEHICLE_DATA_NOT_AVAILABLE = nil;
FMCResult* FMCResult_REJECTED = nil;
FMCResult* FMCResult_ABORTED = nil;
FMCResult* FMCResult_IGNORED = nil;
FMCResult* FMCResult_UNSUPPORTED_RESOURCE = nil;
FMCResult* FMCResult_FILE_NOT_FOUND = nil;
FMCResult* FMCResult_GENERIC_ERROR = nil;
FMCResult* FMCResult_DISALLOWED = nil;
FMCResult* FMCResult_USER_DISALLOWED = nil;
FMCResult* FMCResult_TIMED_OUT = nil;
FMCResult* FMCResult_CANCEL_ROUTE = nil;
FMCResult* FMCResult_TRUNCATED_DATA = nil;
FMCResult* FMCResult_RETRY = nil;
FMCResult* FMCResult_WARNINGS = nil;

NSMutableArray* FMCResult_values = nil;

@implementation FMCResult

+(FMCResult*) valueOf:(NSString*) value {
    for (FMCResult* item in FMCResult.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCResult_values == nil) {
        FMCResult_values = [[NSMutableArray alloc] initWithObjects:
                FMCResult.SUCCESS,
                FMCResult.INVALID_DATA,
                FMCResult.UNSUPPORTED_REQUEST,
                FMCResult.OUT_OF_MEMORY,
                FMCResult.TOO_MANY_PENDING_REQUESTS,
                FMCResult.INVALID_ID,
                FMCResult.DUPLICATE_NAME,
                FMCResult.TOO_MANY_APPLICATIONS,
                FMCResult.APPLICATION_REGISTERED_ALREADY,
                FMCResult.UNSUPPORTED_VERSION,
                FMCResult.WRONG_LANGUAGE,
                FMCResult.APPLICATION_NOT_REGISTERED,
                FMCResult.IN_USE,
                FMCResult.VEHICLE_DATA_NOT_ALLOWED,
                FMCResult.VEHICLE_DATA_NOT_AVAILABLE,
                FMCResult.REJECTED,
                FMCResult.ABORTED,
                FMCResult.IGNORED,
                FMCResult.UNSUPPORTED_RESOURCE,
                FMCResult.FILE_NOT_FOUND,
                FMCResult.GENERIC_ERROR,
                FMCResult.DISALLOWED,
                FMCResult.USER_DISALLOWED,
                FMCResult.TIMED_OUT,
                FMCResult.CANCEL_ROUTE,
                FMCResult.TRUNCATED_DATA,
                FMCResult.RETRY,
                FMCResult.WARNINGS,
                nil];
    }
    return FMCResult_values;
}

+(FMCResult*) SUCCESS {
    if (FMCResult_SUCCESS == nil) {
        FMCResult_SUCCESS = [[FMCResult alloc] initWithValue:@"SUCCESS"];
    }
    return FMCResult_SUCCESS;
}

+(FMCResult*) INVALID_DATA {
    if (FMCResult_INVALID_DATA == nil) {
        FMCResult_INVALID_DATA = [[FMCResult alloc] initWithValue:@"INVALID_DATA"];
    }
    return FMCResult_INVALID_DATA;
}

+(FMCResult*) UNSUPPORTED_REQUEST {
    if (FMCResult_UNSUPPORTED_REQUEST == nil) {
        FMCResult_UNSUPPORTED_REQUEST = [[FMCResult alloc] initWithValue:@"UNSUPPORTED_REQUEST"];
    }
    return FMCResult_UNSUPPORTED_REQUEST;
}

+(FMCResult*) OUT_OF_MEMORY {
    if (FMCResult_OUT_OF_MEMORY == nil) {
        FMCResult_OUT_OF_MEMORY = [[FMCResult alloc] initWithValue:@"OUT_OF_MEMORY"];
    }
    return FMCResult_OUT_OF_MEMORY;
}

+(FMCResult*) TOO_MANY_PENDING_REQUESTS {
    if (FMCResult_TOO_MANY_PENDING_REQUESTS == nil) {
        FMCResult_TOO_MANY_PENDING_REQUESTS = [[FMCResult alloc] initWithValue:@"TOO_MANY_PENDING_REQUESTS"];
    }
    return FMCResult_TOO_MANY_PENDING_REQUESTS;
}

+(FMCResult*) INVALID_ID {
    if (FMCResult_INVALID_ID == nil) {
        FMCResult_INVALID_ID = [[FMCResult alloc] initWithValue:@"INVALID_ID"];
    }
    return FMCResult_INVALID_ID;
}

+(FMCResult*) DUPLICATE_NAME {
    if (FMCResult_DUPLICATE_NAME == nil) {
        FMCResult_DUPLICATE_NAME = [[FMCResult alloc] initWithValue:@"DUPLICATE_NAME"];
    }
    return FMCResult_DUPLICATE_NAME;
}

+(FMCResult*) TOO_MANY_APPLICATIONS {
    if (FMCResult_TOO_MANY_APPLICATIONS == nil) {
        FMCResult_TOO_MANY_APPLICATIONS = [[FMCResult alloc] initWithValue:@"TOO_MANY_APPLICATIONS"];
    }
    return FMCResult_TOO_MANY_APPLICATIONS;
}

+(FMCResult*) APPLICATION_REGISTERED_ALREADY {
    if (FMCResult_APPLICATION_REGISTERED_ALREADY == nil) {
        FMCResult_APPLICATION_REGISTERED_ALREADY = [[FMCResult alloc] initWithValue:@"APPLICATION_REGISTERED_ALREADY"];
    }
    return FMCResult_APPLICATION_REGISTERED_ALREADY;
}

+(FMCResult*) UNSUPPORTED_VERSION {
    if (FMCResult_UNSUPPORTED_VERSION == nil) {
        FMCResult_UNSUPPORTED_VERSION = [[FMCResult alloc] initWithValue:@"UNSUPPORTED_VERSION"];
    }
    return FMCResult_UNSUPPORTED_VERSION;
}

+(FMCResult*) WRONG_LANGUAGE {
    if (FMCResult_WRONG_LANGUAGE == nil) {
        FMCResult_WRONG_LANGUAGE = [[FMCResult alloc] initWithValue:@"WRONG_LANGUAGE"];
    }
    return FMCResult_WRONG_LANGUAGE;
}

+(FMCResult*) APPLICATION_NOT_REGISTERED {
    if (FMCResult_APPLICATION_NOT_REGISTERED == nil) {
        FMCResult_APPLICATION_NOT_REGISTERED = [[FMCResult alloc] initWithValue:@"APPLICATION_NOT_REGISTERED"];
    }
    return FMCResult_APPLICATION_NOT_REGISTERED;
}

+(FMCResult*) IN_USE {
    if (FMCResult_IN_USE == nil) {
        FMCResult_IN_USE = [[FMCResult alloc] initWithValue:@"IN_USE"];
    }
    return FMCResult_IN_USE;
}

+(FMCResult*) VEHICLE_DATA_NOT_ALLOWED {
    if (FMCResult_VEHICLE_DATA_NOT_ALLOWED == nil) {
        FMCResult_VEHICLE_DATA_NOT_ALLOWED = [[FMCResult alloc] initWithValue:@"VEHICLE_DATA_NOT_ALLOWED"];
    }
    return FMCResult_VEHICLE_DATA_NOT_ALLOWED;
}

+(FMCResult*) VEHICLE_DATA_NOT_AVAILABLE {
    if (FMCResult_VEHICLE_DATA_NOT_AVAILABLE == nil) {
        FMCResult_VEHICLE_DATA_NOT_AVAILABLE = [[FMCResult alloc] initWithValue:@"VEHICLE_DATA_NOT_AVAILABLE"];
    }
    return FMCResult_VEHICLE_DATA_NOT_AVAILABLE;
}

+(FMCResult*) REJECTED {
    if (FMCResult_REJECTED == nil) {
        FMCResult_REJECTED = [[FMCResult alloc] initWithValue:@"REJECTED"];
    }
    return FMCResult_REJECTED;
}

+(FMCResult*) ABORTED {
    if (FMCResult_ABORTED == nil) {
        FMCResult_ABORTED = [[FMCResult alloc] initWithValue:@"ABORTED"];
    }
    return FMCResult_ABORTED;
}

+(FMCResult*) IGNORED {
    if (FMCResult_IGNORED == nil) {
        FMCResult_IGNORED = [[FMCResult alloc] initWithValue:@"IGNORED"];
    }
    return FMCResult_IGNORED;
}

+(FMCResult*) UNSUPPORTED_RESOURCE {
    if (FMCResult_UNSUPPORTED_RESOURCE == nil) {
        FMCResult_UNSUPPORTED_RESOURCE = [[FMCResult alloc] initWithValue:@"UNSUPPORTED_RESOURCE"];
    }
    return FMCResult_UNSUPPORTED_RESOURCE;
}

+(FMCResult*) FILE_NOT_FOUND {
    if (FMCResult_FILE_NOT_FOUND == nil) {
        FMCResult_FILE_NOT_FOUND = [[FMCResult alloc] initWithValue:@"FILE_NOT_FOUND"];
    }
    return FMCResult_FILE_NOT_FOUND;
}

+(FMCResult*) GENERIC_ERROR {
    if (FMCResult_GENERIC_ERROR == nil) {
        FMCResult_GENERIC_ERROR = [[FMCResult alloc] initWithValue:@"GENERIC_ERROR"];
    }
    return FMCResult_GENERIC_ERROR;
}

+(FMCResult*) DISALLOWED {
    if (FMCResult_DISALLOWED == nil) {
        FMCResult_DISALLOWED = [[FMCResult alloc] initWithValue:@"DISALLOWED"];
    }
    return FMCResult_DISALLOWED;
}

+(FMCResult*) USER_DISALLOWED {
    if (FMCResult_USER_DISALLOWED == nil) {
        FMCResult_USER_DISALLOWED = [[FMCResult alloc] initWithValue:@"USER_DISALLOWED"];
    }
    return FMCResult_USER_DISALLOWED;
}

+(FMCResult*) TIMED_OUT {
    if (FMCResult_TIMED_OUT == nil) {
        FMCResult_TIMED_OUT = [[FMCResult alloc] initWithValue:@"TIMED_OUT"];
    }
    return FMCResult_TIMED_OUT;
}

+(FMCResult*) CANCEL_ROUTE {
    if (FMCResult_CANCEL_ROUTE == nil) {
        FMCResult_CANCEL_ROUTE = [[FMCResult alloc] initWithValue:@"CANCEL_ROUTE"];
    }
    return FMCResult_CANCEL_ROUTE;
}

+(FMCResult*) TRUNCATED_DATA {
    if (FMCResult_TRUNCATED_DATA == nil) {
        FMCResult_TRUNCATED_DATA = [[FMCResult alloc] initWithValue:@"TRUNCATED_DATA"];
    }
    return FMCResult_TRUNCATED_DATA;
}

+(FMCResult*) RETRY {
    if (FMCResult_RETRY == nil) {
        FMCResult_RETRY = [[FMCResult alloc] initWithValue:@"RETRY"];
    }
    return FMCResult_RETRY;
}

+(FMCResult*) WARNINGS {
    if (FMCResult_WARNINGS == nil) {
        FMCResult_WARNINGS = [[FMCResult alloc] initWithValue:@"WARNINGS"];
    }
    return FMCResult_WARNINGS;
}

@end
