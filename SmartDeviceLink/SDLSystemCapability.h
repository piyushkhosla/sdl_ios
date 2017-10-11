//
//  SDLSystemCapability.h
//  SmartDeviceLink-iOS
//
//  Created by Joel Fischer on 7/10/17.
//  Copyright © 2017 smartdevicelink. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SDLRPCStruct.h"

@class SDLPhoneCapability;
@class SDLNavigationCapability;
@class SDLSystemCapabilityType;
@class SDLVideoStreamingCapability;
@class SDLRemoteControlCapabilities;

/**
 The systemCapabilityType indicates which type of data should be changed and identifies which data object exists in this struct. For example, if the SystemCapability Type is NAVIGATION then a "navigationCapability" should exist.
 * First implemented in SDL Core v4.4
 */
@interface SDLSystemCapability : SDLRPCStruct

- (instancetype)initWithNavigationCapability:(SDLNavigationCapability *)capability;

- (instancetype)initWithPhoneCapability:(SDLPhoneCapability *)capability;

- (instancetype)initWithVideoStreamingCapability:(SDLVideoStreamingCapability *)capability;

- (instancetype)initWithRemoteControlCapability:(SDLRemoteControlCapabilities *)capability;

/**
 * @abstract The major version indicates versions that is not-compatible to previous versions
 *
 * Required, SDLSystemCapabilityType
 */
@property (strong, nonatomic) SDLSystemCapabilityType *systemCapabilityType;

/**
 * @abstract The minor version indicates a change to a previous version that should still allow to be run on an older version (with limited functionality)
 *
 * Optional, SDLNavigationCapability
 */
@property (strong, nonatomic) SDLNavigationCapability *navigationCapability;

/**
 * @abstract The minor version indicates a change to a previous version that should still allow to be run on an older version (with limited functionality)
 *
 * Optional, SDLPhoneCapability
 */
@property (strong, nonatomic) SDLPhoneCapability *phoneCapability;

@property (strong, nonatomic) SDLVideoStreamingCapability *videoStreamingCapability;

/**
 * @abstract The minor version indicates a change to a previous version that should still allow to be run on an older version (with limited functionality)
 *
 * Optional, SDLRemoteControlCapabilities
 */
@property (strong, nonatomic) SDLRemoteControlCapabilities *remoteControlCapability;

@end
