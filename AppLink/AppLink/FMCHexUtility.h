//
//  FMCHexUtility.h
//  AppLink
//

#import <Foundation/Foundation.h>

@interface FMCHexUtility : NSObject

+ (NSString *)getHexString:(UInt8 *)bytes length:(int)length;
+ (NSString *)getHexString:(NSData *)data;

@end
