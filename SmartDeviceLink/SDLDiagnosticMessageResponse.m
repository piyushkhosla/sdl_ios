//  SDLDiagnosticMessageResponse.m
//

#import "SDLDiagnosticMessageResponse.h"

#import "SDLNames.h"

@implementation SDLDiagnosticMessageResponse

- (instancetype)init {
    if (self = [super initWithName:SDLNameDiagnosticMessage]) {
    }
    return self;
}

- (void)setMessageDataResult:(NSMutableArray<NSNumber<SDLInt> *> *)messageDataResult {
    if (messageDataResult != nil) {
        [parameters setObject:messageDataResult forKey:SDLNameMessageDataResult];
    } else {
        [parameters removeObjectForKey:SDLNameMessageDataResult];
    }
}

- (NSMutableArray<NSNumber<SDLInt> *> *)messageDataResult {
    return [parameters objectForKey:SDLNameMessageDataResult];
}

@end
