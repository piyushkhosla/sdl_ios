//  FMCRPCRequestFactory.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>

#import <AppLink/RPC/Requests/FMCAddCommand.h>
#import <AppLink/RPC/Requests/FMCAddSubMenu.h>
#import <AppLink/RPC/Requests/FMCAlert.h>
#import <AppLink/RPC/Enums/FMCAppHMIType.h>
#import <AppLink/RPC/Requests/FMCChangeRegistration.h>
#import <AppLink/RPC/Requests/FMCCreateInteractionChoiceSet.h>
#import <AppLink/RPC/Requests/FMCDeleteCommand.h>
#import <AppLink/RPC/Requests/FMCDeleteFile.h>
#import <AppLink/RPC/Requests/FMCDeleteInteractionChoiceSet.h>
#import <AppLink/RPC/Requests/FMCDeleteSubMenu.h>
#import <AppLink/RPC/Requests/FMCEndAudioPassThru.h>
#import <AppLink/RPC/Requests/FMCGetDTCs.h>
#import <AppLink/RPC/Requests/FMCGetVehicleData.h>
#import <AppLink/RPC/Requests/FMCListFiles.h>
#import <AppLink/RPC/Requests/FMCPerformAudioPassThru.h>
#import <AppLink/RPC/Requests/FMCPerformInteraction.h>
#import <AppLink/RPC/Requests/FMCPutFile.h>
#import <AppLink/RPC/Requests/FMCReadDID.h>
#import <AppLink/RPC/Requests/FMCRegisterAppInterface.h>
#import <AppLink/RPC/Requests/FMCResetGlobalProperties.h>
#import <AppLink/RPC/Requests/FMCScrollableMessage.h>
#import <AppLink/RPC/Requests/FMCSetAppIcon.h>
#import <AppLink/RPC/Requests/FMCSetDisplayLayout.h>
#import <AppLink/RPC/Requests/FMCSetGlobalProperties.h>
#import <AppLink/RPC/Requests/FMCSetMediaClockTimer.h>
#import <AppLink/RPC/Requests/FMCShow.h>
#import <AppLink/RPC/Requests/FMCSlider.h>
#import <AppLink/RPC/Requests/FMCSpeak.h>
#import <AppLink/RPC/Requests/FMCSubscribeButton.h>
#import <AppLink/RPC/Requests/FMCSubscribeVehicleData.h>
#import <AppLink/RPC/Requests/FMCUnregisterAppInterface.h>
#import <AppLink/RPC/Requests/FMCUnsubscribeButton.h>
#import <AppLink/RPC/Requests/FMCUnsubscribeVehicleData.h>

@interface FMCRPCRequestFactory : NSObject {}

//***** AddCommand *****
+(FMCAddCommand*) buildAddCommandWithID:(NSNumber*) cmdID menuName:(NSString*) menuName parentID:(NSNumber*) parentID position:(NSNumber*) position vrCommands:(NSArray*) vrCommands iconValue:(NSString*) iconValue iconType:(FMCImageType*) iconType correlationID:(NSNumber*) correlationID;

+(FMCAddCommand*) buildAddCommandWithID:(NSNumber*) cmdID menuName:(NSString*) menuName vrCommands:(NSArray*) vrCommands correlationID:(NSNumber*) correlationID;

+(FMCAddCommand*) buildAddCommandWithID:(NSNumber*) cmdID vrCommands:(NSArray*) vrCommands correlationID:(NSNumber*) correlationID;
//*****


//***** AddSubMenu *****
+(FMCAddSubMenu*) buildAddSubMenuWithID:(NSNumber*) menuID menuName:(NSString*) menuName position:(NSNumber*) position correlationID:(NSNumber*) correlationID;

+(FMCAddSubMenu*) buildAddSubMenuWithID:(NSNumber*) menuID menuName:(NSString*) menuName correlationID:(NSNumber*) correlationID;
//*****


//***** Alert *****
+(FMCAlert*) buildAlertWithTTS:(NSString*) ttsText alertText1:(NSString*) alertText1 alertText2:(NSString*) alertText2 alertText3:(NSString*) alertText3 playTone:(NSNumber*) playTone duration:(NSNumber*) duration correlationID:(NSNumber*) correlationID;

+(FMCAlert*) buildAlertWithTTS:(NSString*) ttsText alertText1:(NSString*) alertText1 alertText2:(NSString*) alertText2 playTone:(NSNumber*) playTone duration:(NSNumber*) duration correlationID:(NSNumber*) correlationID;

+(FMCAlert*) buildAlertWithTTS:(NSString*) ttsText playTone:(NSNumber*) playTone correlationID:(NSNumber*)
correlationID;

