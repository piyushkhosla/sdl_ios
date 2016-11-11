//
//  SDLTPMS.m
//  SmartDeviceLink-iOS
//

#import "SDLTPMS.h"
SDLTPMS *SDLTPMS_UNKNOWN = nil;
SDLTPMS *SDLTPMS_SYSTEM_FAULT = nil;
SDLTPMS *SDLTPMS_SENSOR_FAULT = nil;
SDLTPMS *SDLTPMS_LOW = nil;
SDLTPMS *SDLTPMS_SYSTEM_ACTIVE = nil;
SDLTPMS *SDLTPMS_TRAIN_LF_TIRE = nil;
SDLTPMS *SDLTPMS_TRAIN_RF_TIRE = nil;
SDLTPMS *SDLTPMS_TRAIN_RR_TIRE = nil;
SDLTPMS *SDLTPMS_TRAIN_ORR_TIRE = nil;
SDLTPMS *SDLTPMS_TRAIN_IRR_TIRE = nil;
SDLTPMS *SDLTPMS_TRAIN_LR_TIRE = nil;
SDLTPMS *SDLTPMS_TRAIN_OLR_TIRE = nil;
SDLTPMS *SDLTPMS_TRAIN_ILR_TIRE = nil;
SDLTPMS *SDLTPMS_TRAINING_COMPLETE = nil;
SDLTPMS *SDLTPMS_TIRES_NOT_TRAINED = nil;

NSArray *SDLTPMS_values = nil;

@implementation SDLTPMS

