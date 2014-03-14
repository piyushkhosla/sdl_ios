//  FMCRPCRequestFactory.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCRPCRequestFactory.h>

#import <AppLink/FMCMenuParams.h>
#import <AppLink/FMCTTSChunkFactory.h>

@implementation FMCRPCRequestFactory

//***** AddCommand *****
+(FMCAddCommand*) buildAddCommandWithID:(NSNumber*) cmdID menuName:(NSString*) menuName parentID:(NSNumber*) parentID position:(NSNumber*) position vrCommands:(NSArray*) vrCommands iconValue:(NSString*) iconValue iconType:(FMCImageType*) iconType correlationID:(NSNumber*) correlationID {
	
    FMCAddCommand* msg = [[[FMCAddCommand alloc] init] autorelease];
	msg.correlationID = correlationID;
    
	msg.cmdID = cmdID;
    
	if (menuName != nil || parentID != nil || position != nil) {
		FMCMenuParams* menuParams = [[[FMCMenuParams alloc] init] autorelease];
		menuParams.menuName = menuName;
		menuParams.parentID = parentID;
		menuParams.position = position;
		msg.menuParams = menuParams;
	}
	msg.vrCommands = [[vrCommands mutableCopy] autorelease];
    
    if (iconValue != nil || iconType != nil) {
        FMCImage* icon = [[[FMCImage alloc] init] autorelease];
		icon.value = iconValue;
		icon.imageType = iconType;
		msg.cmdIcon = icon;
    }
    
	return msg;
}

+(FMCAddCommand*) buildAddCommandWithID:(NSNumber*) cmdID menuName:(NSString*) menuName vrCommands:(NSArray*) vrCommands correlationID:(NSNumber*) correlationID {
	
    return [FMCRPCRequestFactory buildAddCommandWithID:cmdID menuName:menuName parentID:nil position:nil vrCommands:vrCommands iconValue:nil iconType:nil correlationID:correlationID];
}

+(FMCAddCommand*) buildAddCommandWithID:(NSNumber*) cmdID vrCommands:(NSArray*) vrCommands correlationID:(NSNumber*) correlationID {
	
    return [FMCRPCRequestFactory buildAddCommandWithID:cmdID menuName:nil vrCommands:vrCommands correlationID:correlationID];
}
//*****


//***** AddSubMenu *****
+(FMCAddSubMenu*) buildAddSubMenuWithID:(NSNumber*) menuID menuName:(NSString*) menuName position:(NSNumber*) position correlationID:(NSNumber*) correlationID {
	
    FMCAddSubMenu* msg = [[[FMCAddSubMenu alloc] init] autorelease];
	msg.correlationID = correlationID;
	msg.menuID = menuID;
	msg.menuName = menuName;
	msg.position = position;
	
	return msg;
}

+(FMCAddSubMenu*) buildAddSubMenuWithID:(NSNumber*) menuID menuName:(NSString*) menuName correlationID:(NSNumber*) correlationID  {
	return [FMCRPCRequestFactory buildAddSubMenuWithID:menuID menuName:menuName position:nil correlationID:correlationID];
}
//*****


//***** Alert *****
+(FMCAlert*) buildAlertWithTTS:(NSString*) ttsText alertText1:(NSString*) alertText1 alertText2:(NSString*) alertText2 alertText3:(NSString*) alertText3 playTone:(NSNumber*) playTone duration:(NSNumber*) duration correlationID:(NSNumber*) correlationID {
	
    FMCTTSChunk* simpleChunk = [[[FMCTTSChunk alloc] init] autorelease];
	simpleChunk.text = ttsText;
	simpleChunk.type = FMCSpeechCapabilities.TEXT;
	NSArray* ttsChunks = [NSArray arrayWithObject:simpleChunk];
	
    return [FMCRPCRequestFactory buildAlertWithTTSChunks:ttsChunks alertText1:alertText1 alertText2:alertText2 alertText3:alertText3 playTone:playTone duration:duration softButtons:nil correlationID:correlationID];
}

+(FMCAlert*) buildAlertWithTTS:(NSString*) ttsText alertText1:(NSString*) alertText1 alertText2:(NSString*) alertText2 playTone:(NSNumber*) playTone duration:(NSNumber*) duration correlationID:(NSNumber*) correlationID {
	
    return [FMCRPCRequestFactory buildAlertWithTTS:ttsText alertText1:alertText1 alertText2:alertText2 alertText3:nil playTone:playTone duration:duration correlationID:correlationID];
}

+(FMCAlert*) buildAlertWithTTS:(NSString*) ttsText playTone:(NSNumber*) playTone correlationID:(NSNumber*)
correlationID{
	
    return [FMCRPCRequestFactory buildAlertWithTTS:ttsText alertText1:nil alertText2:nil alertText3:nil playTone:playTone duration:nil correlationID:correlationID];
}

