//  SmartDeviceLink.h
//

#import <UIKit/UIKit.h>

//! Project version number for SmartDeviceLink.
FOUNDATION_EXPORT double SmartDeviceLinkVersionNumber;

//! Project version string for SmartDeviceLink.
FOUNDATION_EXPORT const unsigned char SmartDeviceLinkVersionString[];

/**** Utilities *****/
#import "SDLJingle.h"

/***** Proxy *****/
#import "SDLProxy.h"
#import "SDLProxyFactory.h"
#import "SDLProxyListener.h"
#import "SDLSecurityType.h"
#import "SDLStreamingMediaManager.h"
#import "SDLTTSChunkFactory.h"
#import "SDLTouchManager.h"
#import "SDLTouchManagerDelegate.h"

/***** Debug *****/
#import "SDLConsoleController.h"
#import "SDLDebugTool.h"
#import "SDLDebugToolConsole.h"

/***** Transport *****/
#import "SDLAbstractTransport.h"
#import "SDLIAPSessionDelegate.h"
#import "SDLIAPTransport.h"
#import "SDLTCPTransport.h"
#import "SDLTransportDelegate.h"

/***** Protocol *****/
#import "SDLAbstractProtocol.h"
#import "SDLProtocol.h"
#import "SDLProtocolListener.h"

// Header
#import "SDLProtocolHeader.h"

// Message
#import "SDLProtocolMessage.h"

/***** RPCs *****/
// Superclasses
#import "SDLEnum.h"
#import "SDLRPCMessage.h"
#import "SDLRPCNotification.h"
#import "SDLRPCRequest.h"
#import "SDLRPCResponse.h"
#import "SDLRPCStruct.h"

// Factories
#import "SDLRPCRequestFactory.h"

// Requests
#import "SDLAddCommand.h"
#import "SDLAddSubMenu.h"
#import "SDLAlert.h"
#import "SDLAlertManeuver.h"
#import "SDLChangeRegistration.h"
#import "SDLCreateInteractionChoiceSet.h"
#import "SDLDeleteCommand.h"
#import "SDLDeleteFile.h"
#import "SDLDeleteInteractionChoiceSet.h"
#import "SDLDeleteSubMenu.h"
#import "SDLDiagnosticMessage.h"
#import "SDLDialNumber.h"
#import "SDLEncodedSyncPData.h"
#import "SDLEndAudioPassThru.h"
#import "SDLGetDTCs.h"
#import "SDLGetVehicleData.h"
#import "SDLGetWayPoints.h"
#import "SDLListFiles.h"
#import "SDLPerformAudioPassThru.h"
#import "SDLPerformInteraction.h"
#import "SDLPutFile.h"
#import "SDLReadDID.h"
#import "SDLRegisterAppInterface.h"
#import "SDLResetGlobalProperties.h"
#import "SDLScrollableMessage.h"
#import "SDLSendLocation.h"
#import "SDLSetAppIcon.h"
#import "SDLSetDisplayLayout.h"
#import "SDLSetGlobalProperties.h"
#import "SDLSetMediaClockTimer.h"
#import "SDLShow.h"
#import "SDLShowConstantTBT.h"
#import "SDLSlider.h"
#import "SDLSpeak.h"
#import "SDLSubscribeButton.h"
#import "SDLSubscribeVehicleData.h"
#import "SDLSubscribeWayPoints.h"
#import "SDLSyncPData.h"
#import "SDLUnregisterAppInterface.h"
#import "SDLUnsubscribeButton.h"
#import "SDLUnsubscribeVehicleData.h"
#import "SDLUnsubscribeWayPoints.h"
#import "SDLUpdateTurnList.h"

