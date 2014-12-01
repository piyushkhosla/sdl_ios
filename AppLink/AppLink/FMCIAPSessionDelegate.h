//
//  FMCIAPSessionDelegate.h
//  AppLink
//

#import <Foundation/Foundation.h>

@protocol FMCIAPSessionDelegate

- (void)onSessionInitializationComplete:(BOOL)success;

@end
