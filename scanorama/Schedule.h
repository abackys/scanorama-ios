//
//  Schedule.h
//  scanorama
//
//  Created by Lion User on 13/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Movies;

@interface Schedule : NSManagedObject

@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * favorite;
@property (nonatomic, retain) NSString * cinema;
@property (nonatomic, retain) Movies *movie;

@end
