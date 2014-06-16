//  FMCProxyListener.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/RPC/Responses/FMCAddCommandResponse.h>
#import <AppLink/RPC/Responses/FMCAddSubMenuResponse.h>
#import <AppLink/RPC/Responses/FMCAlertResponse.h>
#import <AppLink/RPC/Responses/FMCChangeRegistrationResponse.h>
#import <AppLink/RPC/Responses/FMCCreateInteractionChoiceSetResponse.h>
#import <AppLink/RPC/Responses/FMCDeleteCommandResponse.h>
#import <AppLink/RPC/Responses/FMCDeleteFileResponse.h>
#import <AppLink/RPC/Responses/FMCDeleteInteractionChoiceSetResponse.h>
#import <AppLink/RPC/Responses/FMCDeleteSubMenuResponse.h>
#import <AppLink/RPC/Responses/FMCDiagnosticMessageResponse.h>
#import <AppLink/RPC/Responses/FMCEncodedSyncPDataResponse.h>
#import <AppLink/RPC/Responses/FMCEndAudioPassThruResponse.h>
#import <AppLink/RPC/Responses/FMCGenericResponse.h>
#import <AppLink/RPC/Responses/FMCGetDTCsResponse.h>
#import <AppLink/RPC/Responses/FMCGetVehicleDataResponse.h>
#import <AppLink/RPC/Responses/FMCListFilesResponse.h>
#import <AppLink/RPC/Notifications/FMCOnAppInterfaceUnregistered.h>
#import <AppLink/RPC/Notifications/FMCOnAudioPassThru.h>
#import <AppLink/RPC/Notifications/FMCOnButtonEvent.h>
#import <AppLink/RPC/Notifications/FMCOnButtonPress.h>
#import <AppLink/RPC/Notifications/FMCOnCommand.h>
#import <AppLink/RPC/Notifications/FMCOnDriverDistraction.h>
#import <AppLink/RPC/Notifications/FMCOnEncodedSyncPData.h>
#import <AppLink/RPC/Notifications/FMCOnHashChange.h>
#import <AppLink/RPC/Notifications/FMCOnHMIStatus.h>
#import <AppLink/RPC/Notifications/FMCOnLanguageChange.h>
#import <AppLink/RPC/Notifications/FMCOnPermissionsChange.h>
#import <AppLink/RPC/Notifications/FMCOnSyncPData.h>
#import <AppLink/RPC/Notifications/FMCOnSystemRequest.h>
#import <AppLink/RPC/Notifications/FMCOnVehicleData.h>
#import <AppLink/RPC/Notifications/FMCOnTBTClientState.h>
#import <AppLink/RPC/Notifications/FMCOnTouchEvent.h>
#import <AppLink/RPC/Notifications/FMCOnVehicleData.h>
#import <AppLink/RPC/Responses/FMCPerformAudioPassThruResponse.h>
#import <AppLink/RPC/Responses/FMCPerformInteractionResponse.h>
#import <AppLink/RPC/Responses/FMCPutFileResponse.h>
#import <AppLink/RPC/Responses/FMCReadDIDResponse.h>
#import <AppLink/RPC/Responses/FMCRegisterAppInterfaceResponse.h>
#import <AppLink/RPC/Responses/FMCResetGlobalPropertiesResponse.h>
#import <AppLink/RPC/Responses/FMCScrollableMessageResponse.h>
#import <AppLink/RPC/Responses/FMCSetAppIconResponse.h>
#import <AppLink/RPC/Responses/FMCSetDisplayLayoutResponse.h>
#import <AppLink/RPC/Responses/FMCSetGlobalPropertiesResponse.h>
#import <AppLink/RPC/Responses/FMCSetMediaClockTimerResponse.h>
#import <AppLink/RPC/Responses/FMCShowConstantTBTResponse.h>
#import <AppLink/RPC/Responses/FMCShowResponse.h>
#import <AppLink/RPC/Responses/FMCSliderResponse.h>
#import <AppLink/RPC/Responses/FMCSpeakResponse.h>
#import <AppLink/RPC/Responses/FMCSubscribeButtonResponse.h>
#import <AppLink/RPC/Responses/FMCSubscribeVehicleDataResponse.h>
#import <AppLink/RPC/Responses/FMCSyncPDataResponse.h>
#import <AppLink/RPC/Responses/FMCUpdateTurnListResponse.h>
#import <AppLink/RPC/Responses/FMCUnregisterAppInterfaceResponse.h>
#import <AppLink/RPC/Responses/FMCUnsubscribeButtonResponse.h>
#import <AppLink/RPC/Responses/FMCUnsubscribeVehicleDataResponse.h>

@protocol FMCProxyListener

-(void) onOnDriverDistraction:(FMCOnDriverDistraction*) notification;
-(void) onOnHMIStatus:(FMCOnHMIStatus*) notification;
-(void) onProxyClosed;
-(void) onProxyOpened;

