//
//  SCDateString.m
//  scanorama
//
//  Created by Lion User on 12/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SCDateString.h"
#import "SCDate.h"

@implementation SCDateString

@synthesize datesArray = _datesArray;
@synthesize currentDateIndex = _currentDateIndex;


- (id)initWithPredefinedData {   
    if ((self = [super init])) {
       
        _currentDateIndex = 8;
        NSDateComponents *dateComp = [[NSDateComponents alloc ] init];
        [dateComp setDay:8]; [dateComp setMonth:11]; [dateComp setYear:2012];
        NSDate * date8 = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] dateFromComponents:dateComp];
        
        NSDateComponents *dayComponent =  [[NSCalendar currentCalendar] components:NSDayCalendarUnit fromDate:date8];
        
        dayComponent.day = 1;
        
        SCDate *scDate8 = [[SCDate alloc] initWithDate:date8 dateStringLt:@"Lapkričio 8, Ketvirtadienis" dateStringEn:@"8th of November, Thursday"];  
        
        NSDate * date9 = [ [NSCalendar currentCalendar] dateByAddingComponents:dayComponent toDate:date8 options:0];
        
        SCDate *scDate9 = [[SCDate alloc] initWithDate:date9 dateStringLt:@"Lapkričio 9, Penktadienis" dateStringEn:@"9th of November, Friday"];  
        
        NSDate * date10 = [ [NSCalendar currentCalendar] dateByAddingComponents:dayComponent toDate:date9 options:0];
        
        SCDate *scDate10 = [[SCDate alloc] initWithDate:date10 dateStringLt:@"Lapkričio 10, Šeštadienis" dateStringEn:@"10th of November, Saturday"];  
        
        NSDate * date11 = [ [NSCalendar currentCalendar] dateByAddingComponents:dayComponent toDate:date10 options:0];
        
        SCDate *scDate11 = [[SCDate alloc] initWithDate:date11 dateStringLt:@"Lapkričio 11, Sekmadienis" dateStringEn:@"11th of November, Sunday"];  
        
        NSDate * date12 = [ [NSCalendar currentCalendar] dateByAddingComponents:dayComponent toDate:date11 options:0];
        
        SCDate *scDate12 = [[SCDate alloc] initWithDate:date12 dateStringLt:@"Lapkričio 12, Pirmadienis" dateStringEn:@"12th of November, Monday"];  
        
        NSDate * date13 = [ [NSCalendar currentCalendar] dateByAddingComponents:dayComponent toDate:date12 options:0];
        
        SCDate *scDate13 = [[SCDate alloc] initWithDate:date13 dateStringLt:@"Lapkričio 13, Antradienis" dateStringEn:@"13th of November, Thusday"];   
        
        NSDate * date14 = [ [NSCalendar currentCalendar] dateByAddingComponents:dayComponent toDate:date13 options:0];
        
        SCDate *scDate14 = [[SCDate alloc] initWithDate:date14 dateStringLt:@"Lapkričio 14, Trečiadienis" dateStringEn:@"14th of November, Wednesday"];
        
        NSDate * date15 = [ [NSCalendar currentCalendar] dateByAddingComponents:dayComponent toDate:date14 options:0];
        
        SCDate *scDate15 = [[SCDate alloc] initWithDate:date15 dateStringLt:@"Lapkričio 15, Ketvirtadienis" dateStringEn:@"15th of November, Thursday"];  
        
        NSDate * date16 = [ [NSCalendar currentCalendar] dateByAddingComponents:dayComponent toDate:date15 options:0];
        
        SCDate *scDate16 = [[SCDate alloc] initWithDate:date16 dateStringLt:@"Lapkričio 16 Penktadienis" dateStringEn:@"16th of November, Friday"];
        
        _datesArray = [NSArray arrayWithObjects:scDate8,scDate9,scDate10,scDate11,scDate12,scDate13,scDate14,scDate15,scDate16, nil];
       
    }
    return self;
}

-(SCDate *)getDateByDayNumber:(int)day {
    day = day - 8;
    int arrayLenght = _datesArray.count;
  
    if( (day >= 0) && (day < arrayLenght))
        return [_datesArray objectAtIndex:day];
    else {
        return FALSE;
    }
}

-(SCDate *)getDateStringsByDate:(NSDate *)date {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar ];
    int lookedUpDateInt = [calendar ordinalityOfUnit:NSDayCalendarUnit inUnit:NSEraCalendarUnit forDate:date];
    int scDateInt = 0;

    
    for(SCDate *scDate in _datesArray ){
        scDateInt = [calendar ordinalityOfUnit:NSDayCalendarUnit inUnit:NSEraCalendarUnit forDate:scDate.date];
        if(scDateInt == lookedUpDateInt)
            return scDate;
    }
    return [_datesArray objectAtIndex:0];
    
        
}

-(SCDate *)getCurrentDate {
    return [self getDateByDayNumber:_currentDateIndex] ;
}

-(SCDate *)nextDay {
    _currentDateIndex = _currentDateIndex + 1;
    return [self getCurrentDate];
}

-(SCDate *)previousDay {
    _currentDateIndex = _currentDateIndex - 1;
    return [self getCurrentDate];
}

-(SCDate *)getNextDay {
 
    return [self getDateByDayNumber:(_currentDateIndex + 1)];
}

-(SCDate *)getPreviousDay {
return [self getDateByDayNumber:(_currentDateIndex - 1)];
}


@end
