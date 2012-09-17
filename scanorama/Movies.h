//
//  Movies.h
//  scanorama
//
//  Created by Lion User on 12/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Schedule;

@interface Movies : NSManagedObject

@property (nonatomic, retain) NSString * createdYear;
@property (nonatomic, retain) NSString * fullImage;
@property (nonatomic, retain) NSString * thumbImage;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * titleEn;
@property (nonatomic, retain) NSString * duration;
@property (nonatomic, retain) NSString * director;
@property (nonatomic, retain) NSString * group;
@property (nonatomic, retain) NSSet *schedule;
@end

@interface Movies (CoreDataGeneratedAccessors)

- (void)addScheduleObject:(Schedule *)value;
- (void)removeScheduleObject:(Schedule *)value;
- (void)addSchedule:(NSSet *)values;
- (void)removeSchedule:(NSSet *)values;

@end
