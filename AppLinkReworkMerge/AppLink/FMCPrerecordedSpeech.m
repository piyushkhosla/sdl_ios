//  FMCPrerecordedSpeech.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCPrerecordedSpeech.h>

FMCPrerecordedSpeech* FMCPrerecordedSpeech_HELP_JINGLE = nil;
FMCPrerecordedSpeech* FMCPrerecordedSpeech_INITIAL_JINGLE = nil;
FMCPrerecordedSpeech* FMCPrerecordedSpeech_LISTEN_JINGLE = nil;
FMCPrerecordedSpeech* FMCPrerecordedSpeech_POSITIVE_JINGLE = nil;
FMCPrerecordedSpeech* FMCPrerecordedSpeech_NEGATIVE_JINGLE = nil;

NSMutableArray* FMCPrerecordedSpeech_values = nil;

@implementation FMCPrerecordedSpeech

+(FMCPrerecordedSpeech*) valueOf:(NSString*) value {
    for (FMCPrerecordedSpeech* item in FMCPrerecordedSpeech.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCPrerecordedSpeech_values == nil) {
        FMCPrerecordedSpeech_values = [[NSMutableArray alloc] initWithObjects:
                FMCPrerecordedSpeech.HELP_JINGLE,
                FMCPrerecordedSpeech.INITIAL_JINGLE,
                FMCPrerecordedSpeech.LISTEN_JINGLE,
                FMCPrerecordedSpeech.POSITIVE_JINGLE,
                FMCPrerecordedSpeech.NEGATIVE_JINGLE,
                nil];
    }
    return FMCPrerecordedSpeech_values;
}

+(FMCPrerecordedSpeech*) HELP_JINGLE {
    if (FMCPrerecordedSpeech_HELP_JINGLE == nil) {
        FMCPrerecordedSpeech_HELP_JINGLE = [[FMCPrerecordedSpeech alloc] initWithValue:@"HELP_JINGLE"];
    }
    return FMCPrerecordedSpeech_HELP_JINGLE;
}

+(FMCPrerecordedSpeech*) INITIAL_JINGLE {
    if (FMCPrerecordedSpeech_INITIAL_JINGLE == nil) {
        FMCPrerecordedSpeech_INITIAL_JINGLE = [[FMCPrerecordedSpeech alloc] initWithValue:@"INITIAL_JINGLE"];
    }
    return FMCPrerecordedSpeech_INITIAL_JINGLE;
}

+(FMCPrerecordedSpeech*) LISTEN_JINGLE {
    if (FMCPrerecordedSpeech_LISTEN_JINGLE == nil) {
        FMCPrerecordedSpeech_LISTEN_JINGLE = [[FMCPrerecordedSpeech alloc] initWithValue:@"LISTEN_JINGLE"];
    }
    return FMCPrerecordedSpeech_LISTEN_JINGLE;
}

+(FMCPrerecordedSpeech*) POSITIVE_JINGLE {
    if (FMCPrerecordedSpeech_POSITIVE_JINGLE == nil) {
        FMCPrerecordedSpeech_POSITIVE_JINGLE = [[FMCPrerecordedSpeech alloc] initWithValue:@"POSITIVE_JINGLE"];
    }
    return FMCPrerecordedSpeech_POSITIVE_JINGLE;
}

+(FMCPrerecordedSpeech*) NEGATIVE_JINGLE {
    if (FMCPrerecordedSpeech_NEGATIVE_JINGLE == nil) {
        FMCPrerecordedSpeech_NEGATIVE_JINGLE = [[FMCPrerecordedSpeech alloc] initWithValue:@"NEGATIVE_JINGLE"];
    }
    return FMCPrerecordedSpeech_NEGATIVE_JINGLE;
}

@end
