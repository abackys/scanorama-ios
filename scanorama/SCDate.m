//
//  SCDate.m
//  scanorama
//
//  Created by Lion User on 12/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SCDate.h"

@implementation SCDate

@synthesize date = _date;
@synthesize dateStringLt = _dateStringLt;
@synthesize dateStringEn = _dateStringEn;

-(id)initWithDate:(NSDate *)date dateStringLt:(NSString *)stringLt dateStringEn:(NSString *) stringEn; {   
    if ((self = [super init])) {
        _date = date;
        _dateStringLt = stringLt;
        _dateStringEn = stringEn;               
    }
    return self;
}
@end
