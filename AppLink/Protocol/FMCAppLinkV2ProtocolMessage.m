//
//  FMCAppLinkV2ProtocolMessage.m
//  SyncProxyTester
//

#import "FMCAppLinkV2ProtocolMessage.h"
#import "FMCRPCPayload.h"
#import "FMCJsonDecoder.h"
#import "FMCFunctionID.h"
#import "FMCNames.h"


@implementation FMCAppLinkV2ProtocolMessage

- (id)initWithHeader:(FMCAppLinkProtocolHeader*)header andPayload:(NSData *)payload {
	if (self = [self init]) {
        self.header = header;
        self.payload = payload;
	}
	return self;
}

// Convert RPC payload to dictionary (for consumption by RPC layer)
- (NSDictionary *)rpcDictionary {
    // Only applicable to RPCs
    if (self.header.serviceType != FMCServiceType_RPC) {
        return nil;
    }


    NSMutableDictionary* rpcMessageAsDictionary = [[NSMutableDictionary alloc] init];

    // Parse the payload as RPC struct
    FMCRPCPayload *rpcPayload = [FMCRPCPayload rpcPayloadWithData:self.payload];

    // Get the json data from the struct
    NSDictionary *jsonDictionary = [[FMCJsonDecoder instance] decode:rpcPayload.jsonData];

    // Create the inner dictionary with the RPC properties
    NSMutableDictionary *innerDictionary = [[NSMutableDictionary alloc] init];
    NSString *functionName = [[[FMCFunctionID alloc] init] getFunctionName:rpcPayload.functionID];
    [innerDictionary setObject:functionName forKey:NAMES_operation_name];
    [innerDictionary setObject:[NSNumber numberWithInt:rpcPayload.correlationID] forKey:NAMES_correlationID];
    [innerDictionary setObject:jsonDictionary forKey:NAMES_parameters];

    // Store it in the containing dictionary
    UInt8 rpcType = rpcPayload.rpcType;
    NSArray *rpcTypeNames = @[NAMES_request, NAMES_response, NAMES_notification];
    [rpcMessageAsDictionary setObject:innerDictionary forKey:rpcTypeNames[rpcType]];

    // The bulk data also goes in the dictionary
    if (rpcPayload.binaryData) {
        [rpcMessageAsDictionary setObject:rpcPayload.binaryData forKey:NAMES_bulkData];
    }

    return rpcMessageAsDictionary;

}
@end
