//
//  FMCIAPSessionDelegate.h
//  AppLink
//

#import <Foundation/Foundation.h>
@class FMCIAPSession;

@protocol FMCIAPSessionDelegate

- (void)onSessionInitializationComplete:(BOOL)success forSession:(FMCIAPSession *)session;
- (void)onSessionStreamsEnded:(FMCIAPSession *)session;

@end