@optional

-(void) onAddCommandResponse:(FMCAddCommandResponse*) response;
-(void) onAddSubMenuResponse:(FMCAddSubMenuResponse*) response;
-(void) onAlertResponse:(FMCAlertResponse*) response;
-(void) onChangeRegistrationResponse:(FMCChangeRegistrationResponse*) response;
-(void) onCreateInteractionChoiceSetResponse:(FMCCreateInteractionChoiceSetResponse*) response;
-(void) onDeleteCommandResponse:(FMCDeleteCommandResponse*) response;
-(void) onDeleteFileResponse:(FMCDeleteFileResponse*) response;
-(void) onDeleteInteractionChoiceSetResponse:(FMCDeleteInteractionChoiceSetResponse*) response;
-(void) onDeleteSubMenuResponse:(FMCDeleteSubMenuResponse*) response;
-(void) onDiagnosticMessageResponse:(FMCDiagnosticMessageResponse*) response;
-(void) onEncodedSyncPDataRespons:(FMCEncodedSyncPDataResponse*) response;
-(void) onEndAudioPassThruResponse:(FMCEndAudioPassThruResponse*) response;
-(void) onError:(NSException*) e;
-(void) onGenericResponse:(FMCGenericResponse*) response;
-(void) onGetDTCsResponse:(FMCGetDTCsResponse*) response;
-(void) onGetVehicleDataResponse:(FMCGetVehicleDataResponse*) response;
-(void) onListFilesResponse:(FMCListFilesResponse*) response;
-(void) onOnAppInterfaceUnregistered:(FMCOnAppInterfaceUnregistered*) notification;
-(void) onOnAudioPassThru:(FMCOnAudioPassThru*) notification;
-(void) onOnButtonEvent:(FMCOnButtonEvent*) notification;
-(void) onOnButtonPress:(FMCOnButtonPress*) notification;
-(void) onOnCommand:(FMCOnCommand*) notification;
-(void) onOnEncodedSyncPData:(FMCOnEncodedSyncPData*) notification;
-(void) onOnHashChange:(FMCOnHashChange*) notification;
-(void) onOnLanguageChange:(FMCOnLanguageChange*) notification;
-(void) onOnPermissionsChange:(FMCOnPermissionsChange*) notification;
-(void) onOnSyncPData:(FMCOnSyncPData*) notification;
-(void) onOnSystemRequest:(FMCOnSystemRequest*) notification;
-(void) onOnTBTClientState:(FMCOnTBTClientState*) notification;
-(void) onOnTouchEvent:(FMCOnTouchEvent*) notification;
-(void) onOnVehicleData:(FMCOnVehicleData*) notification;
-(void) onPerformAudioPassThruResponse:(FMCPerformAudioPassThruResponse*) response;
-(void) onPerformInteractionResponse:(FMCPerformInteractionResponse*) response;
-(void) onPutFileResponse:(FMCPutFileResponse*) response;
-(void) onReadDIDResponse:(FMCReadDIDResponse*) response;
-(void) onRegisterAppInterfaceResponse:(FMCRegisterAppInterfaceResponse*) response;
-(void) onResetGlobalPropertiesResponse:(FMCResetGlobalPropertiesResponse*) response;
-(void) onScrollableMessageResponse:(FMCScrollableMessageResponse*) response;
-(void) onSetAppIconResponse:(FMCSetAppIconResponse*) response;
-(void) onSetDisplayLayoutResponse:(FMCSetDisplayLayoutResponse*) response;
-(void) onSetGlobalPropertiesResponse:(FMCSetGlobalPropertiesResponse*) response;
-(void) onSetMediaClockTimerResponse:(FMCSetMediaClockTimerResponse*) response;
-(void) onShowConstantTBTResponse:(FMCShowConstantTBTResponse*) response;
-(void) onShowResponse:(FMCShowResponse*) response;
-(void) onSliderResponse:(FMCSliderResponse*) response;
-(void) onSpeakResponse:(FMCSpeakResponse*) response;
-(void) onSubscribeButtonResponse:(FMCSubscribeButtonResponse*) response;
-(void) onSubscribeVehicleDataResponse:(FMCSubscribeVehicleDataResponse*) response;
-(void) onSyncPDataResponse:(FMCSyncPDataResponse*) response;
-(void) onUpdateTurnListResponse:(FMCUpdateTurnListResponse*) response;
-(void) onUnregisterAppInterfaceResponse:(FMCUnregisterAppInterfaceResponse*) response;
-(void) onUnsubscribeButtonResponse:(FMCUnsubscribeButtonResponse*) response;
-(void) onUnsubscribeVehicleDataResponse:(FMCUnsubscribeVehicleDataResponse*) response;



@end