//***
+(FMCAlert*) buildAlertWithTTSChunks:(NSArray*) ttsChunks alertText1:(NSString*) alertText1 alertText2:(NSString*) alertText2 alertText3:(NSString*) alertText3 playTone:(NSNumber*) playTone duration:(NSNumber*) duration softButtons:(NSArray*) softButtons correlationID:(NSNumber*) correlationID {
	
    FMCAlert* msg = [[[FMCAlert alloc] init] autorelease];
	msg.correlationID = correlationID;
	msg.alertText1 = alertText1;
	msg.alertText2 = alertText2;
    msg.alertText3 = alertText3;
	msg.ttsChunks = [[ttsChunks mutableCopy] autorelease];
	msg.playTone = playTone;
	msg.duration = duration;
    msg.softButtons = [[softButtons mutableCopy] autorelease];
	return msg;
}

+(FMCAlert*) buildAlertWithTTSChunks:(NSArray*) ttsChunks playTone:(NSNumber*) playTone correlationID:(NSNumber*) correlationID  {
	return [FMCRPCRequestFactory buildAlertWithTTSChunks:ttsChunks alertText1:nil alertText2:nil alertText3:nil playTone:playTone duration:nil softButtons:nil correlationID:correlationID];
}

//***
+(FMCAlert*) buildAlertWithAlertText1:(NSString*) alertText1 alertText2:(NSString*) alertText2 alertText3:(NSString*) alertText3 duration:(NSNumber*) duration softButtons:(NSMutableArray*) softButtons correlationID:(NSNumber*) correlationID  {
	return [FMCRPCRequestFactory buildAlertWithTTSChunks:nil alertText1:alertText1 alertText2:alertText2 alertText3:alertText3 playTone:nil duration:duration softButtons:softButtons correlationID:correlationID];
}

+(FMCAlert*) buildAlertWithAlertText1:(NSString*) alertText1 alertText2:(NSString*) alertText2 alertText3:(NSString*) alertText3 duration:(NSNumber*) duration correlationID:(NSNumber*) correlationID  {
	return [FMCRPCRequestFactory buildAlertWithTTSChunks:nil alertText1: alertText1 alertText2:alertText2 alertText3:alertText3 playTone:nil duration:duration softButtons:nil correlationID:correlationID];
}

+(FMCAlert*) buildAlertWithAlertText1:(NSString*) alertText1 alertText2:(NSString*) alertText2 duration:(NSNumber*) duration correlationID:(NSNumber*) correlationID  {
	return [FMCRPCRequestFactory buildAlertWithTTSChunks:nil alertText1: alertText1 alertText2:alertText2 alertText3:nil playTone:nil duration:duration softButtons:nil correlationID:correlationID];
}
//*****


+(FMCChangeRegistration*) buildChangeRegistrationWithLanguage:(FMCLanguage*) language hmiDisplayLanguage:(FMCLanguage*) hmiDisplayLanguage correlationID:(NSNumber*) correlationID {
	
    FMCChangeRegistration* msg = [[[FMCChangeRegistration alloc] init] autorelease];
    msg.language = language;
    msg.hmiDisplayLanguage = hmiDisplayLanguage;
    msg.correlationID = correlationID;
    
	return msg;
}

+(FMCCreateInteractionChoiceSet*) buildCreateInteractionChoiceSetWithID:(NSNumber*)interactionChoiceSetID choiceSet:(NSArray*) choices correlationID:(NSNumber*) correlationID  {
	
    FMCCreateInteractionChoiceSet *msg = [[[FMCCreateInteractionChoiceSet alloc] init] autorelease];
	msg.interactionChoiceSetID = interactionChoiceSetID;
	msg.choiceSet = [[choices mutableCopy] autorelease];
	msg.correlationID = correlationID;
	
	return msg;
}

+(FMCDeleteCommand*) buildDeleteCommandWithID:(NSNumber*) cmdID correlationID:(NSNumber*) correlationID  {
	
    FMCDeleteCommand *msg = [[[FMCDeleteCommand alloc] init] autorelease];
	msg.cmdID = cmdID;
	msg.correlationID = correlationID;
	
    return msg;
}

+(FMCDeleteFile*) buildDeleteFileWithName:(NSString*) syncFileName correlationID:(NSNumber*) correlationID {
    
    FMCDeleteFile* msg = [[[FMCDeleteFile alloc] init] autorelease];
    msg.syncFileName = syncFileName;
    msg.correlationID = correlationID;
    
    return msg;
}