// Responses
#import "SDLAddCommandResponse.h"
#import "SDLAddSubMenuResponse.h"
#import "SDLAlertManeuverResponse.h"
#import "SDLAlertResponse.h"
#import "SDLChangeRegistrationResponse.h"
#import "SDLCreateInteractionChoiceSetResponse.h"
#import "SDLDeleteCommandResponse.h"
#import "SDLDeleteFileResponse.h"
#import "SDLDeleteInteractionChoiceSetResponse.h"
#import "SDLDeleteSubMenuResponse.h"
#import "SDLDiagnosticMessageResponse.h"
#import "SDLDialNumberResponse.h"
#import "SDLEncodedSyncPDataResponse.h"
#import "SDLEndAudioPassThruResponse.h"
#import "SDLGenericResponse.h"
#import "SDLGetDTCsResponse.h"
#import "SDLGetVehicleDataResponse.h"
#import "SDLGetWayPointsResponse.h"
#import "SDLListFilesResponse.h"
#import "SDLPerformAudioPassThruResponse.h"
#import "SDLPerformInteractionResponse.h"
#import "SDLPutFileResponse.h"
#import "SDLReadDIDResponse.h"
#import "SDLRegisterAppInterfaceResponse.h"
#import "SDLResetGlobalPropertiesResponse.h"
#import "SDLScrollableMessageResponse.h"
#import "SDLSendLocationResponse.h"
#import "SDLSetAppIconResponse.h"
#import "SDLSetDisplayLayoutResponse.h"
#import "SDLSetGlobalPropertiesResponse.h"
#import "SDLSetMediaClockTimerResponse.h"
#import "SDLShowConstantTBTResponse.h"
#import "SDLShowResponse.h"
#import "SDLSliderResponse.h"
#import "SDLSpeakResponse.h"
#import "SDLSubscribeButtonResponse.h"
#import "SDLSubscribeVehicleDataResponse.h"
#import "SDLSubscribeWayPointsResponse.h"
#import "SDLSyncPDataResponse.h"
#import "SDLUnregisterAppInterfaceResponse.h"
#import "SDLUnsubscribeButtonResponse.h"
#import "SDLUnsubscribeVehicleDataResponse.h"
#import "SDLUnsubscribeWayPointsResponse.h"
#import "SDLUpdateTurnListResponse.h"

// Notifications
#import "SDLOnAppInterfaceUnregistered.h"
#import "SDLOnAudioPassThru.h"
#import "SDLOnButtonEvent.h"
#import "SDLOnButtonPress.h"
#import "SDLOnCommand.h"
#import "SDLOnDriverDistraction.h"
#import "SDLOnEncodedSyncPData.h"
#import "SDLOnHMIStatus.h"
#import "SDLOnHashChange.h"
#import "SDLOnKeyboardInput.h"
#import "SDLOnLanguageChange.h"
#import "SDLOnLockScreenStatus.h"
#import "SDLOnPermissionsChange.h"
#import "SDLOnSyncPData.h"
#import "SDLOnSystemRequest.h"
#import "SDLOnTBTClientState.h"
#import "SDLOnTouchEvent.h"
#import "SDLOnVehicleData.h"
#import "SDLOnWayPointChange.h"

// Structs
#import "SDLAirbagStatus.h"
#import "SDLAppInfo.h"
#import "SDLAudioPassThruCapabilities.h"
#import "SDLBeltStatus.h"
#import "SDLBodyInformation.h"
#import "SDLButtonCapabilities.h"
#import "SDLChoice.h"
#import "SDLClusterModeStatus.h"
#import "SDLCoordinate.h"
#import "SDLDIDResult.h"
#import "SDLDeviceInfo.h"
#import "SDLDeviceStatus.h"
#import "SDLDisplayCapabilities.h"
#import "SDLECallInfo.h"
#import "SDLEmergencyEvent.h"
#import "SDLGPSData.h"
#import "SDLHMICapabilities.h"
#import "SDLHMIPermissions.h"
#import "SDLHeadLampStatus.h"
#import "SDLImage.h"
#import "SDLImageField.h"
#import "SDLImageResolution.h"
#import "SDLKeyboardProperties.h"
#import "SDLLocationDetails.h"
#import "SDLMenuParams.h"
#import "SDLMyKey.h"
#import "SDLOASISAddress.h"
#import "SDLParameterPermissions.h"
#import "SDLPermissionItem.h"
#import "SDLPresetBankCapabilities.h"
#import "SDLScreenParams.h"
#import "SDLSingleTireStatus.h"
#import "SDLSoftButton.h"
#import "SDLSoftButtonCapabilities.h"
#import "SDLStartTime.h"
#import "SDLSyncMsgVersion.h"
#import "SDLTTSChunk.h"
#import "SDLTextField.h"
#import "SDLTireStatus.h"
#import "SDLTouchCoord.h"
#import "SDLTouchEvent.h"
#import "SDLTouchEventCapabilities.h"
#import "SDLTurn.h"
#import "SDLVRHelpItem.h"
#import "SDLVehicleDataResult.h"
#import "SDLVehicleType.h"

