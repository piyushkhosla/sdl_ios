//  FMCLanguage.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCLanguage.h>

FMCLanguage* FMCLanguage_EN_US = nil;
FMCLanguage* FMCLanguage_ES_MX = nil;
FMCLanguage* FMCLanguage_FR_CA = nil;
FMCLanguage* FMCLanguage_DE_DE = nil;
FMCLanguage* FMCLanguage_ES_ES = nil;
FMCLanguage* FMCLanguage_EN_GB = nil;
FMCLanguage* FMCLanguage_RU_RU = nil;
FMCLanguage* FMCLanguage_TR_TR = nil;
FMCLanguage* FMCLanguage_PL_PL = nil;
FMCLanguage* FMCLanguage_FR_FR = nil;
FMCLanguage* FMCLanguage_IT_IT = nil;
FMCLanguage* FMCLanguage_SV_SE = nil;
FMCLanguage* FMCLanguage_PT_PT = nil;
FMCLanguage* FMCLanguage_NL_NL = nil;
FMCLanguage* FMCLanguage_EN_AU = nil;
FMCLanguage* FMCLanguage_ZH_CN = nil;
FMCLanguage* FMCLanguage_ZH_TW = nil;
FMCLanguage* FMCLanguage_JA_JP = nil;
FMCLanguage* FMCLanguage_AR_SA = nil;
FMCLanguage* FMCLanguage_KO_KR = nil;
FMCLanguage* FMCLanguage_PT_BR = nil;
FMCLanguage* FMCLanguage_CS_CZ = nil;
FMCLanguage* FMCLanguage_DA_DK = nil;
FMCLanguage* FMCLanguage_NO_NO = nil;

NSMutableArray* FMCLanguage_values = nil;

@implementation FMCLanguage

+(FMCLanguage*) valueOf:(NSString*) value {
    for (FMCLanguage* item in FMCLanguage.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCLanguage_values == nil) {
        FMCLanguage_values = [[NSMutableArray alloc] initWithObjects:
                             FMCLanguage.EN_US,
                             FMCLanguage.ES_MX,
                             FMCLanguage.FR_CA,
                             FMCLanguage.DE_DE,
                             FMCLanguage.ES_ES,
                             FMCLanguage.EN_GB,
                             FMCLanguage.RU_RU,
                             FMCLanguage.TR_TR,
                             FMCLanguage.PL_PL,
                             FMCLanguage.FR_FR,
                             FMCLanguage.IT_IT,
                             FMCLanguage.SV_SE,
                             FMCLanguage.PT_PT,
                             FMCLanguage.NL_NL,
                             FMCLanguage.EN_AU,
                             FMCLanguage.ZH_CN,
                             FMCLanguage.ZH_TW,
                             FMCLanguage.JA_JP,
                             FMCLanguage.AR_SA,
                             FMCLanguage.KO_KR,
                             FMCLanguage.PT_BR,
                             FMCLanguage.CS_CZ,
                             FMCLanguage.DA_DK,
                             FMCLanguage.NO_NO,
                             nil];
    }
    return FMCLanguage_values;
}

+(FMCLanguage*) EN_US {
    if (FMCLanguage_EN_US == nil) {
        FMCLanguage_EN_US = [[FMCLanguage alloc] initWithValue:@"EN-US"];
    }
    return FMCLanguage_EN_US;
}

+(FMCLanguage*) ES_MX {
    if (FMCLanguage_ES_MX == nil) {
        FMCLanguage_ES_MX = [[FMCLanguage alloc] initWithValue:@"ES-MX"];
    }
    return FMCLanguage_ES_MX;
}

+(FMCLanguage*) FR_CA {
    if (FMCLanguage_FR_CA == nil) {
        FMCLanguage_FR_CA = [[FMCLanguage alloc] initWithValue:@"FR-CA"];
    }
    return FMCLanguage_FR_CA;
}

+(FMCLanguage*) DE_DE {
    if (FMCLanguage_DE_DE == nil) {
        FMCLanguage_DE_DE = [[FMCLanguage alloc] initWithValue:@"DE-DE"];
    }
    return FMCLanguage_DE_DE;
}

+(FMCLanguage*) ES_ES {
    if (FMCLanguage_ES_ES == nil) {
        FMCLanguage_ES_ES = [[FMCLanguage alloc] initWithValue:@"ES-ES"];
    }
    return FMCLanguage_ES_ES;
}

+(FMCLanguage*) EN_GB {
    if (FMCLanguage_EN_GB == nil) {
        FMCLanguage_EN_GB = [[FMCLanguage alloc] initWithValue:@"EN-GB"];
    }
    return FMCLanguage_EN_GB;
}

