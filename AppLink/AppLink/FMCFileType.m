//  FMCFileType.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCFileType.h>

FMCFileType* FMCFileType_GRAPHIC_BMP = nil;
FMCFileType* FMCFileType_GRAPHIC_JPEG = nil;
FMCFileType* FMCFileType_GRAPHIC_PNG = nil;
FMCFileType* FMCFileType_AUDIO_WAVE = nil;
FMCFileType* FMCFileType_AUDIO_MP3 = nil;
FMCFileType* FMCFileType_AUDIO_AAC = nil;
FMCFileType* FMCFileType_BINARY = nil;
FMCFileType* FMCFileType_JSON = nil;

NSMutableArray* FMCFileType_values = nil;

@implementation FMCFileType

+(FMCFileType*) valueOf:(NSString*) value {
    for (FMCFileType* item in FMCFileType.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCFileType_values == nil) {
        FMCFileType_values = [[NSMutableArray alloc] initWithObjects:
                FMCFileType.GRAPHIC_BMP,
                FMCFileType.GRAPHIC_JPEG,
                FMCFileType.GRAPHIC_PNG,
                FMCFileType.AUDIO_WAVE,
                FMCFileType.AUDIO_MP3,
                FMCFileType.AUDIO_AAC,
                FMCFileType.BINARY,
                FMCFileType.JSON,
                nil];
    }
    return FMCFileType_values;
}

+(FMCFileType*) GRAPHIC_BMP {
    if (FMCFileType_GRAPHIC_BMP == nil) {
        FMCFileType_GRAPHIC_BMP = [[FMCFileType alloc] initWithValue:@"GRAPHIC_BMP"];
    }
    return FMCFileType_GRAPHIC_BMP;
}

+(FMCFileType*) GRAPHIC_JPEG {
    if (FMCFileType_GRAPHIC_JPEG == nil) {
        FMCFileType_GRAPHIC_JPEG = [[FMCFileType alloc] initWithValue:@"GRAPHIC_JPEG"];
    }
    return FMCFileType_GRAPHIC_JPEG;
}

+(FMCFileType*) GRAPHIC_PNG {
    if (FMCFileType_GRAPHIC_PNG == nil) {
        FMCFileType_GRAPHIC_PNG = [[FMCFileType alloc] initWithValue:@"GRAPHIC_PNG"];
    }
    return FMCFileType_GRAPHIC_PNG;
}

+(FMCFileType*) AUDIO_WAVE {
    if (FMCFileType_AUDIO_WAVE == nil) {
        FMCFileType_AUDIO_WAVE = [[FMCFileType alloc] initWithValue:@"AUDIO_WAVE"];
    }
    return FMCFileType_AUDIO_WAVE;
}

+(FMCFileType*) AUDIO_MP3 {
    if (FMCFileType_AUDIO_MP3 == nil) {
        FMCFileType_AUDIO_MP3 = [[FMCFileType alloc] initWithValue:@"AUDIO_MP3"];
    }
    return FMCFileType_AUDIO_MP3;
}

+(FMCFileType*) AUDIO_AAC {
    if (FMCFileType_AUDIO_AAC == nil) {
        FMCFileType_AUDIO_AAC = [[FMCFileType alloc] initWithValue:@"AUDIO_AAC"];
    }
    return FMCFileType_AUDIO_AAC;
}

+(FMCFileType*) BINARY {
    if (FMCFileType_BINARY == nil) {
        FMCFileType_BINARY = [[FMCFileType alloc] initWithValue:@"BINARY"];
    }
    return FMCFileType_BINARY;
}

+(FMCFileType*) JSON {
    if (FMCFileType_JSON == nil) {
        FMCFileType_JSON = [[FMCFileType alloc] initWithValue:@"JSON"];
    }
    return FMCFileType_JSON;
}

@end
