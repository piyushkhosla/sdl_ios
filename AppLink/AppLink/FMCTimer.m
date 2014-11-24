//
//  FMCTimer.m
//  AppLink
//

#import "FMCTimer.h"


@interface FMCTimer ()

@property (strong) NSTimer *timer;

@end


@implementation FMCTimer

- (id)initWithDuration:(float)duration
{
    if (self = [super init]) {
        self.duration = duration;
    }
    return self;
}

- (void)start
{
    
}

- (void)cancel
{
    
}

- (void)timerElapsed
{
    
}

@end
