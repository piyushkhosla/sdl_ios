//  FMCUnsubscribeButton.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/FMCButtonName.h>

/**
 * Deletes a subscription to button notifications for the specified button. For
 * more information about button subscriptions, see FMCSubscribeButton
 * <p>
 * Application can unsubscribe from a button that is currently being pressed
 * (i.e. has not yet been released), but app will not get button event
 * <p>
 * <b>HMILevel needs to be FULL, LIMITED or BACKGROUND</b>
 * <p>
 *
 * Since AppLink 1.0<br/>
 * See FMCSubscribeButton
 */
@interface FMCUnsubscribeButton : FMCRPCRequest {}

/**
 * @abstract Constructs a new FMCUnsubscribeButton object
 */
-(id) init;
/**
 * @abstract Constructs a new FMCUnsubscribeButton object indicated by the NSMutableDictionary
 * parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract A name of the button to unsubscribe from
 * @discussion An Enumeration value, see <i>
 *         FMCButtonName</i>
 */
@property(assign) FMCButtonName* buttonName;

@end