+(FMCListFiles*) buildListFilesWithCorrelationID:(NSNumber*) correlationID {
    
    FMCListFiles* msg = [[[FMCListFiles alloc] init] autorelease];
    msg.correlationID = correlationID;
    
    return msg;
}

+(FMCDeleteInteractionChoiceSet*) buildDeleteInteractionChoiceSetWithID:(NSNumber*)interactionChoiceSetID correlationID:(NSNumber*) correlationID  {
	
    FMCDeleteInteractionChoiceSet *msg = [[[FMCDeleteInteractionChoiceSet alloc] init] autorelease];
	msg.interactionChoiceSetID = interactionChoiceSetID;
	msg.correlationID = correlationID;
	
	return msg;
}

+(FMCDeleteSubMenu*) buildDeleteSubMenuWithID:(NSNumber*) menuID correlationID:(NSNumber*) correlationID {
	
    FMCDeleteSubMenu *msg = [[[FMCDeleteSubMenu alloc] init] autorelease];
	msg.menuID = menuID;
	msg.correlationID = correlationID;
    
	return msg;
}

+(FMCEndAudioPassThru*) buildEndAudioPassThruWithCorrelationID:(NSNumber*) correlationID {
    
    FMCEndAudioPassThru* msg = [[[FMCEndAudioPassThru alloc] init] autorelease];
    msg.correlationID = correlationID;
    
	return msg;
}

+(FMCGetDTCs*) buildGetDTCsWithECUName:(NSNumber*) ecuName correlationID:(NSNumber*) correlationID {
	
    FMCGetDTCs* msg = [[[FMCGetDTCs alloc] init] autorelease];
    msg.ecuName = ecuName;
	msg.correlationID = correlationID;
    
	return msg;
}

+(FMCGetVehicleData*) buildGetVehicleDataWithGPS:(NSNumber*) gps speed:(NSNumber*) speed rpm:(NSNumber*) rpm fuelLevel:(NSNumber*) fuelLevel fuelLevelState:(NSNumber*) fuelLevelState instantFuelConsumption:(NSNumber*) instantFuelConsumption externalTemperature:(NSNumber*) externalTemperature vin:(NSNumber*) vin prndl:(NSNumber*) prndl tirePressure:(NSNumber*) tirePressure odometer:(NSNumber*) odometer beltStatus:(NSNumber*) beltStatus bodyInformation:(NSNumber*) bodyInformation deviceStatus:(NSNumber*) deviceStatus driverBraking:(NSNumber*) driverBraking wiperStatus:(NSNumber*) wiperStatus headLampStatus:(NSNumber*) headLampStatus engineTorque:(NSNumber*) engineTorque accPedalPosition:(NSNumber*) accPedalPosition steeringWheelAngle:(NSNumber*) steeringWheelAngle correlationID:(NSNumber*) correlationID {
	
    FMCGetVehicleData* msg = [[[FMCGetVehicleData alloc] init] autorelease];
    msg.gps = gps;
	msg.speed = speed;
	msg.rpm = rpm;
	msg.fuelLevel = fuelLevel;
	msg.fuelLevelState = fuelLevelState;
	msg.instantFuelConsumption = instantFuelConsumption;
	msg.externalTemperature = externalTemperature;
	msg.vin = vin;
	msg.prndl = prndl;
	msg.tirePressure = tirePressure;
	msg.odometer = odometer;
	msg.beltStatus = beltStatus;
	msg.bodyInformation = bodyInformation;
	msg.deviceStatus = deviceStatus;
    msg.driverBraking = driverBraking;
    msg.wiperStatus = wiperStatus;
    msg.headLampStatus = headLampStatus;
    msg.engineTorque = engineTorque;
    msg.accPedalPosition = accPedalPosition;
    msg.steeringWheelAngle = steeringWheelAngle;
	msg.correlationID = correlationID;
	
	return msg;
}

+(FMCPerformAudioPassThru*) buildPerformAudioPassThruWithInitialPrompt:(NSString*) initialPrompt audioPassThruDisplayText1:(NSString*) audioPassThruDisplayText1 audioPassThruDisplayText2:(NSString*) audioPassThruDisplayText2 samplingRate:(FMCSamplingRate*)  samplingRate maxDuration:(NSNumber*) maxDuration bitsPerSample:(FMCBitsPerSample*) bitsPerSample audioType:(FMCAudioType*) audioType muteAudio:(NSNumber*) muteAudio correlationID:(NSNumber*) correlationID {
    
    NSArray* initialChunks = [FMCTTSChunkFactory buildTTSChunksFromSimple:initialPrompt];
    
    FMCPerformAudioPassThru* msg = [[[FMCPerformAudioPassThru alloc] init] autorelease];
	msg.initialPrompt = [[initialChunks mutableCopy] autorelease];
	msg.audioPassThruDisplayText1 = audioPassThruDisplayText1;
	msg.audioPassThruDisplayText2 = audioPassThruDisplayText2;
	msg.samplingRate = samplingRate;
    msg.maxDuration = maxDuration;
    msg.bitsPerSample = bitsPerSample;
    msg.audioType = audioType;
    msg.muteAudio = muteAudio;
    
    return msg;
}


