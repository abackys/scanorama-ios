//
//  SCMyProgramViewController.h
//  scanorama
//
//  Created by Lion User on 07/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Schedule.h"
#import "Movies.h"
#import "SCConfig.h"
#import "SCMovieCell.h"

@interface SCMyProgramViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate, FavoriteButtonDelegate>


@property (strong, nonatomic) SCConfig * config;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSMutableArray *favoriteMovieArray; 



@end
