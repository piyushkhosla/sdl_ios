//
//  FMCIAPSessionDelegate.h
//  AppLink
//

#import <Foundation/Foundation.h>
@class FMCIAPSession;

@protocol FMCIAPSessionDelegate

- (void)onSessionInitializationCompleteForSession:(FMCIAPSession *)session;
- (void)onSessionStreamsEnded:(FMCIAPSession *)session;

@end
