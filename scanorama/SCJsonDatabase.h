//
//  SCJsonDatabase.h
//  scanorama
//
//  Created by Lion User on 20/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movies.h"
#import "Schedule.h"

@interface SCJsonDatabase : NSObject <NSFetchedResultsControllerDelegate>


@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

- (void) insertMoviesJsonToDatabase;
-(void) insertScheduleJsonToDatabase;

@end
