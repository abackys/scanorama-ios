//
//  Config.h
//  scanorama
//
//  Created by Lion User on 13/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCConfig : NSObject {
    NSNumber *cityId;
    
}

@property (nonatomic, retain) NSNumber *cityId;

+(id) sharedInstance;


//@property (nonatomic,assign) int cityId;


//+(int) mySecondStatic;
///+(int) getMySecondStatic;
//+(void)setMySecondStatic:(int)city;
/*

+(int) getSelectedCityId;
+(void) setSelectedCityId:(int)cityId;
*/
-(NSString *)getCityName;
 
@end
