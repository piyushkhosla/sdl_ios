//  FMCLanguage.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * Specifies the language to be used for TTS, VR, displayed messages/menus
 * <p>
 *
 * Avaliable since <font color=red><b> AppLink 1.0 </b></font>
 *
 */
@interface FMCLanguage : FMCEnum {}

/*!
 @abstract get a Langusge according to a String
 @param value NSString
 @result return the Language
 */
+(FMCLanguage*) valueOf:(NSString*) value;
/*!
 @abstract store all possible Language values
 @result return an array with all possible Language values inside
 */
+(NSMutableArray*) values;

/*!
 @abstract language English_US
 */
+(FMCLanguage*) EN_US;
/*!
 @abstract language ES_MX
 */
+(FMCLanguage*) ES_MX;
/*!
 @abstract language FR_CA
 */
+(FMCLanguage*) FR_CA;
/*!
 @abstract language DE_DE
 */
+(FMCLanguage*) DE_DE;
/*!
 @abstract language ES_ES
 */
+(FMCLanguage*) ES_ES;
/*!
 @abstract language EN_GB
 */
+(FMCLanguage*) EN_GB;
/*!
 @abstract language RU_RU
 */
+(FMCLanguage*) RU_RU;
/*!
 @abstract language TR_TR
 */
+(FMCLanguage*) TR_TR;
/*!
 @abstract language PL_PL
 */
+(FMCLanguage*) PL_PL;
/*!
 @abstract language FR_FR
 */
+(FMCLanguage*) FR_FR;
/*!
 @abstract language IT_IT
 */
+(FMCLanguage*) IT_IT;
/*!
 @abstract language SV_SE
 */
+(FMCLanguage*) SV_SE;
/*!
 @abstract language PT_PT
 */
+(FMCLanguage*) PT_PT;
/*!
 @abstract language NL_NL
 */
+(FMCLanguage*) NL_NL;
/*!
 @abstract language EN_AU
 */
+(FMCLanguage*) EN_AU;
/*!
 @abstract language Chinese 
 */
+(FMCLanguage*) ZH_CN;
/*!
 @abstract language Chinese TaiWan
 */
+(FMCLanguage*) ZH_TW;
/*!
 @abstract language JA_JP
 */
+(FMCLanguage*) JA_JP;
/*!
 @abstract language AR_SA
 */
+(FMCLanguage*) AR_SA;
/*!
 @abstract language KO_KR
 */
+(FMCLanguage*) KO_KR;
/*!
 @abstract language PT_BR
 */
+(FMCLanguage*) PT_BR;
/*!
 @abstract language CS_CZ
 */
+(FMCLanguage*) CS_CZ;
/*!
 @abstract language DA_DK
 */
+(FMCLanguage*) DA_DK;
/*!
 @abstract language NO_NO
 */
+(FMCLanguage*) NO_NO;

@end
