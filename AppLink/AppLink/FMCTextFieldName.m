//  FMCTextFieldName.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCTextFieldName.h>

FMCTextFieldName* FMCTextFieldName_mainField1 = nil;
FMCTextFieldName* FMCTextFieldName_mainField2 = nil;
FMCTextFieldName* FMCTextFieldName_mainField3 = nil;
FMCTextFieldName* FMCTextFieldName_mainField4 = nil;
FMCTextFieldName* FMCTextFieldName_statusBar = nil;
FMCTextFieldName* FMCTextFieldName_mediaClock = nil;
FMCTextFieldName* FMCTextFieldName_mediaTrack = nil;
FMCTextFieldName* FMCTextFieldName_alertText1 = nil;
FMCTextFieldName* FMCTextFieldName_alertText2 = nil;
FMCTextFieldName* FMCTextFieldName_alertText3 = nil;
FMCTextFieldName* FMCTextFieldName_scrollableMessageBody = nil;
FMCTextFieldName* FMCTextFieldName_initialInteractionText = nil;
FMCTextFieldName* FMCTextFieldName_navigationText1 = nil;
FMCTextFieldName* FMCTextFieldName_navigationText2 = nil;
FMCTextFieldName* FMCTextFieldName_ETA = nil;
FMCTextFieldName* FMCTextFieldName_totalDistance = nil;
FMCTextFieldName* FMCTextFieldName_audioPassThruDisplayText1 = nil;
FMCTextFieldName* FMCTextFieldName_audioPassThruDisplayText2 = nil;
FMCTextFieldName* FMCTextFieldName_sliderHeader = nil;
FMCTextFieldName* FMCTextFieldName_sliderFooter = nil;

NSMutableArray* FMCTextFieldName_values = nil;
@implementation FMCTextFieldName

+(FMCTextFieldName*) valueOf:(NSString*) value {
    for (FMCTextFieldName* item in FMCTextFieldName.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCTextFieldName_values == nil) {
        FMCTextFieldName_values = [[NSMutableArray alloc] initWithObjects:
                FMCTextFieldName.mainField1,
                FMCTextFieldName.mainField2,
                FMCTextFieldName.mainField3,
                FMCTextFieldName.mainField4,
                FMCTextFieldName.statusBar,
                FMCTextFieldName.mediaClock,
                FMCTextFieldName.mediaTrack,
                FMCTextFieldName.alertText1,
                FMCTextFieldName.alertText2,
                FMCTextFieldName.alertText3,
                FMCTextFieldName.scrollableMessageBody,
                FMCTextFieldName.initialInteractionText,
                FMCTextFieldName.navigationText1,
                FMCTextFieldName.navigationText2,
                FMCTextFieldName.ETA,
                FMCTextFieldName.totalDistance,
                FMCTextFieldName.audioPassThruDisplayText1,
                FMCTextFieldName.audioPassThruDisplayText2,
                FMCTextFieldName.sliderHeader,
                FMCTextFieldName.sliderFooter,
                nil];
    }
    return FMCTextFieldName_values;
}

+(FMCTextFieldName*) mainField1 {
    	if (FMCTextFieldName_mainField1 == nil) {
        		FMCTextFieldName_mainField1 = [[FMCTextFieldName alloc] initWithValue:@"mainField1"];
    	}
    	return FMCTextFieldName_mainField1;
}

+(FMCTextFieldName*) mainField2 {
    	if (FMCTextFieldName_mainField2 == nil) {
        		FMCTextFieldName_mainField2 = [[FMCTextFieldName alloc] initWithValue:@"mainField2"];
    	}
    	return FMCTextFieldName_mainField2;
}

+(FMCTextFieldName*) mainField3 {
    if (FMCTextFieldName_mainField3 == nil) {
        FMCTextFieldName_mainField3 = [[FMCTextFieldName alloc] initWithValue:@"mainField3"];
    }
    return FMCTextFieldName_mainField3;
}

+(FMCTextFieldName*) mainField4 {
    if (FMCTextFieldName_mainField4 == nil) {
        FMCTextFieldName_mainField4 = [[FMCTextFieldName alloc] initWithValue:@"mainField4"];
    }
    return FMCTextFieldName_mainField4;
}

+(FMCTextFieldName*) statusBar {
    	if (FMCTextFieldName_statusBar == nil) {
        		FMCTextFieldName_statusBar = [[FMCTextFieldName alloc] initWithValue:@"statusBar"];
    	}
    	return FMCTextFieldName_statusBar;
}

