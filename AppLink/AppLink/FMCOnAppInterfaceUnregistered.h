//  FMCOnAppInterfaceUnregistered.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCNotification.h>

#import <AppLink/FMCAppInterfaceUnregisteredReason.h>

/**
 * Notifies an application that its interface registration has been terminated. This means that all SYNC resources
 * associated with the application are discarded, including the Command Menu, Choice Sets, button subscriptions, etc.<br>
 * For more information about SYNC resources related to an interface registration, see <i>FMCRegisterAppInterface</i>.
 * <p></p>
 * <b>HMI Status Requirements:</b>
 * <ul>
 * HMILevel:
 * <ul><li>Any</li></ul>
 * AudioStreamingState:
 * <ul><li>Any</li></ul>
 * SystemContext:
 * <ul><li>Any</li></ul>
 * </ul>
 * <p>
 * <b>Parameter List:</b>
 * <table  border="1" rules="all">
 * <tr>
 * <th>Name</th>
 * <th>Type</th>
 * <th>Description</th>
 * <th>Applink Ver Available</th>
 * </tr>
 * <tr>
 * <td>reason</td>
 * <td>FMCAppInterfaceUnregisteredReason *</td>
 * <td>The reason the application's interface registration was terminated</td>
 * <td>AppLink 1.0</td>
 * </tr>
 * </table>
 * </p>
 * Since <b>AppLink 1.0</b><br>
 * see FMCRegisterAppInterface
 */
@interface FMCOnAppInterfaceUnregistered : FMCRPCNotification {}

/**
 *Constructs a newly allocated FMCOnAppInterfaceUnregistered object
 */
-(id) init;
/**
 *<p>Constructs a newly allocated FMCOnAppInterfaceUnregistered object indicated by the NSMutableDictionary parameter</p>
 *@param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract the reason application's interface was terminated
 * @discussion
 */
@property(strong) FMCAppInterfaceUnregisteredReason* reason;

@end
