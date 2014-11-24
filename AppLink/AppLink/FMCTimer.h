//
//  FMCTimer.h
//  AppLink
//
//  Copyright (c) 2014 FMC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMCTimer : NSObject

@property (assign) void (^elapsedBlock)(void);
@property (assign) void (^canceledBlock)(void);
@property (assign) float duration;

- (id)init;
- (id)initWithDuration:(float)duration;
- (void)start;
- (void)cancel;

@end
