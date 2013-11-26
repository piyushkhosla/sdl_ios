//  FMCEnum.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>

@interface FMCEnum : NSObject {
	NSString* value;
}

-(id) initWithValue:(NSString*) value;

@property(readonly) NSString* value;

@end