//***** PerformInteraction *****
+(FMCPerformInteraction*) buildPerformInteractionWithInitialChunks:(NSArray*)initialChunks initialText:(NSString*)initialText interactionChoiceSetIDList:(NSArray*) interactionChoiceSetIDList helpChunks:(NSArray*)helpChunks timeoutChunks:(NSArray*)timeoutChunks interactionMode:(FMCInteractionMode*) interactionMode timeout:(NSNumber*)timeout vrHelp:(NSArray*) vrHelp correlationID:(NSNumber*) correlationID  {
	
    FMCPerformInteraction *msg = [[[FMCPerformInteraction alloc] init] autorelease];
	msg.initialPrompt = [[initialChunks mutableCopy] autorelease];
	msg.initialText = initialText;
	msg.interactionChoiceSetIDList = [[interactionChoiceSetIDList mutableCopy] autorelease];
	msg.helpPrompt = [[helpChunks mutableCopy] autorelease];
	msg.timeoutPrompt = [[timeoutChunks mutableCopy] autorelease];
	msg.interactionMode = interactionMode;
	msg.timeout = timeout;
    msg.vrHelp = [[vrHelp mutableCopy] autorelease];
	msg.correlationID = correlationID;
	
	return msg;
}

//***
+(FMCPerformInteraction*) buildPerformInteractionWithInitialPrompt:(NSString*)initialPrompt initialText:(NSString*)initialText interactionChoiceSetIDList:(NSArray*) interactionChoiceSetIDList helpPrompt:(NSString*)helpPrompt timeoutPrompt:(NSString*)timeoutPrompt interactionMode:(FMCInteractionMode*) interactionMode timeout:(NSNumber*)timeout vrHelp:(NSArray*) vrHelp correlationID:(NSNumber*) correlationID  {
	
    NSArray* initialChunks = [FMCTTSChunkFactory buildTTSChunksFromSimple:initialPrompt];
	NSArray* helpChunks = [FMCTTSChunkFactory buildTTSChunksFromSimple:helpPrompt];
	NSArray* timeoutChunks = [FMCTTSChunkFactory buildTTSChunksFromSimple:timeoutPrompt];
	
	return [FMCRPCRequestFactory buildPerformInteractionWithInitialChunks:initialChunks initialText:initialText interactionChoiceSetIDList:interactionChoiceSetIDList helpChunks:helpChunks timeoutChunks:timeoutChunks interactionMode:interactionMode timeout:timeout vrHelp:vrHelp correlationID:correlationID];
}

+(FMCPerformInteraction*) buildPerformInteractionWithInitialPrompt:(NSString*)initialPrompt initialText:(NSString*)initialText interactionChoiceSetID:(NSNumber*) interactionChoiceSetID vrHelp:(NSArray*) vrHelp correlationID:(NSNumber*) correlationID  {
	
    NSArray *interactionChoiceSetIDList = [NSArray arrayWithObject:interactionChoiceSetID];
	NSArray* initialChunks = [FMCTTSChunkFactory buildTTSChunksFromSimple:initialPrompt];
	
	return [FMCRPCRequestFactory buildPerformInteractionWithInitialChunks:initialChunks initialText:initialText interactionChoiceSetIDList:interactionChoiceSetIDList helpChunks:nil timeoutChunks:nil interactionMode:FMCInteractionMode.BOTH timeout:nil vrHelp:vrHelp correlationID:correlationID];
}

+(FMCPerformInteraction*) buildPerformInteractionWithInitialPrompt:(NSString*)initialPrompt initialText:(NSString*)initialText interactionChoiceSetIDList:(NSArray*) interactionChoiceSetIDList helpPrompt:(NSString*)helpPrompt timeoutPrompt:(NSString*)timeoutPrompt interactionMode:(FMCInteractionMode*) interactionMode timeout:(NSNumber*)timeout correlationID:(NSNumber*) correlationID  {
    
	return [FMCRPCRequestFactory buildPerformInteractionWithInitialPrompt:initialPrompt initialText:initialText interactionChoiceSetIDList:interactionChoiceSetIDList helpPrompt:helpPrompt timeoutPrompt:timeoutPrompt interactionMode:interactionMode timeout:timeout vrHelp:nil correlationID:(NSNumber*) correlationID];
}

