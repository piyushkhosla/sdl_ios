//
//  FMCURLConnection.h
//  SyncProxyTester
//

#import <Foundation/Foundation.h>

@interface FMCURLConnection : NSURLConnection

@property (strong) NSString *tag;
@property (strong) NSHTTPURLResponse *response;
@property (strong) NSMutableData *responseData;

- (id)initWithRequest:(NSURLRequest *)request delegate:(id)delegate andTag:(NSString *)tag;

@end
