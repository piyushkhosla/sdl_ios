//  FMCRPCResponse.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCRPCResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCRPCResponse

-(NSNumber*) correlationID {
	return [function objectForKey:NAMES_correlationID];
}

-(void) setCorrelationID:(NSNumber *)corrID {
    if (corrID != nil) {
        [function setObject:corrID forKey:NAMES_correlationID];
    } else {
        [function removeObjectForKey:NAMES_correlationID];
    }
}

-(void) setSuccess:(NSNumber*) success {
    if (success != nil) {
        [parameters setObject:success forKey:NAMES_success];
    } else {
        [parameters removeObjectForKey:NAMES_success];
    }
}

-(NSNumber*) success {
    return [parameters objectForKey:NAMES_success];
}

-(void) setResultCode:(FMCResult*) resultCode {
    if (resultCode != nil) {
        [parameters setObject:resultCode forKey:NAMES_resultCode];
    } else {
        [parameters removeObjectForKey:NAMES_resultCode];
    }
}

-(FMCResult*) resultCode {
    NSObject* obj = [parameters objectForKey:NAMES_resultCode];
    if ([obj isKindOfClass:FMCResult.class]) {
        return (FMCResult*)obj;
    } else { 
        return [FMCResult valueOf:(NSString*)obj];
    }
}

-(void) setInfo:(NSString*) info {
    if (info != nil) {
        [parameters setObject:info forKey:NAMES_info];
    } else {
        [parameters removeObjectForKey:NAMES_info];
    }
}

-(NSString*) info {
    return [parameters objectForKey:NAMES_info];
}

@end
