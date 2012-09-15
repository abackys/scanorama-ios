//
//  Config.m
//  scanorama
//
//  Created by Lion User on 13/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SCConfig.h"

@implementation SCConfig

@synthesize cityId;

+(id)sharedInstance {
    
    static SCConfig *sharedInstance = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


-(id)init {
    if(self = [super init])
        cityId = [[NSNumber alloc] initWithInt:1];
    return self;
}

-(void)dealloc {
    
}
/*
static int mySecondStatic;

+(int)mySecondStatic {
    return mySecondStatic;
}

+(int) getMySecondStatic {
    return mySecondStatic;
}

+(void)setMySecondStatic:(int)city{
    mySecondStatic = city;
}

@synthesize cityId = _cityId;


+(int) getSelectedCityId{
    return _cityId;
}
+(void) setSelectedCityId:(int)cityId{
SCConfig.cityId = cityId;
}

+(void)setMyStaticValue:(int)cityId {
    
}
 */

-(NSString *)getCityName {
    
    switch ([cityId intValue]) {
        case 1:
            return @"Vilnius";
            break;
        case 2:
            return @"Kaunas";
            break;
        case 3:
            return @"Klaipėda";
            break;
        case 4:
            return @"Šiauliai";
            break;
            
        default:
            return @"Vilnius";
    }
}

@end
