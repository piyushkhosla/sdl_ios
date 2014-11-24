//
//  FMCStreamDelegate.h
//  AppLink
//
//  Copyright (c) 2014 FMC. All rights reserved.
//

#import <Foundation/Foundation.h>

// Convenience typedefs
typedef void (^FMCStreamOpenHandler)(NSStream *stream);
typedef void (^FMCStreamHasBytesHandler)(NSInputStream *istream);
typedef void (^FMCStreamHasSpaceHandler)(NSOutputStream *ostream);
typedef void (^FMCStreamErrorHandler)(void);
typedef void (^FMCStreamEndHandler)(void);



@interface FMCStreamDelegate : NSObject<NSStreamDelegate>

@property (nonatomic, copy) FMCStreamOpenHandler streamOpenHandler;
@property (nonatomic, copy) FMCStreamHasBytesHandler streamHasBytesHandler;
@property (nonatomic, copy) FMCStreamHasSpaceHandler streamHasSpaceHandler;
@property (nonatomic, copy) FMCStreamErrorHandler streamErrorHandler;
@property (nonatomic, copy) FMCStreamEndHandler streamEndHandler;

@end