+(FMCPerformInteraction*) buildPerformInteractionWithInitialPrompt:(NSString*)initialPrompt initialText:(NSString*)initialText interactionChoiceSetID:(NSNumber*) interactionChoiceSetID correlationID:(NSNumber*) correlationID  {
    
	return [FMCRPCRequestFactory buildPerformInteractionWithInitialPrompt:initialPrompt initialText:initialText interactionChoiceSetID:interactionChoiceSetID vrHelp:nil correlationID:correlationID];
}
//*****


+(FMCPutFile*) buildPutFileWithFileName:(NSString*) syncFileName fileType:(FMCFileType*) fileType persisistentFile:(NSNumber*) persistentFile correlationID:(NSNumber*) correlationID {
    
    //TODO
    //    +(FMPutFile*) buildPutFile:(NSString*) syncFileName fileType:(FMCFileType*) fileType persisistentFile:(NSNumber*) persistentFile fileData:(NSData*) fileData correlationID:(NSNumber*) correlationID {
    
    
    FMCPutFile* msg = [[[FMCPutFile alloc] init] autorelease];
    msg.syncFileName = syncFileName;
    
    msg.fileType = [[fileType mutableCopy] autorelease];
    msg.persistentFile = persistentFile;
    
    //TODO
    //	msg.fileData = [[fileData mutableCopy] autorelease];
    
    msg.correlationID = correlationID;
    
    return msg;
}

+(FMCReadDID*) buildReadDIDWithECUName:(NSNumber*) ecuName didLocation:(NSArray*) didLocation correlationID:(NSNumber*) correlationID {
	
    FMCReadDID* msg = [[[FMCReadDID alloc] init] autorelease];
    msg.ecuName = ecuName;
	msg.didLocation = [[didLocation mutableCopy] autorelease];
	msg.correlationID = correlationID;
	
	return msg;
}

//***** RegisterAppInterface *****
+(FMCRegisterAppInterface*) buildRegisterAppInterfaceWithAppName:(NSString*) appName ttsName:(NSMutableArray*) ttsName vrSynonyms:(NSMutableArray*) vrSynonyms isMediaApp:(NSNumber*) isMediaApp languageDesired:(FMCLanguage*) languageDesired hmiDisplayLanguageDesired:(FMCLanguage*) hmiDisplayLanguageDesired appID:(NSString*) appID {
    
    FMCRegisterAppInterface* msg = [[[FMCRegisterAppInterface alloc] init] autorelease];
    FMCSyncMsgVersion* version = [[[FMCSyncMsgVersion alloc] init] autorelease];
	version.majorVersion = [NSNumber numberWithInt:1];
	version.minorVersion = [NSNumber numberWithInt:0];
    msg.syncMsgVersion = version;
	msg.appName = appName;
    msg.ttsName = ttsName;
	msg.ngnMediaScreenAppName = appName;
	msg.vrSynonyms = vrSynonyms;
	msg.isMediaApplication = isMediaApp;
    msg.languageDesired = languageDesired;
    msg.hmiDisplayLanguageDesired = hmiDisplayLanguageDesired;
    msg.appID = appID;
    
    msg.correlationID = [NSNumber numberWithInt:1];
    
	return msg;
}

+(FMCRegisterAppInterface*) buildRegisterAppInterfaceWithAppName:(NSString*) appName isMediaApp:(NSNumber*) isMediaApp languageDesired:(FMCLanguage*) languageDesired appID:(NSString*) appID {
    
	NSMutableArray* syns = [NSMutableArray arrayWithObject:appName];
    
    return [FMCRPCRequestFactory buildRegisterAppInterfaceWithAppName:appName ttsName:nil vrSynonyms:syns isMediaApp:isMediaApp languageDesired:languageDesired hmiDisplayLanguageDesired:languageDesired appID:appID];
}

+(FMCRegisterAppInterface*) buildRegisterAppInterfaceWithAppName:(NSString*) appName languageDesired:(FMCLanguage*) languageDesired appID:(NSString*) appID{
    
    return [FMCRPCRequestFactory buildRegisterAppInterfaceWithAppName:appName isMediaApp:[NSNumber numberWithBool:NO] languageDesired:languageDesired appID: appID];
}
//*****


+(FMCResetGlobalProperties*) buildResetGlobalPropertiesWithProperties:(NSArray*) properties correlationID:(NSNumber*) correlationID {
	
    FMCResetGlobalProperties* msg = [[[FMCResetGlobalProperties alloc] init] autorelease];
	msg.properties = [[properties mutableCopy] autorelease];
	msg.correlationID = correlationID;
	
	return msg;
}