//***
+(FMCAlert*) buildAlertWithTTSChunks:(NSArray*) ttsChunks alertText1:(NSString*) alertText1 alertText2:(NSString*) alertText2 alertText3:(NSString*) alertText3 playTone:(NSNumber*) playTone duration:(NSNumber*) duration softButtons:(NSArray*) softButtons correlationID:(NSNumber*) correlationID;

+(FMCAlert*) buildAlertWithTTSChunks:(NSArray*) ttsChunks playTone:(NSNumber*) playTone correlationID:(NSNumber*) correlationID;

//***
+(FMCAlert*) buildAlertWithAlertText1:(NSString*) alertText1 alertText2:(NSString*) alertText2 alertText3:(NSString*) alertText3 duration:(NSNumber*) duration softButtons:(NSArray*) softButtons correlationID:(NSNumber*) correlationID;

+(FMCAlert*) buildAlertWithAlertText1:(NSString*) alertText1 alertText2:(NSString*) alertText2 alertText3:(NSString*) alertText3 duration:(NSNumber*) duration correlationID:(NSNumber*) correlationID;

+(FMCAlert*) buildAlertWithAlertText1:(NSString*) alertText1 alertText2:(NSString*) alertText2 duration:(NSNumber*) duration correlationID:(NSNumber*) correlationID;
//*****


+(FMCChangeRegistration*) buildChangeRegistrationWithLanguage:(FMCLanguage*) language hmiDisplayLanguage:(FMCLanguage*) hmiDisplayLanguage correlationID:(NSNumber*) correlationID;

+(FMCCreateInteractionChoiceSet*) buildCreateInteractionChoiceSetWithID:(NSNumber*)interactionChoiceSetID choiceSet:(NSArray*) choices correlationID:(NSNumber*) correlationID;

+(FMCDeleteCommand*) buildDeleteCommandWithID:(NSNumber*) cmdID correlationID:(NSNumber*) correlationID;

+(FMCDeleteFile*) buildDeleteFileWithName:(NSString*) syncFileName correlationID:(NSNumber*) correlationID;

+(FMCListFiles*) buildListFilesWithCorrelationID:(NSNumber*) correlationID;

+(FMCDeleteInteractionChoiceSet*) buildDeleteInteractionChoiceSetWithID:(NSNumber*)interactionChoiceSetID correlationID:(NSNumber*) correlationID;

+(FMCDeleteSubMenu*) buildDeleteSubMenuWithID:(NSNumber*) menuID correlationID:(NSNumber*) correlationID;

+(FMCEndAudioPassThru*) buildEndAudioPassThruWithCorrelationID:(NSNumber*) correlationID;

+(FMCGetDTCs*) buildGetDTCsWithECUName:(NSNumber*) ecuName correlationID:(NSNumber*) correlationID;

+(FMCGetVehicleData*) buildGetVehicleDataWithGPS:(NSNumber*) gps speed:(NSNumber*) speed rpm:(NSNumber*) rpm fuelLevel:(NSNumber*) fuelLevel fuelLevelState:(NSNumber*) fuelLevelState instantFuelConsumption:(NSNumber*) instantFuelConsumption externalTemperature:(NSNumber*) externalTemperature vin:(NSNumber*) vin prndl:(NSNumber*) prndl tirePressure:(NSNumber*) tirePressure odometer:(NSNumber*) odometer beltStatus:(NSNumber*) beltStatus bodyInformation:(NSNumber*) bodyInformation deviceStatus:(NSNumber*) deviceStatus driverBraking:(NSNumber*) driverBraking wiperStatus:(NSNumber*) wiperStatus headLampStatus:(NSNumber*) headLampStatus engineTorque:(NSNumber*) engineTorque accPedalPosition:(NSNumber*) accPedalPosition steeringWheelAngle:(NSNumber*) steeringWheelAngle correlationID:(NSNumber*) correlationID;

+(FMCPerformAudioPassThru*) buildPerformAudioPassThruWithInitialPrompt:(NSString*) initialPrompt audioPassThruDisplayText1:(NSString*) audioPassThruDisplayText1 audioPassThruDisplayText2:(NSString*) audioPassThruDisplayText2 samplingRate:(FMCSamplingRate*)  samplingRate maxDuration:(NSNumber*) maxDuration bitsPerSample:(FMCBitsPerSample*) bitsPerSample audioType:(FMCAudioType*) audioType muteAudio:(NSNumber*) muteAudio correlationID:(NSNumber*) correlationID;


//***** PerformInteraction *****
+(FMCPerformInteraction*) buildPerformInteractionWithInitialChunks:(NSArray*)initialChunks initialText:(NSString*)initialText interactionChoiceSetIDList:(NSArray*) interactionChoiceSetIDList helpChunks:(NSArray*)helpChunks timeoutChunks:(NSArray*)timeoutChunks interactionMode:(FMCInteractionMode*) interactionMode timeout:(NSNumber*)timeout vrHelp:(NSArray*) vrHelp correlationID:(NSNumber*) correlationID;

