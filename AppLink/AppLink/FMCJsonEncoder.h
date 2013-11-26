//  FMCJsonEncoder.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEncoder.h>

@interface FMCJsonEncoder : NSObject<FMCEncoder> {}

+(NSObject<FMCEncoder>*) instance;

@end
