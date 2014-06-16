//  FMCSpeechCapabilities.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Enums/FMCSpeechCapabilities.h>

FMCSpeechCapabilities* FMCSpeechCapabilities_TEXT = nil;
FMCSpeechCapabilities* FMCSpeechCapabilities_SAPI_PHONEMES = nil;
FMCSpeechCapabilities* FMCSpeechCapabilities_LHPLUS_PHONEMES = nil;
FMCSpeechCapabilities* FMCSpeechCapabilities_PRE_RECORDED = nil;
FMCSpeechCapabilities* FMCSpeechCapabilities_SILENCE = nil;

NSMutableArray* FMCSpeechCapabilities_values = nil;

@implementation FMCSpeechCapabilities

+(FMCSpeechCapabilities*) valueOf:(NSString*) value {
    for (FMCSpeechCapabilities* item in FMCSpeechCapabilities.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCSpeechCapabilities_values == nil) {
        FMCSpeechCapabilities_values = [[NSMutableArray alloc] initWithObjects:
                FMCSpeechCapabilities.TEXT,
                FMCSpeechCapabilities.SAPI_PHONEMES,
                FMCSpeechCapabilities.LHPLUS_PHONEMES,
                FMCSpeechCapabilities.PRE_RECORDED,
                FMCSpeechCapabilities.SILENCE,
                nil];
    }
    return FMCSpeechCapabilities_values;
}

+(FMCSpeechCapabilities*) TEXT {
    if (FMCSpeechCapabilities_TEXT == nil) {
        FMCSpeechCapabilities_TEXT = [[FMCSpeechCapabilities alloc] initWithValue:@"TEXT"];
    }
    return FMCSpeechCapabilities_TEXT;
}

+(FMCSpeechCapabilities*) SAPI_PHONEMES {
    if (FMCSpeechCapabilities_SAPI_PHONEMES == nil) {
        FMCSpeechCapabilities_SAPI_PHONEMES = [[FMCSpeechCapabilities alloc] initWithValue:@"SAPI_PHONEMES"];
    }
    return FMCSpeechCapabilities_SAPI_PHONEMES;
}

+(FMCSpeechCapabilities*) LHPLUS_PHONEMES {
    if (FMCSpeechCapabilities_LHPLUS_PHONEMES == nil) {
        FMCSpeechCapabilities_LHPLUS_PHONEMES = [[FMCSpeechCapabilities alloc] initWithValue:@"LHPLUS_PHONEMES"];
    }
    return FMCSpeechCapabilities_LHPLUS_PHONEMES;
}

+(FMCSpeechCapabilities*) PRE_RECORDED {
    if (FMCSpeechCapabilities_PRE_RECORDED == nil) {
        FMCSpeechCapabilities_PRE_RECORDED = [[FMCSpeechCapabilities alloc] initWithValue:@"PRE_RECORDED"];
    }
    return FMCSpeechCapabilities_PRE_RECORDED;
}

+(FMCSpeechCapabilities*) SILENCE {
    if (FMCSpeechCapabilities_SILENCE == nil) {
        FMCSpeechCapabilities_SILENCE = [[FMCSpeechCapabilities alloc] initWithValue:@"SILENCE"];
    }
    return FMCSpeechCapabilities_SILENCE;
}

@end
