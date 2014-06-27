//
//  FMCURLConnection.m
//  SyncProxyTester
//
//  From: http://stackoverflow.com/questions/1192294/cocoa-checks-required-for-multiple-asynchronous-nsurlconnections-using-same-del

#import "FMCURLConnection.h"

@implementation FMCURLConnection

- (id)initWithRequest:(NSURLRequest *)request delegate:(id)delegate andTag:(NSString *)tag {
    NSAssert(self != nil, @"self is nil!");

    // Initialize the ivars before initializing with the request
    // because the connection is asynchronous and may start
    // calling the delegates before we even return from this
    // function.
    self.tag = tag;
    self.response = nil;
    self.responseData = nil;

    self = [super initWithRequest:request delegate:delegate];
    return self;
}
@end
