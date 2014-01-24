//  FMCShowConstantTBT.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCShowConstantTBT.h>

#import <AppLink/FMCNames.h>
#import <AppLink/FMCSoftButton.h>

@implementation FMCShowConstantTBT

-(id) init {
    if (self = [super initWithName:NAMES_ShowConstantTBT]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setNavigationText1:(NSString *) navigationText1 {
    if (navigationText1 != nil) {
        [parameters setObject:navigationText1 forKey:NAMES_navigationText1];
    } else {
        [parameters removeObjectForKey:NAMES_navigationText1];
    }
}

-(NSString*) navigationText1 {
    return [parameters objectForKey:NAMES_navigationText1];
}

-(void) setNavigationText2:(NSString *) navigationText2 {
    if (navigationText2 != nil) {
        [parameters setObject:navigationText2 forKey:NAMES_navigationText2];
    } else {
        [parameters removeObjectForKey:NAMES_navigationText2];
    }
}

-(NSString*) navigationText2 {
    return [parameters objectForKey:NAMES_navigationText2];
}

-(void) setEta:(NSString *) eta {
    if (eta != nil) {
        [parameters setObject:eta forKey:NAMES_eta];
    } else {
        [parameters removeObjectForKey:NAMES_eta];
    }
}

-(NSString*) eta {
    return [parameters objectForKey:NAMES_eta];
}

-(void) setTotalDistance:(NSString *) totalDistance {
    if (totalDistance != nil) {
        [parameters setObject:totalDistance forKey:NAMES_totalDistance];
    } else {
        [parameters removeObjectForKey:NAMES_totalDistance];
    }
}

-(NSString*) totalDistance {
    return [parameters objectForKey:NAMES_totalDistance];
}

-(void) setTurnIcon:(FMCImage *) turnIcon {
    if (turnIcon != nil) {
        [parameters setObject:turnIcon forKey:NAMES_turnIcon];
    } else {
        [parameters removeObjectForKey:NAMES_turnIcon];
    }
}

-(FMCImage*) turnIcon {
    NSObject* obj = [parameters objectForKey:NAMES_turnIcon];
    if ([obj isKindOfClass:FMCImage.class]) {
        return (FMCImage*)obj;
    } else {
        return [[[FMCImage alloc] initWithDictionary:(NSMutableDictionary*)obj] autorelease];
    }
}

-(void) setDistanceToManeuver:(NSNumber *) distanceToManeuver {
    if (distanceToManeuver != nil) {
        [parameters setObject:distanceToManeuver forKey:NAMES_distanceToManeuver];
    } else {
        [parameters removeObjectForKey:NAMES_distanceToManeuver];
    }
}

-(NSNumber*) distanceToManeuver {
    return [parameters objectForKey:NAMES_distanceToManeuver];
}

-(void) setDistanceToManeuverScale:(NSNumber *) distanceToManeuverScale {
    if (distanceToManeuverScale != nil) {
        [parameters setObject:distanceToManeuverScale forKey:NAMES_distanceToManeuverScale];
    } else {
        [parameters removeObjectForKey:NAMES_distanceToManeuverScale];
    }
}

-(NSNumber*) distanceToManeuverScale {
    return [parameters objectForKey:NAMES_distanceToManeuverScale];
}

-(void) setManeuverComplete:(NSNumber *) maneuverComplete {
    if (maneuverComplete != nil) {
        [parameters setObject:maneuverComplete forKey:NAMES_maneuverComplete];
    } else {
        [parameters removeObjectForKey:NAMES_maneuverComplete];
    }
}

-(NSNumber*) maneuverComplete {
    return [parameters objectForKey:NAMES_maneuverComplete];
}

-(void) setSoftButtons:(NSMutableArray *) softButtons {
    if (softButtons != nil) {
        [parameters setObject:softButtons forKey:NAMES_softButtons];
    } else {
        [parameters removeObjectForKey:NAMES_softButtons];
    }
}

-(NSMutableArray*) softButtons {
    NSMutableArray* array = [parameters objectForKey:NAMES_softButtons];
    if ([array count] < 1 || [[array objectAtIndex:0] isKindOfClass:FMCSoftButton.class]) {
        return array;
    } else {
        NSMutableArray* newList = [NSMutableArray arrayWithCapacity:[array count]];
        for (NSDictionary* dict in array) {
            [newList addObject:[[[FMCSoftButton alloc] initWithDictionary:(NSMutableDictionary*)dict] autorelease]];
        }
        return newList;
    }
}

@end
