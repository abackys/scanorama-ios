//
//  Movies.h
//  scanorama
//
//  Created by Lion User on 01/10/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Schedule;

@interface Movies : NSManagedObject

@property (nonatomic, retain) NSString * cast;
@property (nonatomic, retain) NSString * cinematography;
@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSString * createdYear;
@property (nonatomic, retain) NSString * director;
@property (nonatomic, retain) NSString * directorDescription;
@property (nonatomic, retain) NSString * directorFilms;
@property (nonatomic, retain) NSString * duration;
@property (nonatomic, retain) NSString * editing;
@property (nonatomic, retain) NSString * fullImage;
@property (nonatomic, retain) NSString * group;
@property (nonatomic, retain) NSString * moviedescription;
@property (nonatomic, retain) NSString * movieId;
@property (nonatomic, retain) NSString * music;
@property (nonatomic, retain) NSString * screenplay;
@property (nonatomic, retain) NSString * thumbImage;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * titleEn;
@property (nonatomic, retain) NSString * titleNative;
@property (nonatomic, retain) NSString * videoUrl;
@property (nonatomic, retain) NSSet *schedule;
@end

@interface Movies (CoreDataGeneratedAccessors)

- (void)addScheduleObject:(Schedule *)value;
- (void)removeScheduleObject:(Schedule *)value;
- (void)addSchedule:(NSSet *)values;
- (void)removeSchedule:(NSSet *)values;

@end