+(FMCScrollableMessage*) buildScrollableMessage:(NSString*) scrollableMessageBody timeout:(NSNumber*) timeout softButtons:(NSArray*) softButtons correlationID:(NSNumber*) correlationID {
	
    FMCScrollableMessage* msg = [[[FMCScrollableMessage alloc] init] autorelease];
    msg.scrollableMessageBody = scrollableMessageBody;
    msg.timeout = timeout;
    msg.softButtons = [[softButtons mutableCopy] autorelease];
	msg.correlationID = correlationID;
	
	return msg;
}

+(FMCSetAppIcon*) buildSetAppIconWithFileName:(NSString*) syncFileName correlationID:(NSNumber*) correlationID {
    
    FMCSetAppIcon* msg = [[[FMCSetAppIcon alloc] init] autorelease];
    msg.syncFileName = syncFileName;
    msg.correlationID = correlationID;
    
    return msg;
}

+(FMCSetDisplayLayout*) buildSetDisplayLayout:(NSString*) displayLayout correlationID:(NSNumber*) correlationID {
    
    FMCSetDisplayLayout* msg = [[[FMCSetDisplayLayout alloc] init] autorelease];
    msg.displayLayout = displayLayout;
    msg.correlationID = correlationID;
    
	return msg;
}


//***** SetGlobalProperties *****
+(FMCSetGlobalProperties*) buildSetGlobalPropertiesWithHelpText:(NSString*) helpText timeoutText:(NSString*) timeoutText vrHelpTitle:(NSString*) vrHelpTitle vrHelp:(NSArray*) vrHelp correlationID:(NSNumber*) correlationID {
    
	FMCSetGlobalProperties* msg = [[[FMCSetGlobalProperties alloc] init] autorelease];
	msg.helpPrompt = [FMCTTSChunkFactory buildTTSChunksFromSimple:helpText];
	msg.timeoutPrompt = [FMCTTSChunkFactory buildTTSChunksFromSimple:timeoutText];
    msg.vrHelpTitle = vrHelpTitle;
    msg.vrHelp = [[vrHelp mutableCopy] autorelease];
    msg.correlationID = correlationID;
	
	return msg;
}

+(FMCSetGlobalProperties*) buildSetGlobalPropertiesWithHelpText:(NSString*) helpText timeoutText:(NSString*) timeoutText correlationID:(NSNumber*) correlationID {
	
    FMCSetGlobalProperties* msg = [[[FMCSetGlobalProperties alloc] init] autorelease];
	msg.helpPrompt = [FMCTTSChunkFactory buildTTSChunksFromSimple:helpText];
	msg.timeoutPrompt = [FMCTTSChunkFactory buildTTSChunksFromSimple:timeoutText];
	msg.correlationID = correlationID;
	
	return msg;
}
//*****


//***** SetMediaClockTimer *****
+(FMCSetMediaClockTimer*) buildSetMediaClockTimerWithHours:(NSNumber*) hours minutes:(NSNumber*) minutes seconds:(NSNumber*) seconds updateMode:(FMCUpdateMode*) updateMode correlationID:(NSNumber*) correlationID  {
	
    FMCSetMediaClockTimer* msg = [[[FMCSetMediaClockTimer alloc] init] autorelease];
	FMCStartTime* startTime = [[[FMCStartTime alloc] init] autorelease];
	startTime.hours = hours;
	startTime.minutes = minutes;
	startTime.seconds = seconds;
	msg.startTime = startTime;
	msg.updateMode = updateMode;
	msg.correlationID = correlationID;
	
	return msg;
}

+(FMCSetMediaClockTimer*) buildSetMediaClockTimerWithUpdateMode:(FMCUpdateMode*) updateMode correlationID:(NSNumber*) correlationID  {
	
    FMCSetMediaClockTimer* msg = [[[FMCSetMediaClockTimer alloc] init] autorelease];
	msg.updateMode = updateMode;
	msg.correlationID = correlationID;
	
	return msg;
}
//*****


//***** Show *****
+(FMCShow*) buildShowWithMainField1:(NSString*) mainField1 mainField2: (NSString*) mainField2 mainField3: (NSString*) mainField3 mainField4: (NSString*) mainField4 statusBar:(NSString*) statusBar mediaClock:(NSString*) mediaClock mediaTrack:(NSString*) mediaTrack alignment:(FMCTextAlignment*) textAlignment graphic:(FMCImage*) graphic softButtons:(NSArray*) softButtons customPresets:(NSArray*) customPresets correlationID:(NSNumber*) correlationID {
	
    FMCShow* msg = [[[FMCShow alloc] init] autorelease];
	msg.correlationID = correlationID;
	msg.mainField1 = mainField1;
	msg.mainField2 = mainField2;
    msg.mainField3 = mainField3;
	msg.mainField4 = mainField4;
	msg.statusBar = statusBar;
	msg.mediaClock = mediaClock;
	msg.mediaTrack = mediaTrack;
	msg.alignment = textAlignment;
    msg.graphic = graphic;
    msg.softButtons = [[softButtons mutableCopy] autorelease];
    msg.customPresets = [[customPresets mutableCopy] autorelease];
    
	return msg;
}

