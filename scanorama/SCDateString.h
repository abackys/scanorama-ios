//
//  SCDateString.h
//  scanorama
//
//  Created by Lion User on 12/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCDate.h"
@interface SCDateString : NSObject

@property (strong, nonatomic) NSArray *datesArray;
@property (assign) int currentDateIndex;



- (id)initWithPredefinedData;
-(SCDate *) getDateByDayNumber:(int)day;
-(SCDate *) getDateStringsByDate:(NSDate *)date;
-(SCDate *) getCurrentDate;
-(SCDate *) nextDay;
-(SCDate *) previousDay;
-(SCDate *) getNextDay;
-(SCDate *) getPreviousDay;
    


@end
