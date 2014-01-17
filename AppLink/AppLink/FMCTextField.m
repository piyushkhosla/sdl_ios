//  FMCTextField.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCTextField.h>

#import <AppLink/FMCNames.h>

@implementation FMCTextField

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setName:(FMCTextFieldName*) name {
    if (name != nil) {
        [store setObject:name forKey:NAMES_name];
    } else {
        [store removeObjectForKey:NAMES_name];
    }
}

-(FMCTextFieldName*) name {
    NSObject* obj = [store objectForKey:NAMES_name];
    if ([obj isKindOfClass:FMCTextFieldName.class]) {
        return (FMCTextFieldName*)obj;
    } else { 
        return [FMCTextFieldName valueOf:(NSString*)obj];
    }
}

-(void) setCharacterSet:(FMCCharacterSet*) characterSet {
    if (characterSet != nil) {
        [store setObject:characterSet forKey:NAMES_characterSet];
    } else {
        [store removeObjectForKey:NAMES_characterSet];
    }
}

-(FMCCharacterSet*) characterSet {
    NSObject* obj = [store objectForKey:NAMES_characterSet];
    if ([obj isKindOfClass:FMCCharacterSet.class]) {
        return (FMCCharacterSet*)obj;
    } else { 
        return [FMCCharacterSet valueOf:(NSString*)obj];
    }
}

-(void) setWidth:(NSNumber*) width {
    if (width != nil) {
        [store setObject:width forKey:NAMES_width];
    } else {
        [store removeObjectForKey:NAMES_width];
    }
}

-(NSNumber*) width {
    return [store objectForKey:NAMES_width];
}

-(void) setRows:(NSNumber*) rows {
    if (rows != nil) {
        [store setObject:rows forKey:NAMES_rows];
    } else {
        [store removeObjectForKey:NAMES_rows];
    }
}

-(NSNumber*) rows {
    return [store objectForKey:NAMES_rows];
}

@end