//***
+(FMCPerformInteraction*) buildPerformInteractionWithInitialPrompt:(NSString*)initialPrompt initialText:(NSString*)initialText interactionChoiceSetIDList:(NSArray*) interactionChoiceSetIDList helpPrompt:(NSString*)helpPrompt timeoutPrompt:(NSString*)timeoutPrompt interactionMode:(FMCInteractionMode*) interactionMode timeout:(NSNumber*)timeout vrHelp:(NSArray*) vrHelp correlationID:(NSNumber*) correlationID;

+(FMCPerformInteraction*) buildPerformInteractionWithInitialPrompt:(NSString*)initialPrompt initialText:(NSString*)initialText interactionChoiceSetID:(NSNumber*) interactionChoiceSetID vrHelp:(NSArray*) vrHelp correlationID:(NSNumber*) correlationID;

+(FMCPerformInteraction*) buildPerformInteractionWithInitialPrompt:(NSString*)initialPrompt initialText:(NSString*)initialText interactionChoiceSetIDList:(NSArray*) interactionChoiceSetIDList helpPrompt:(NSString*)helpPrompt timeoutPrompt:(NSString*)timeoutPrompt interactionMode:(FMCInteractionMode*) interactionMode timeout:(NSNumber*)timeout correlationID:(NSNumber*) correlationID;

+(FMCPerformInteraction*) buildPerformInteractionWithInitialPrompt:(NSString*)initialPrompt initialText:(NSString*)initialText interactionChoiceSetID:(NSNumber*) interactionChoiceSetID correlationID:(NSNumber*) correlationID;
//*****


+(FMCPutFile*) buildPutFileWithFileName:(NSString*) syncFileName fileType:(FMCFileType*) fileType persisistentFile:(NSNumber*) persistentFile correlationID:(NSNumber*) correlationID;

+(FMCReadDID*) buildReadDIDWithECUName:(NSNumber*) ecuName didLocation:(NSArray*) didLocation correlationID:(NSNumber*) correlationID;

//***** RegisterAppInterface *****
+(FMCRegisterAppInterface*) buildRegisterAppInterfaceWithAppName:(NSString*) appName ttsName:(NSMutableArray*) ttsName vrSynonyms:(NSMutableArray*) vrSynonyms isMediaApp:(NSNumber*) isMediaApp languageDesired:(FMCLanguage*) languageDesired hmiDisplayLanguageDesired:(FMCLanguage*) hmiDisplayLanguageDesired appID:(NSString*) appID;

+(FMCRegisterAppInterface*) buildRegisterAppInterfaceWithAppName:(NSString*) appName isMediaApp:(NSNumber*) isMediaApp languageDesired:(FMCLanguage*) languageDesired appID:(NSString*) appID;

+(FMCRegisterAppInterface*) buildRegisterAppInterfaceWithAppName:(NSString*) appName languageDesired:(FMCLanguage*) laguageDesired appID:(NSString*) appID;
//*****


+(FMCResetGlobalProperties*) buildResetGlobalPropertiesWithProperties:(NSArray*) properties correlationID:(NSNumber*) correlationID;

+(FMCScrollableMessage*) buildScrollableMessage:(NSString*) scrollableMessageBody timeout:(NSNumber*) timeout softButtons:(NSArray*) softButtons correlationID:(NSNumber*) correlationID;

+(FMCSetAppIcon*) buildSetAppIconWithFileName:(NSString*) syncFileName correlationID:(NSNumber*) correlationID;

+(FMCSetDisplayLayout*) buildSetDisplayLayout:(NSString*) displayLayout correlationID:(NSNumber*) correlationID;


//***** SetGlobalProperties *****
+(FMCSetGlobalProperties*) buildSetGlobalPropertiesWithHelpText:(NSString*) helpText timeoutText:(NSString*) timeoutText vrHelpTitle:(NSString*) vrHelpTitle vrHelp:(NSArray*) vrHelp correlationID:(NSNumber*) correlationID;

+(FMCSetGlobalProperties*) buildSetGlobalPropertiesWithHelpText:(NSString*) helpText timeoutText:(NSString*) timeoutText correlationID:(NSNumber*) correlationID;
//*****


//***** SetMediaClockTimer *****
+(FMCSetMediaClockTimer*) buildSetMediaClockTimerWithHours:(NSNumber*) hours minutes:(NSNumber*) minutes seconds:(NSNumber*) seconds updateMode:(FMCUpdateMode*) updateMode correlationID:(NSNumber*) correlationID;

+(FMCSetMediaClockTimer*) buildSetMediaClockTimerWithUpdateMode:(FMCUpdateMode*) updateMode correlationID:(NSNumber*) correlationID;
//*****


