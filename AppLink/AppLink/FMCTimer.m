//
//  FMCTimer.m
//  AppLink
//

#import "FMCTimer.h"


@interface FMCTimer ()

@property (strong) NSTimer *timer;
@property (assign) BOOL timerRunning;

@end


@implementation FMCTimer

- (id)init
{
    if (self = [super init]) {
        self.duration = 0;
        self.timerRunning = NO;
    }
    return self;
}

- (id)initWithDuration:(float)duration
{
    if (self = [super init]) {
        self.duration = duration;
        self.timerRunning = NO;
    }
    return self;
}

- (void)start
{
    if (self.duration > 0) {
        [self stopAndDestroyTimer];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:self.duration target:self selector:@selector(timerElapsed) userInfo:nil repeats:NO];
        self.timerRunning = YES;
    }
}

- (void)cancel
{
    [self stopAndDestroyTimer];
    if (self.timerRunning && self.canceledBlock != nil) {
        self.canceledBlock();
    }
    self.timerRunning = NO;
}

- (void)timerElapsed
{
    [self stopAndDestroyTimer];
    if (self.elapsedBlock != nil) {
        self.elapsedBlock();
    }
    self.timerRunning = NO;
}

-(void)stopAndDestroyTimer {
    if (self.timer != nil) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

@end
