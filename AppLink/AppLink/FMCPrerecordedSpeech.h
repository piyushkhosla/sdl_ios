//
//  FMCPrerecordedSpeech.h
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCPrerecordedSpeech : FMCEnum

+ (NSMutableArray*)values;
+ (FMCPrerecordedSpeech*)valueOf:(NSString*) value;
+ (FMCPrerecordedSpeech*)HELP_JINGLE;
+ (FMCPrerecordedSpeech*)INITIAL_JINGLE;
+ (FMCPrerecordedSpeech*)LISTEN_JINGLE;
+ (FMCPrerecordedSpeech*)POSITIVE_JINGLE;
+ (FMCPrerecordedSpeech*)NEGATIVE_JINGLE;

@end
