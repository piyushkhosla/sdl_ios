//
//  FMCDataStreamHandlingDelegate.h
//  AppLink
//

#import <Foundation/Foundation.h>
#import "FMCAbstractProtocol.h"

@interface FMCDataStreamHandlingDelegate : NSObject <NSStreamDelegate>

@property (assign) FMCServiceType serviceType;
@property (strong, nonatomic) FMCAbstractProtocol *protocol;

@end
