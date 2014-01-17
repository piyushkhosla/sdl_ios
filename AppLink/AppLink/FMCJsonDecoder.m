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

-(NSDictionary*) decode:(NSData*) msgBytes{
	NSError* error;
    NSDictionary* jsonObject = [NSJSONSerialization JSONObjectWithData:msgBytes options:kNilOptions error:&error];
    
	return jsonObject;
}

@end
