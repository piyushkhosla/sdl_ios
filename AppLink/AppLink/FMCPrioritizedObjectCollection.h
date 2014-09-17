//
//  FMCPrioritizedOutputCollection.h
//  AppLink
//

#import <Foundation/Foundation.h>

@interface FMCPrioritizedObjectCollection : NSObject

- (void)addObject:(id)object withPriority:(NSInteger)priority;
- (id)nextObject;

@end