+(FMCShow*) buildShowWithMainField1:(NSString*) mainField1 mainField2: (NSString*) mainField2 statusBar:(NSString*) statusBar mediaClock:(NSString*) mediaClock mediaTrack:(NSString*) mediaTrack alignment:(FMCTextAlignment*) textAlignment correlationID:(NSNumber*) correlationID  {
	
    FMCShow* msg = [[[FMCShow alloc] init] autorelease];
	msg.correlationID = correlationID;
	msg.mainField1 = mainField1;
	msg.mainField2 = mainField2;
	msg.statusBar = statusBar;
	msg.mediaClock = mediaClock;
	msg.mediaTrack = mediaTrack;
	msg.alignment = textAlignment;
	
	return msg;
}

+(FMCShow*) buildShowWithMainField1:(NSString*) mainField1 mainField2: (NSString*) mainField2 alignment:(FMCTextAlignment*) alignment correlationID:(NSNumber*) correlationID  {
	
    return [FMCRPCRequestFactory buildShowWithMainField1:mainField1 mainField2:mainField2 statusBar:nil mediaClock:nil mediaTrack:nil alignment:alignment correlationID:correlationID];
}
//*****


//***** Slider *****
+(FMCSlider*) buildSliderDynamicFooterWithNumTicks:(NSNumber*) numTicks position:(NSNumber*) position sliderHeader:(NSString*) sliderHeader sliderFooter:(NSArray*) sliderFooter timeout:(NSNumber*) timeout correlationID:(NSNumber*) correlationID {	FMCSlider* msg = [[[FMCSlider alloc] init] autorelease];
	msg.correlationID = correlationID;
    msg.numTicks = numTicks;
    msg.position = position;
    msg.sliderHeader = sliderHeader;
    msg.sliderFooter = [[sliderFooter mutableCopy] autorelease];
	msg.timeout = timeout;
    
    return msg;
}

+(FMCSlider*) buildSliderStaticFooterWithNumTicks:(NSNumber*) numTicks position:(NSNumber*) position sliderHeader:(NSString*) sliderHeader sliderFooter:(NSString*) sliderFooter timeout:(NSNumber*) timeout correlationID:(NSNumber*) correlationID {
	
	NSArray* sliderFooters = [NSArray arrayWithObject:sliderFooter];
    
    // Populates array with the same footer value for each position
    for (UInt32 i = 1; i < numTicks.unsignedIntegerValue; i++) {
        sliderFooters = [sliderFooters arrayByAddingObject:sliderFooter];
	}
    
    return [FMCRPCRequestFactory buildSliderDynamicFooterWithNumTicks:numTicks position:position sliderHeader:sliderHeader sliderFooter:sliderFooters timeout:timeout correlationID:correlationID];
}
//*****


//***** Speak *****
+(FMCSpeak*) buildSpeakWithTTSChunks:(NSArray*) ttsChunks correlationID:(NSNumber*) correlationID  {
	
    FMCSpeak* msg = [[[FMCSpeak alloc] init] autorelease];
	msg.correlationID = correlationID;
	msg.ttsChunks = [[ttsChunks mutableCopy] autorelease];
	
	return msg;
}

//***
+(FMCSpeak*) buildSpeakWithTTS:(NSString*) ttsText correlationID:(NSNumber*) correlationID  {
	
    FMCTTSChunk* simpleChunk = [[[FMCTTSChunk alloc] init] autorelease];
	simpleChunk.text = ttsText;
	simpleChunk.type = FMCSpeechCapabilities.TEXT;
	NSArray* ttsChunks = [NSMutableArray arrayWithObject:simpleChunk];
	
    return [FMCRPCRequestFactory buildSpeakWithTTSChunks:ttsChunks correlationID:correlationID];
	
}
//*****


+(FMCSubscribeButton*) buildSubscribeButtonWithName:(FMCButtonName*) buttonName correlationID:(NSNumber*) correlationID {
	
    FMCSubscribeButton* msg = [[[FMCSubscribeButton alloc] init] autorelease];
	msg.correlationID = correlationID;
	msg.buttonName = buttonName;
	
	return msg;
}

