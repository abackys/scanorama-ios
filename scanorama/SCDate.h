//
//  SCDate.h
//  scanorama
//
//  Created by Lion User on 12/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCDate : NSObject

@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) NSString * dateStringLt;
@property (strong, nonatomic) NSString * dateStringEn;


-(id)initWithDate:(NSDate *)date dateStringLt:(NSString *)stringLt dateStringEn:(NSString *) stringEn;
@end
