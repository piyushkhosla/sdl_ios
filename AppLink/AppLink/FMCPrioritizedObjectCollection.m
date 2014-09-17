//
//  FMCPrioritizedOutputCollection.m
//  AppLink
//

#import "FMCPrioritizedObjectCollection.h"
#import "FMCObjectWithPriority.h"
#import "FMCDebugTool.h"//fortesting

@interface FMCPrioritizedObjectCollection ()
{
    NSMutableArray *privateArray;
}
@end


@implementation FMCPrioritizedObjectCollection

- (instancetype)init
{
    self = [super init];
    if (self) {
        privateArray = [NSMutableArray new];
    }
    return self;
}

- (void)addObject:(id)object withPriority:(NSInteger)priority
{
    if (object == nil || [[NSNull null] isEqual:object]) {
        return;
    }

    FMCObjectWithPriority *newWrapper = [FMCObjectWithPriority new];
    newWrapper.object = object;
    newWrapper.priority = priority;

    @synchronized(privateArray)
    {
        // Find correct place to insert.
        // Sorted in descending order.
        BOOL lowerPriorityFound = NO;
        NSInteger currentCount = privateArray.count;
        for (int x = 0; x < currentCount; x++) {
            FMCObjectWithPriority *o = privateArray[x];
            if (o.priority <= priority) {
                lowerPriorityFound = YES;
                [privateArray insertObject:newWrapper atIndex:x];
                break;
            }
        }
        if (!lowerPriorityFound) {
            [privateArray addObject:newWrapper];
        }

    }

}

- (id)nextObject
{
    if (privateArray.count == 0) {
        return nil;
    }

    FMCObjectWithPriority *obj = nil;
    @synchronized(privateArray)
    {
        obj = (FMCObjectWithPriority *)[privateArray lastObject];
        [privateArray removeLastObject];
    }

    return obj.object;
}

@end
