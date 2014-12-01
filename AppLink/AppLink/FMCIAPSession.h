//
//  FMCIAPSession.h
//  AppLink
//
//  Copyright (c) 2014 FMC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ExternalAccessory/ExternalAccessory.h>
#import "FMCIAPSessionDelegate.h"
#import "FMCStreamDelegate.h"

static const NSUInteger FMCIAPSessionRead = 1;
static const NSUInteger FMCIAPSessionWrite = 1 << 1;

@interface FMCIAPSession : NSObject

@property (strong, atomic) EAAccessory *accessory;
@property (strong, atomic) NSString *protocol;
@property (strong, atomic) EASession *easession;
@property (weak) id<FMCIAPSessionDelegate> delegate;
@property (strong, atomic) FMCStreamDelegate *streamDelegate;

- (instancetype)initWithAccessory:(EAAccessory *)accessory
                      forProtocol:(NSString *)protocol;

- (BOOL)open:(NSUInteger)mode;
- (void)close;

@end