+ (SDLTPMS *)valueOf:(NSString *)value {
    for (SDLTPMS *item in SDLTPMS.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+ (NSArray *)values {
    if (SDLTPMS_values == nil) {
        SDLTPMS_values = @[
                           SDLTPMS.UNKNOWN,
                           SDLTPMS.SYSTEM_FAULT,
                           SDLTPMS.SENSOR_FAULT,
                           SDLTPMS.LOW,
                           SDLTPMS.SYSTEM_ACTIVE,
                           SDLTPMS.TRAIN_LF_TIRE,
                           SDLTPMS.TRAIN_RF_TIRE,
                           SDLTPMS.TRAIN_RR_TIRE,
                           SDLTPMS.TRAIN_ORR_TIRE,
                           SDLTPMS.TRAIN_IRR_TIRE,
                           SDLTPMS.TRAIN_LR_TIRE,
                           SDLTPMS.TRAIN_OLR_TIRE,
                           SDLTPMS.TRAIN_ILR_TIRE,
                           SDLTPMS.TRAINING_COMPLETE,
                           SDLTPMS.TIRES_NOT_TRAINED
                           ];
    }
    return SDLTPMS_values;
}


+ (SDLTPMS *)UNKNOWN {
    if (SDLTPMS_UNKNOWN == nil) {
        SDLTPMS_UNKNOWN = [[SDLTPMS alloc] initWithValue:@"UNKNOWN"];
    }
    return SDLTPMS_UNKNOWN;
}

+ (SDLTPMS *)SYSTEM_FAULT {
    if (SDLTPMS_SYSTEM_FAULT == nil) {
        SDLTPMS_SYSTEM_FAULT = [[SDLTPMS alloc] initWithValue:@"SYSTEM_FAULT"];
    }
    return SDLTPMS_SYSTEM_FAULT;
}

+ (SDLTPMS *)SENSOR_FAULT {
    if (SDLTPMS_SENSOR_FAULT == nil) {
        SDLTPMS_SENSOR_FAULT = [[SDLTPMS alloc] initWithValue:@"SENSOR_FAULT"];
    }
    return SDLTPMS_SENSOR_FAULT;
}

+ (SDLTPMS *)LOW {
    if (SDLTPMS_LOW == nil) {
        SDLTPMS_LOW = [[SDLTPMS alloc] initWithValue:@"LOW"];
    }
    return SDLTPMS_LOW;
}

+ (SDLTPMS *)SYSTEM_ACTIVE {
    if (SDLTPMS_SYSTEM_ACTIVE == nil) {
        SDLTPMS_SYSTEM_ACTIVE = [[SDLTPMS alloc] initWithValue:@"SYSTEM_ACTIVE"];
    }
    return SDLTPMS_SYSTEM_ACTIVE;
}

+ (SDLTPMS *)TRAIN_LF_TIRE {
    if (SDLTPMS_TRAIN_LF_TIRE == nil) {
        SDLTPMS_TRAIN_LF_TIRE = [[SDLTPMS alloc] initWithValue:@"TRAIN_LF_TIRE"];
    }
    return SDLTPMS_TRAIN_LF_TIRE;
}
+ (SDLTPMS *)TRAIN_RF_TIRE {
    if (SDLTPMS_TRAIN_RF_TIRE == nil) {
        SDLTPMS_TRAIN_RF_TIRE = [[SDLTPMS alloc] initWithValue:@"TRAIN_RF_TIRE"];
    }
    return SDLTPMS_TRAIN_RF_TIRE;
}


+ (SDLTPMS *)TRAIN_RR_TIRE {
    if (SDLTPMS_TRAIN_RR_TIRE == nil) {
        SDLTPMS_TRAIN_RR_TIRE = [[SDLTPMS alloc] initWithValue:@"TRAIN_RR_TIRE"];
    }
    return SDLTPMS_TRAIN_RR_TIRE;
}

+ (SDLTPMS *)TRAIN_ORR_TIRE {
    if (SDLTPMS_TRAIN_ORR_TIRE == nil) {
        SDLTPMS_TRAIN_ORR_TIRE = [[SDLTPMS alloc] initWithValue:@"TRAIN_ORR_TIRE"];
    }
    return SDLTPMS_TRAIN_ORR_TIRE;
}

+ (SDLTPMS *)TRAIN_IRR_TIRE {
    if (SDLTPMS_TRAIN_IRR_TIRE == nil) {
        SDLTPMS_TRAIN_IRR_TIRE = [[SDLTPMS alloc] initWithValue:@"TRAIN_IRR_TIRE"];
    }
    return SDLTPMS_TRAIN_IRR_TIRE;
}

+ (SDLTPMS *)TRAIN_LR_TIRE {
    if (SDLTPMS_TRAIN_LR_TIRE == nil) {
        SDLTPMS_TRAIN_LR_TIRE = [[SDLTPMS alloc] initWithValue:@"TRAIN_LR_TIRE"];
    }
    return SDLTPMS_TRAIN_LR_TIRE;
}

+ (SDLTPMS *)TRAIN_OLR_TIRE {
    if (SDLTPMS_TRAIN_OLR_TIRE == nil) {
        SDLTPMS_TRAIN_OLR_TIRE = [[SDLTPMS alloc] initWithValue:@"TRAIN_OLR_TIRE"];
    }
    return SDLTPMS_TRAIN_OLR_TIRE;
}

+ (SDLTPMS *)TRAIN_ILR_TIRE {
    if (SDLTPMS_TRAIN_ILR_TIRE == nil) {
        SDLTPMS_TRAIN_ILR_TIRE = [[SDLTPMS alloc] initWithValue:@"TRAIN_ILR_TIRE"];
    }
    return SDLTPMS_TRAIN_ILR_TIRE;
}

+ (SDLTPMS *)TRAINING_COMPLETE {
    if (SDLTPMS_TRAINING_COMPLETE == nil) {
        SDLTPMS_TRAINING_COMPLETE = [[SDLTPMS alloc] initWithValue:@"TRAINING_COMPLETE"];
    }
    return SDLTPMS_TRAINING_COMPLETE;
}

+ (SDLTPMS *)TIRES_NOT_TRAINED {
    if (SDLTPMS_TIRES_NOT_TRAINED == nil) {
        SDLTPMS_TIRES_NOT_TRAINED = [[SDLTPMS alloc] initWithValue:@"TIRES_NOT_TRAINED"];
    }
    return SDLTPMS_TIRES_NOT_TRAINED;
}

@end
