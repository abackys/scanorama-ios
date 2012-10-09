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
#import "SCScheduleViewController.h"
#import "SCErrors.h"


@interface SCMyProgramViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate, FavoriteButtonDelegate>


@property (strong, nonatomic) SCConfig * config;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSMutableArray *favoriteMovieArray; 
@property (strong, nonatomic) SCScheduleViewController *scheduleView;
@property (strong, nonatomic) IBOutlet UITableView *myProgramTableView;
- (IBAction)shareMyProgramCliked:(id)sender;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *shareProgramButton;

@property (weak, nonatomic) IBOutlet UIToolbar *toolbarOutlet;


@end