+(FMCTextFieldName*) mediaClock {
    	if (FMCTextFieldName_mediaClock == nil) {
        		FMCTextFieldName_mediaClock = [[FMCTextFieldName alloc] initWithValue:@"mediaClock"];
    	}
    	return FMCTextFieldName_mediaClock;
}

+(FMCTextFieldName*) mediaTrack {
    	if (FMCTextFieldName_mediaTrack == nil) {
        		FMCTextFieldName_mediaTrack = [[FMCTextFieldName alloc] initWithValue:@"mediaTrack"];
    	}
    	return FMCTextFieldName_mediaTrack;
}

+(FMCTextFieldName*) alertText1 {
    	if (FMCTextFieldName_alertText1 == nil) {
        		FMCTextFieldName_alertText1 = [[FMCTextFieldName alloc] initWithValue:@"alertText1"];
    	}
    	return FMCTextFieldName_alertText1;
}

+(FMCTextFieldName*) alertText2 {
    	if (FMCTextFieldName_alertText2 == nil) {
        		FMCTextFieldName_alertText2 = [[FMCTextFieldName alloc] initWithValue:@"alertText2"];
    	}
    	return FMCTextFieldName_alertText2;
}

+(FMCTextFieldName*) alertText3 {
    if (FMCTextFieldName_alertText3 == nil) {
        FMCTextFieldName_alertText3 = [[FMCTextFieldName alloc] initWithValue:@"alertText3"];
    }
    return FMCTextFieldName_alertText3;
}

+(FMCTextFieldName*) scrollableMessageBody {
    if (FMCTextFieldName_scrollableMessageBody == nil) {
        FMCTextFieldName_scrollableMessageBody = [[FMCTextFieldName alloc] initWithValue:@"scrollableMessageBody"];
    }
    return FMCTextFieldName_scrollableMessageBody;
}

+(FMCTextFieldName*) initialInteractionText {
    if (FMCTextFieldName_initialInteractionText == nil) {
        FMCTextFieldName_initialInteractionText = [[FMCTextFieldName alloc] initWithValue:@"initialInteractionText"];
    }
    return FMCTextFieldName_initialInteractionText;
}

+(FMCTextFieldName*) navigationText1 {
    if (FMCTextFieldName_navigationText1 == nil) {
        FMCTextFieldName_navigationText1 = [[FMCTextFieldName alloc] initWithValue:@"navigationText1"];
    }
    return FMCTextFieldName_navigationText1;
}

+(FMCTextFieldName*) navigationText2 {
    if (FMCTextFieldName_navigationText2 == nil) {
        FMCTextFieldName_navigationText2 = [[FMCTextFieldName alloc] initWithValue:@"navigationText2"];
    }
    return FMCTextFieldName_navigationText2;
}

+(FMCTextFieldName*) ETA {
    if (FMCTextFieldName_ETA == nil) {
        FMCTextFieldName_ETA = [[FMCTextFieldName alloc] initWithValue:@"ETA"];
    }
    return FMCTextFieldName_ETA;
}

+(FMCTextFieldName*) totalDistance {
    if (FMCTextFieldName_totalDistance == nil) {
        FMCTextFieldName_totalDistance = [[FMCTextFieldName alloc] initWithValue:@"totalDistance"];
    }
    return FMCTextFieldName_totalDistance;
}

+(FMCTextFieldName*) audioPassThruDisplayText1 {
    if (FMCTextFieldName_audioPassThruDisplayText1 == nil) {
        FMCTextFieldName_audioPassThruDisplayText1 = [[FMCTextFieldName alloc] initWithValue:@"audioPassThruDisplayText1"];
    }
    return FMCTextFieldName_audioPassThruDisplayText1;
}

+(FMCTextFieldName*) audioPassThruDisplayText2 {
    if (FMCTextFieldName_audioPassThruDisplayText2 == nil) {
        FMCTextFieldName_audioPassThruDisplayText2 = [[FMCTextFieldName alloc] initWithValue:@"audioPassThruDisplayText2"];
    }
    return FMCTextFieldName_audioPassThruDisplayText2;
}

+(FMCTextFieldName*) sliderHeader {
    if (FMCTextFieldName_sliderHeader == nil) {
        FMCTextFieldName_sliderHeader = [[FMCTextFieldName alloc] initWithValue:@"sliderHeader"];
    }
    return FMCTextFieldName_sliderHeader;
}

+(FMCTextFieldName*) sliderFooter {
    if (FMCTextFieldName_sliderFooter == nil) {
        FMCTextFieldName_sliderFooter = [[FMCTextFieldName alloc] initWithValue:@"sliderFooter"];
    }
    return FMCTextFieldName_sliderFooter;
}

@end