// Enums
#import "SDLAmbientLightStatus.h"
#import "SDLAppHMIType.h"
#import "SDLAppInterfaceUnregisteredReason.h"
#import "SDLAudioStreamingState.h"
#import "SDLAudioType.h"
#import "SDLBitsPerSample.h"
#import "SDLButtonEventMode.h"
#import "SDLButtonName.h"
#import "SDLButtonPressMode.h"
#import "SDLCarModeStatus.h"
#import "SDLCharacterSet.h"
#import "SDLCompassDirection.h"
#import "SDLComponentVolumeStatus.h"
#import "SDLDeviceLevelStatus.h"
#import "SDLDimension.h"
#import "SDLDisplayType.h"
#import "SDLDriverDistractionState.h"
#import "SDLECallConfirmationStatus.h"
#import "SDLEmergencyEventType.h"
#import "SDLFileType.h"
#import "SDLFuelCutoffStatus.h"
#import "SDLGlobalProperty.h"
#import "SDLHMILevel.h"
#import "SDLHMIZoneCapabilities.h"
#import "SDLIgnitionStableStatus.h"
#import "SDLIgnitionStatus.h"
#import "SDLImageFieldName.h"
#import "SDLImageType.h"
#import "SDLInteractionMode.h"
#import "SDLKeyboardEvent.h"
#import "SDLKeyboardLayout.h"
#import "SDLKeypressMode.h"
#import "SDLLanguage.h"
#import "SDLLayoutMode.h"
#import "SDLLockScreenStatus.h"
#import "SDLMaintenanceModeStatus.h"
#import "SDLMediaClockFormat.h"
#import "SDLPRNDL.h"
#import "SDLPermissionStatus.h"
#import "SDLPowerModeQualificationStatus.h"
#import "SDLPowerModeStatus.h"
#import "SDLPredefinedLayout.h"
#import "SDLPrerecordedSpeech.h"
#import "SDLPrimaryAudioSource.h"
#import "SDLRPCMessageType.h"
#import "SDLRequestType.h"
#import "SDLResult.h"
#import "SDLSamplingRate.h"
#import "SDLSoftButtonType.h"
#import "SDLSpeechCapabilities.h"
#import "SDLSystemAction.h"
#import "SDLSystemContext.h"
#import "SDLTBTState.h"
#import "SDLTextAlignment.h"
#import "SDLTextFieldName.h"
#import "SDLTimerMode.h"
#import "SDLTouchType.h"
#import "SDLTriggerSource.h"
#import "SDLUpdateMode.h"
#import "SDLVRCapabilities.h"
#import "SDLVehicleDataActiveStatus.h"
#import "SDLVehicleDataEventStatus.h"
#import "SDLVehicleDataNotificationStatus.h"
#import "SDLVehicleDataResultCode.h"
#import "SDLVehicleDataStatus.h"
#import "SDLVehicleDataType.h"
#import "SDLWarningLightStatus.h"
#import "SDLWiperStatus.h"
#import "SDLWayPointType.h"

// Developer API
// Configurations
#import "SDLConfiguration.h"
#import "SDLLifecycleConfiguration.h"
#import "SDLLockScreenConfiguration.h"

// Files
#import "SDLArtwork.h"
#import "SDLFile.h"
#import "SDLFileManager.h"
#import "SDLFileManagerConstants.h"

// Lockscreen
#import "SDLLockScreenViewController.h"

// Lifecycle
#import "SDLManager.h"
#import "SDLManagerDelegate.h"

// Permissions
#import "SDLPermissionConstants.h"
#import "SDLPermissionManager.h"

// Utilities
#import "NSNumber+NumberType.h"
#import "SDLErrorConstants.h"
#import "SDLNotificationConstants.h"
#import "SDLRequestHandler.h"

// Notifications
#import "SDLRPCNotificationNotification.h"
#import "SDLRPCResponseNotification.h"