//***** Show *****
+(FMCShow*) buildShowWithMainField1:(NSString*) mainField1 mainField2: (NSString*) mainField2 mainField3: (NSString*) mainField3 mainField4: (NSString*) mainField4 statusBar:(NSString*) statusBar mediaClock:(NSString*) mediaClock mediaTrack:(NSString*) mediaTrack alignment:(FMCTextAlignment*) textAlignment graphic:(FMCImage*) graphic softButtons:(NSArray*) softButtons customPresets:(NSArray*) customPresets correlationID:(NSNumber*) correlationID;

+(FMCShow*) buildShowWithMainField1:(NSString*) mainField1 mainField2: (NSString*) mainField2 statusBar:(NSString*) statusBar mediaClock:(NSString*) mediaClock mediaTrack:(NSString*) mediaTrack alignment:(FMCTextAlignment*) textAlignment correlationID:(NSNumber*) correlationID;

+(FMCShow*) buildShowWithMainField1:(NSString*) mainField1 mainField2: (NSString*) mainField2 alignment:(FMCTextAlignment*) alignment correlationID:(NSNumber*) correlationID;
//*****


//***** Slider *****
+(FMCSlider*) buildSliderDynamicFooterWithNumTicks:(NSNumber*) numTicks position:(NSNumber*) position sliderHeader:(NSString*) sliderHeader sliderFooter:(NSArray*) sliderFooter timeout:(NSNumber*) timeout correlationID:(NSNumber*) correlationID;

+(FMCSlider*) buildSliderStaticFooterWithNumTicks:(NSNumber*) numTicks position:(NSNumber*) position sliderHeader:(NSString*) sliderHeader sliderFooter:(NSString*) sliderFooter timeout:(NSNumber*) timeout correlationID:(NSNumber*) correlationID;
//*****


//***** Speak *****
+(FMCSpeak*) buildSpeakWithTTSChunks:(NSArray*) ttsChunks correlationID:(NSNumber*) correlationID;

//***
+(FMCSpeak*) buildSpeakWithTTS:(NSString*) ttsText correlationID:(NSNumber*) correlationID;
//*****


+(FMCSubscribeButton*) buildSubscribeButtonWithName:(FMCButtonName*) buttonName correlationID:(NSNumber*) correlationID;

+(FMCSubscribeVehicleData*) buildSubscribeVehicleDataWithGPS:(NSNumber*) gps speed:(NSNumber*) speed rpm:(NSNumber*) rpm fuelLevel:(NSNumber*) fuelLevel fuelLevelState:(NSNumber*) fuelLevelState instantFuelConsumption:(NSNumber*) instantFuelConsumption externalTemperature:(NSNumber*) externalTemperature prndl:(NSNumber*) prndl tirePressure:(NSNumber*) tirePressure odometer:(NSNumber*) odometer beltStatus:(NSNumber*) beltStatus bodyInformation:(NSNumber*) bodyInformation deviceStatus:(NSNumber*) deviceStatus driverBraking:(NSNumber*) driverBraking wiperStatus:(NSNumber*) wiperStatus headLampStatus:(NSNumber*) headLampStatus engineTorque:(NSNumber*) engineTorque accPedalPosition:(NSNumber*) accPedalPosition steeringWheelAngle:(NSNumber*) steeringWheelAngle correlationID:(NSNumber*) correlationID;

+(FMCUnregisterAppInterface*) buildUnregisterAppInterfaceWithCorrelationID:(NSNumber*) correlationID;

+(FMCUnsubscribeButton*) buildUnsubscribeButtonWithName:(FMCButtonName*) buttonName correlationID:(NSNumber*) correlationID;

+(FMCUnsubscribeVehicleData*) buildUnsubscribeVehicleDataWithGPS:(NSNumber*) gps speed:(NSNumber*) speed rpm:(NSNumber*) rpm fuelLevel:(NSNumber*) fuelLevel fuelLevelState:(NSNumber*) fuelLevelState instantFuelConsumption:(NSNumber*) instantFuelConsumption externalTemperature:(NSNumber*) externalTemperature prndl:(NSNumber*) prndl tirePressure:(NSNumber*) tirePressure odometer:(NSNumber*) odometer beltStatus:(NSNumber*) beltStatus bodyInformation:(NSNumber*) bodyInformation deviceStatus:(NSNumber*) deviceStatus driverBraking:(NSNumber*) driverBraking wiperStatus:(NSNumber*) wiperStatus headLampStatus:(NSNumber*) headLampStatus engineTorque:(NSNumber*) engineTorque accPedalPosition:(NSNumber*) accPedalPosition steeringWheelAngle:(NSNumber*) steeringWheelAngle correlationID:(NSNumber*) correlationID;

@end
