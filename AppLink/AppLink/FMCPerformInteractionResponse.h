//  FMCPerformInteractionResponse.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

#import <AppLink/FMCTriggerSource.h>

/**
 * PerformInteraction Response is sent, when FMCPerformInteraction has been called
 *
 * Since AppLink 1.0
 */
@interface FMCPerformInteractionResponse : FMCRPCResponse {}

/**
 * @abstract Constructs a new FMCPerformInteractionResponse object
 */
-(id) init;
/**
 * @abstract Constructs a new FMCPerformInteractionResponse object indicated by the NSMutableDictionary parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract The application-scoped identifier that uniquely identifies this choice.
 * <br/>choiceID Min: 0  Max: 65535
 */
@property(assign) NSNumber* choiceID;
/**
 * @abstract A <I>TriggerSource</I> object which will be shown in the HMI</p>
 */
@property(assign) FMCTriggerSource* triggerSource;

@end