+(FMCLanguage*) RU_RU {
    if (FMCLanguage_RU_RU == nil) {
        FMCLanguage_RU_RU = [[FMCLanguage alloc] initWithValue:@"RU-RU"];
    }
    return FMCLanguage_RU_RU;
}

+(FMCLanguage*) TR_TR {
    if (FMCLanguage_TR_TR == nil) {
        FMCLanguage_TR_TR = [[FMCLanguage alloc] initWithValue:@"TR-TR"];
    }
    return FMCLanguage_TR_TR;
}

+(FMCLanguage*) PL_PL {
    if (FMCLanguage_PL_PL == nil) {
        FMCLanguage_PL_PL = [[FMCLanguage alloc] initWithValue:@"PL-PL"];
    }
    return FMCLanguage_PL_PL;
}

+(FMCLanguage*) FR_FR {
    if (FMCLanguage_FR_FR == nil) {
        FMCLanguage_FR_FR = [[FMCLanguage alloc] initWithValue:@"FR-FR"];
    }
    return FMCLanguage_FR_FR;
}

+(FMCLanguage*) IT_IT {
    if (FMCLanguage_IT_IT == nil) {
        FMCLanguage_IT_IT = [[FMCLanguage alloc] initWithValue:@"IT-IT"];
    }
    return FMCLanguage_IT_IT;
}

+(FMCLanguage*) SV_SE {
    if (FMCLanguage_SV_SE == nil) {
        FMCLanguage_SV_SE = [[FMCLanguage alloc] initWithValue:@"SV-SE"];
    }
    return FMCLanguage_SV_SE;
}

+(FMCLanguage*) PT_PT {
    if (FMCLanguage_PT_PT == nil) {
        FMCLanguage_PT_PT = [[FMCLanguage alloc] initWithValue:@"PT-PT"];
    }
    return FMCLanguage_PT_PT;
}

+(FMCLanguage*) NL_NL {
    if (FMCLanguage_NL_NL == nil) {
        FMCLanguage_NL_NL = [[FMCLanguage alloc] initWithValue:@"NL-NL"];
    }
    return FMCLanguage_NL_NL;
}

+(FMCLanguage*) EN_AU {
    if (FMCLanguage_EN_AU == nil) {
        FMCLanguage_EN_AU = [[FMCLanguage alloc] initWithValue:@"EN-AU"];
    }
    return FMCLanguage_EN_AU;
}

+(FMCLanguage*) ZH_CN {
    if (FMCLanguage_ZH_CN == nil) {
        FMCLanguage_ZH_CN = [[FMCLanguage alloc] initWithValue:@"ZH-CN"];
    }
    return FMCLanguage_ZH_CN;
}

+(FMCLanguage*) ZH_TW {
    if (FMCLanguage_ZH_TW == nil) {
        FMCLanguage_ZH_TW = [[FMCLanguage alloc] initWithValue:@"ZH-TW"];
    }
    return FMCLanguage_ZH_TW;
}

+(FMCLanguage*) JA_JP {
    if (FMCLanguage_JA_JP == nil) {
        FMCLanguage_JA_JP = [[FMCLanguage alloc] initWithValue:@"JA-JP"];
    }
    return FMCLanguage_JA_JP;
}

+(FMCLanguage*) AR_SA {
    if (FMCLanguage_AR_SA == nil) {
        FMCLanguage_AR_SA = [[FMCLanguage alloc] initWithValue:@"AR-SA"];
    }
    return FMCLanguage_AR_SA;
}

+(FMCLanguage*) KO_KR {
    if (FMCLanguage_KO_KR == nil) {
        FMCLanguage_KO_KR = [[FMCLanguage alloc] initWithValue:@"KO-KR"];
    }
    return FMCLanguage_KO_KR;
}

+(FMCLanguage*) PT_BR {
    if (FMCLanguage_PT_BR == nil) {
        FMCLanguage_PT_BR = [[FMCLanguage alloc] initWithValue:@"PT-BR"];
    }
    return FMCLanguage_PT_BR;
}

+(FMCLanguage*) CS_CZ {
    if (FMCLanguage_CS_CZ == nil) {
        FMCLanguage_CS_CZ = [[FMCLanguage alloc] initWithValue:@"CS-CZ"];
    }
    return FMCLanguage_CS_CZ;
}

+(FMCLanguage*) DA_DK {
    if (FMCLanguage_DA_DK == nil) {
        FMCLanguage_DA_DK = [[FMCLanguage alloc] initWithValue:@"DA-DK"];
    }
    return FMCLanguage_DA_DK;
}

+(FMCLanguage*) NO_NO {
    if (FMCLanguage_NO_NO == nil) {
        FMCLanguage_NO_NO = [[FMCLanguage alloc] initWithValue:@"NO-NO"];
    }
    return FMCLanguage_NO_NO;
}

@end
