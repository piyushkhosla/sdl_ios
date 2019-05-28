//
//  SDLDeleteWindowResponse.m
//

#import "SDLDeleteWindowResponse.h"
#import "NSMutableDictionary+Store.h"
#import "SDLRPCParameterNames.h"
#import "SDLRPCFunctionNames.h"

@implementation SDLDeleteWindowResponse

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
- (instancetype)init {
    if (self = [super initWithName:SDLRPCFunctionNameDeleteWindow]) {
    }
    return self;
}
#pragma clang diagnostic pop

@end
