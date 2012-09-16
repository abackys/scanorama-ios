//
//  SCScheduleViewController.h
//  scanorama
//
//  Created by Lion User on 07/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCMovieCell.h"
#import <CoreData/CoreData.h>
#import "SCDateString.h"
#import "SCDateNavigator.h"

@interface SCScheduleViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, 
NSFetchedResultsControllerDelegate, FavoriteButtonDelegate>



- (IBAction)toggleFavorite:(UIButton *)sender;

@property (strong, nonatomic) NSMutableArray * ScheduleArray;
@property (strong, nonatomic) IBOutlet SCDateNavigator *dateNavigatorView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *cityToolbarButton;
@property (strong, nonatomic) SCConfig * config;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

- (IBAction)nextDay:(id)sender;
- (IBAction)previousDay:(id)sender;
-(void) disableDateNavigationButtons;
-(NSDate *) combineDateWithTime:(NSDate *)selectedDate movieTime:(NSString *)movieTime;
-(void) insertFavoriteToDatabase:(NSDate *)date byCity:(NSString *)city byCinema:(NSString *)cinema favoriteState:(NSNumber *)favorite;

@property (weak, nonatomic) IBOutlet UITableView *scheduleTableView;

@property (strong, nonatomic) SCDateString * dateString;

-(NSMutableArray *) getMoviesByDateAndCity:(NSDate *)startDate endDate:(NSDate *)endDate;


@end
