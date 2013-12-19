//  FMCUnregisterAppInterface.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

/**
 * Terminates an application's interface registration. This causes SYNC&reg; to
 * dispose of all resources associated with the application's interface
 * registration (e.g. Command Menu items, Choice Sets, button subscriptions,
 * etc.)
 * <p>
 * After the UnregisterAppInterface operation is performed, no other operations
 * can be performed until a new app interface registration is established by
 * calling <i>{@linkplain RegisterAppInterface}</i>
 * <p>
 * <b>HMILevel can be FULL, LIMITED, BACKGROUND or NONE</b>
 * </p>
 *
 * See FMCRegisterAppInterface FMCOnAppInterfaceUnregistered
 */
@interface FMCUnregisterAppInterface : FMCRPCRequest {}

/**
 * @abstract Constructs a new FMCUnregisterAppInterface object
 */
-(id) init;
/**
 * @abstract Constructs a new FMCUnregisterAppInterface object indicated by the NSMutableDictionary
 * parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
