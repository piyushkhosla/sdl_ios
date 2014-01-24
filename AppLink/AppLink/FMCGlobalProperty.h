//  FMCGlobalProperty.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * Properties of a user-initiated VR interaction (i.e. interactions started by the user pressing the PTT button).
 *
 * This enum is avaliable since <font color=red><b> AppLink 1.0 </b></font>
 */
@interface FMCGlobalProperty : FMCEnum {}

/**
 * Convert String to FMCGlobalProperty
 * @param value String
 * @return FMCGlobalProperty
 */
+(FMCGlobalProperty*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCGlobalProperty
 @result return an array that store all possible FMCGlobalProperty
 */
+(NSMutableArray*) values;

/**
 * @abstract The help prompt to be spoken if the user needs assistance during a user-initiated interaction.
 * @result return a FMCGlobalProperty with value of <font color=gray><i> HELPPROMPT </i></font>
 */
+(FMCGlobalProperty*) HELPPROMPT;
/**
 * @abstract The prompt to be spoken if the user-initiated interaction times out waiting for the user's verbal input.
 * @result return a FMCGlobalProperty with value of <font color=gray><i> TIMEOUTPROMPT </i></font>
 */
+(FMCGlobalProperty*) TIMEOUTPROMPT;
+(FMCGlobalProperty*) VRHELPTITLE;
+(FMCGlobalProperty*) VRHELPITEMS;

@end