+(FMCSubscribeVehicleData*) buildSubscribeVehicleDataWithGPS:(NSNumber*) gps speed:(NSNumber*) speed rpm:(NSNumber*) rpm fuelLevel:(NSNumber*) fuelLevel fuelLevelState:(NSNumber*) fuelLevelState instantFuelConsumption:(NSNumber*) instantFuelConsumption externalTemperature:(NSNumber*) externalTemperature prndl:(NSNumber*) prndl tirePressure:(NSNumber*) tirePressure odometer:(NSNumber*) odometer beltStatus:(NSNumber*) beltStatus bodyInformation:(NSNumber*) bodyInformation deviceStatus:(NSNumber*) deviceStatus driverBraking:(NSNumber*) driverBraking wiperStatus:(NSNumber*) wiperStatus headLampStatus:(NSNumber*) headLampStatus engineTorque:(NSNumber*) engineTorque accPedalPosition:(NSNumber*) accPedalPosition steeringWheelAngle:(NSNumber*) steeringWheelAngle correlationID:(NSNumber*) correlationID {
	
    FMCSubscribeVehicleData* msg = [[[FMCSubscribeVehicleData alloc] init] autorelease];
    msg.gps = gps;
	msg.speed = speed;
	msg.rpm = rpm;
	msg.fuelLevel = fuelLevel;
	msg.fuelLevelState = fuelLevelState;
	msg.instantFuelConsumption = instantFuelConsumption;
	msg.externalTemperature = externalTemperature;
	msg.prndl = prndl;
	msg.tirePressure = tirePressure;
	msg.odometer = odometer;
	msg.beltStatus = beltStatus;
	msg.bodyInformation = bodyInformation;
	msg.deviceStatus = deviceStatus;
    msg.driverBraking = driverBraking;
    msg.wiperStatus = wiperStatus;
    msg.headLampStatus = headLampStatus;
    msg.engineTorque = engineTorque;
    msg.accPedalPosition = accPedalPosition;
    msg.steeringWheelAngle = steeringWheelAngle;
	msg.correlationID = correlationID;
	
	return msg;
}

+(FMCUnregisterAppInterface*) buildUnregisterAppInterfaceWithCorrelationID:(NSNumber*) correlationID  {
	
    FMCUnregisterAppInterface* msg = [[[FMCUnregisterAppInterface alloc] init] autorelease];
	msg.correlationID = correlationID;
	
    return msg;
}

+(FMCUnsubscribeButton*) buildUnsubscribeButtonWithName:(FMCButtonName*) buttonName correlationID:(NSNumber*) correlationID {
	
    FMCUnsubscribeButton *msg = [[[FMCUnsubscribeButton alloc] init] autorelease];
	msg.buttonName = buttonName;
	msg.correlationID = correlationID;
	
	return msg;
}

+(FMCUnsubscribeVehicleData*) buildUnsubscribeVehicleDataWithGPS:(NSNumber*) gps speed:(NSNumber*) speed rpm:(NSNumber*) rpm fuelLevel:(NSNumber*) fuelLevel fuelLevelState:(NSNumber*) fuelLevelState instantFuelConsumption:(NSNumber*) instantFuelConsumption externalTemperature:(NSNumber*) externalTemperature prndl:(NSNumber*) prndl tirePressure:(NSNumber*) tirePressure odometer:(NSNumber*) odometer beltStatus:(NSNumber*) beltStatus bodyInformation:(NSNumber*) bodyInformation deviceStatus:(NSNumber*) deviceStatus driverBraking:(NSNumber*) driverBraking wiperStatus:(NSNumber*) wiperStatus headLampStatus:(NSNumber*) headLampStatus engineTorque:(NSNumber*) engineTorque accPedalPosition:(NSNumber*) accPedalPosition steeringWheelAngle:(NSNumber*) steeringWheelAngle correlationID:(NSNumber*) correlationID {
	
    FMCUnsubscribeVehicleData* msg = [[[FMCUnsubscribeVehicleData alloc] init] autorelease];
    msg.gps = gps;
	msg.speed = speed;
	msg.rpm = rpm;
	msg.fuelLevel = fuelLevel;
	msg.fuelLevelState = fuelLevelState;
	msg.instantFuelConsumption = instantFuelConsumption;
	msg.externalTemperature = externalTemperature;
	msg.prndl = prndl;
	msg.tirePressure = tirePressure;
	msg.odometer = odometer;
	msg.beltStatus = beltStatus;
	msg.bodyInformation = bodyInformation;
	msg.deviceStatus = deviceStatus;
    msg.driverBraking = driverBraking;
    msg.wiperStatus = wiperStatus;
    msg.headLampStatus = headLampStatus;
    msg.engineTorque = engineTorque;
    msg.accPedalPosition = accPedalPosition;
    msg.steeringWheelAngle = steeringWheelAngle;
	msg.correlationID = correlationID;
	
	return msg;
}

@end
