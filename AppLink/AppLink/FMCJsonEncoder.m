//  FMCJsonEncoder.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCJsonEncoder.h>

#import <AppLink/FMCNames.h>

@implementation FMCJsonEncoder

static NSObject<FMCEncoder>* jsonEncoderInstance;

+(NSObject<FMCEncoder>*) instance {
	if (jsonEncoderInstance == nil) {
		jsonEncoderInstance = [[FMCJsonEncoder alloc] init];
	}
	return jsonEncoderInstance;
}

-(NSData*) encodeDictionary:(NSDictionary*) dict {
    NSError* error;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:&error];
    
    return jsonData;
}

@end
