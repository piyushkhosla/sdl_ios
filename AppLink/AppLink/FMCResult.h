//  FMCResult.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * Defines the possible result codes returned by SYNC to the application in a
 * Response to a requested operation
 * <p>
 *
 * Avaliable since <font color=red><b> AppLink 1.0 </b></font>
 */
@interface FMCResult : FMCEnum {}

/*!
 @abstract get FMCResult according value string
 @param value NSString
 @result FMCResult object
 */
+(FMCResult*) valueOf:(NSString*) value;
/*!
 @abstract declare an array to store all possible FMCResult values
 @result return the array
 */
+(NSMutableArray*) values;

/**
 * @abstract The request succeeded
 * @result return the result code of <font color=gray><i> SUCCESS </i></font>
 */
+(FMCResult*) SUCCESS;
/**
 * @abstract Result code : Invalid Data
 * @discussion The data sent is invalid. For example:<br/>
 * <ul>
 * <li>Invalid Json syntax</li>
 * <li>Parameters out of bounds (number or enum range)</li>
 * <li>Mandatory parameters not provided</li>
 * <li>Parameter provided with wrong type</li>
 * <li>Invalid characters</li>
 * <li>Empty string</li>
 * </ul>
 * @result return the result code of <font color=gray><i> INVALID_DATA </i></font>
 */
+(FMCResult*) INVALID_DATA;
/**
 * @abstract The request is not supported by SYNC
 * @result return the result code of <font color=gray><i> UNSUPPORTED_REQUEST </i></font>
 */
+(FMCResult*) UNSUPPORTED_REQUEST;
/**
 * @abstract The system could not process the request because the necessary memory
 * couldn't be allocated
 * @result return the result code of <font color=gray><i> OUT_OF_MEMORY </i></font>
 */
+(FMCResult*) OUT_OF_MEMORY;
/**
 * @abstract There are too many requests pending (means that the response has not been
 * delivered yet). There is a limit of 1000 pending requests at a time
 * @result return the result code of <font color=gray><i> TOO_MANY_PENDING_REQUESTS </i></font>
 */
+(FMCResult*) TOO_MANY_PENDING_REQUESTS;
/**
 * @abstract One of the provided IDs is not valid.
 * @discussion For example:<br/>
 * <ul>
 * <li>CorrelationID</li>
 * <li>CommandID</li>
 * <li>MenuID</li>
 * </ul>
 * @result return the result code of <font color=gray><i> INVALID_ID </i></font>
 */
+(FMCResult*) INVALID_ID;
/**
 * @abstract The provided name or synonym is a duplicate of some already-defined name
 * or synonym.
 * @result return the result code of <font color=gray><i> DUPLICATE_NAME </i></font>
 */
+(FMCResult*) DUPLICATE_NAME;
/**
 * @abstract Specified application name is already associated with an active interface
 * registration. Attempts at doing a second <i>
 * RegisterAppInterface</i> on a
 * given protocol session will also cause this result.
 * @result return the result code of <font color=gray><i> TOO_MANY_APPLICATIONS </i></font>
 */
+(FMCResult*) TOO_MANY_APPLICATIONS;
/**
 * @abstract SYNC does not support the interface version requested by the mobile
 * application.
 * @result return the result code of <font color=gray><i> APPLICATION_REGISTERED_ALREADY </i></font>
 */
+(FMCResult*) APPLICATION_REGISTERED_ALREADY;
/**
 * @abstract The requested language is currently not supported. Might be because of a
 * mismatch of the currently active language.
 * @result return the result code of <font color=gray><i> UNSUPPORTED_VERSION </i></font>
 */
+(FMCResult*) UNSUPPORTED_VERSION;
/**
 * @abstract The request cannot be executed because no application interface has been
 * registered via 
 * <i>RegisterAppInterface</i>
 * @result return the result code of <font color=gray><i> WRONG_LANGUAGE </i></font>
 */
+(FMCResult*) WRONG_LANGUAGE;
/**
 * @abstract The request cannot be executed because no application interface has been
 * registered via <i>
 * RegisterAppInterface</i>
 * @result return the result code of <font color=gray><i> APPLICATION_NOT_REGISTERED </i></font>
 */
+(FMCResult*) APPLICATION_NOT_REGISTERED;
/**
 * @abstract The data may not be changed, because it is currently in use. For example,
 * when trying to delete a Choice Set that is currently involved in an
 * interaction.
 * @result return the result code of <font color=gray><i> IN_USE </i></font>
 */
+(FMCResult*) IN_USE;
/**
 * @abstract There is already an existing subscription for this item.
 * @result return the result code of <font color=gray><i> VEHICLE_DATA_NOT_ALLOWED </i></font>
 */
+(FMCResult*) VEHICLE_DATA_NOT_ALLOWED;
/*!
 @result return the result code of <font color=gray><i> VEHICLE_DATA_NOT_AVAILABLE </i></font>
 */
+(FMCResult*) VEHICLE_DATA_NOT_AVAILABLE;
/**
 * @abstract The requested operation was rejected. No attempt was made to perform the
 * operation.
 * @result return the result code of <font color=gray><i> REJECTED </i></font>
 */
+(FMCResult*) REJECTED;

/*!
 @abstract The requested operation was aborted due to some pre-empting event (e.g. button push, <i>Alert</i>, pre-empts <i>Speak</i>, etc.)
 @result return the result code of <font color=gray><i> ABORTED </i></font>
 */
+(FMCResult*) ABORTED;
/**
 * @abstract The requested operation was ignored because it was determined to be
 * redundant (e.g. pause media clock when already paused).
 * @result return the result code of <font color=gray><i> IGNORED </i></font>
 */
+(FMCResult*) IGNORED;
/**
 * @abstract A button that was requested for subscription is not supported on the
 * currently connected SYNC platform. See DisplayCapabilities for further
 * information on supported buttons on the currently connected SYNC platform
 * @result return the result code of <font color=gray><i> UNSUPPORTED_RESOURCE </i></font>
 */
+(FMCResult*) UNSUPPORTED_RESOURCE;
/*!
 @result return the result code of <font color=gray><i> FILE_NOT_FOUND </i></font>
 */
+(FMCResult*) FILE_NOT_FOUND;
/*!
 @result return the result code of <font color=gray><i> GENERIC_ERROR </i></font>
 */
+(FMCResult*) GENERIC_ERROR;
/*!
 @result return the result code of <font color=gray><i> DISALLOWED </i></font>
 */
+(FMCResult*) DISALLOWED;
/*!
 @result return the result code of <font color=gray><i> USER_DISALLOWED </i></font>
 */
+(FMCResult*) USER_DISALLOWED;
/*!
 @result return the result code of <font color=gray><i> TIMED_OUT </i></font>
 */
+(FMCResult*) TIMED_OUT;
/*!
 @result return the result code of <font color=gray><i> CANCEL_ROUTE </i></font>
 */
+(FMCResult*) CANCEL_ROUTE;
/*!
 @result return the result code of <font color=gray><i> TRUNCATED_DATA </i></font>
 */
+(FMCResult*) TRUNCATED_DATA;
/*!
 @result return the result code of <font color=gray><i> RETRY </i></font>
 */
+(FMCResult*) RETRY;
/*!
 @result return the result code of <font color=gray><i> WARNINGS </i></font>
 */
+(FMCResult*) WARNINGS;

@end
