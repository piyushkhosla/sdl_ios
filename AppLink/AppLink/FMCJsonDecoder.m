//  FMCJsonDecoder.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCJsonDecoder.h>

#import <AppLink/FMCNames.h>

@implementation FMCJsonDecoder

static NSObject<FMCDecoder>* jsonDecoderInstance;

+(NSObject<FMCDecoder>*) instance {
	if (jsonDecoderInstance == nil) {
		jsonDecoderInstance = [[FMCJsonDecoder alloc] init];
	}
	return jsonDecoderInstance;
}

- (NSDictionary *)decode:(NSData *)data {

    if(data == nil) {
        NSLog(@"Warning: No JSON data to decode.");
        return nil;
    }

    if(data.length == 0) {
        NSLog(@"Warning: Cannot decode 0 length data.");
        return nil;
    }


	NSError* error;
    NSDictionary* jsonObject = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
	return jsonObject;
}

@end
