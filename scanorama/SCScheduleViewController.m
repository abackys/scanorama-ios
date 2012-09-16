//
//  SCScheduleViewController.m			
//  scanorama
//
//  Created by Lion User on 07/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import <CoreData/CoreData.h>
#import "SCScheduleViewController.h"
#import "SCMovieCell.h"
#import "SCAppDelegate.h"
#import "Movies.h"
#import "Schedule.h"
#import "SCDateString.h"
#import "SCDateNavigator.h"
#import "SCConfig.h"



@interface SCScheduleViewController ()

@end

@implementation SCScheduleViewController
@synthesize managedObjectContext = _managedObjectContext;
@synthesize dateNavigatorView = _dateNavigatorView;
@synthesize fetchedResultsController = _fetchedResultsController;
@synthesize scheduleTableView = _scheduleTableView;
@synthesize ScheduleArray = _ScheduleArray;
@synthesize cityToolbarButton = _cityToolbarButton;
@synthesize config = _config;


@synthesize dateString = _dateString;



-(void) configureView {
    
    _config = [SCConfig sharedInstance];

    _cityToolbarButton.title = [_config getCityName];
    
    _ScheduleArray  = [self getMoviesByDateAndCity:[_dateString getCurrentDate].date endDate:[_dateString getNextDay].date];
    
}

- (void)viewDidLoad
{

  //  [self configureView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeFavoriteNotification:) name:@"changeFavoriteValue" object:nil];
    
     _dateString = [[SCDateString alloc] initWithPredefinedData];

    
    // dateString.dateDict;
    NSDateComponents *dateComp = [[NSDateComponents alloc ] init];
    [dateComp setDay:9]; [dateComp setMonth:11]; [dateComp setYear:2012];
    
    

   
    
    
    NSDateComponents *dateComp2 = [[NSDateComponents alloc ] init];
    [dateComp2 setDay:9]; [dateComp2 setMonth:11]; [dateComp2 setYear:2012];
    [dateComp2 setHour:12]; [dateComp2 setMinute:25];
    
  

    
    NSDate * date = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] dateFromComponents:dateComp2];

    
    
   // Schedule *scheduleRow = [[Schedule alloc] init];
    
    _ScheduleArray = [[NSMutableArray alloc] init];
    
   
    
    
     NSError *error;  
    SCAppDelegate *app = [UIApplication sharedApplication].delegate;
    _managedObjectContext = app.managedObjectContext;

    NSManagedObjectContext *context = _managedObjectContext;
    
    /*
    Schedule *scheduleRow = [NSEntityDescription
                             insertNewObjectForEntityForName:@"Schedule" 
                             inManagedObjectContext:context];
    */

 /*  
   Movies *movieDB = [NSEntityDescription
                            insertNewObjectForEntityForName:@"Movies" 
                            inManagedObjectContext:context];
 */
 //   movieDB.title =  @"Laptopas Ma";
  //  movieDB.title =  @"Mephis Biznis";

  //  movieDB.title =  @"Poeter moter";
  /*  movieDB.title =  @"Okelis Mekelis";

    movieDB.titleEn =  @"Bqwqwqw....";
    movieDB.thumbImage =  @"god80x80.jpeg";
    movieDB.fullImage =  @"god80x80.jpeg";
    movieDB.director =  @"Pumpurinis Varnas";
    movieDB.createdYear =  @"2012";
    movieDB.duration =  @"2:05";
    movieDB.schedule = [NSSet setWithObject:scheduleRow] ;
    */
  
    NSFetchRequest *fetchMovieRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entityMovie = [NSEntityDescription 
                                   entityForName:@"Movies" inManagedObjectContext:context];
       NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title=%@", @"Okelis Mekelis"]; 
    [fetchMovieRequest setPredicate:predicate];
    [fetchMovieRequest setEntity:entityMovie];
    
    NSArray *fetchedMovie = [context executeFetchRequest:fetchMovieRequest error:&error];
    
    NSLog(@"%i",[fetchedMovie count ]);
    Movies *movieDB = [fetchedMovie objectAtIndex:0];
    
    /*
    
    scheduleRow.city = @"Kaunas";
    scheduleRow.date = date;
    scheduleRow.cinema = @"Romuva";
    scheduleRow.favorite = [NSNumber numberWithInt:0];
    scheduleRow.movie = movieDB;
   */
 /*   if (![context save:&error]) {
        NSLog(@"Couldn't save: %@", [error localizedDescription]);
    }
    */
     [self disableDateNavigationButtons ];
    /*
    
   NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription 
                                   entityForName:@"Schedule" inManagedObjectContext:context];
    
    [fetchRequest setEntity:entity];
    
    
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    for (Movies *model in fetchedObjects) {
        [_ScheduleArray addObject:model];
    }
    */
    
   // _ScheduleArray  = [self getMoviesByDate:[_dateString getCurrentDate].date endDate:[_dateString getNextDay].date];
    //  _MoviesArray = [NSMutableArray arrayWithObject:movieData];
    
    //  NSLog(@"%@", _MoviesArray);
  
    
    [super viewDidLoad];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



- (void)viewDidUnload
{


    [self setScheduleTableView:nil];

   

    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self configureView];
    
    [super viewWillAppear:animated];
    }

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    NSLog(@"COuntas: %i", _ScheduleArray.count);
    return _ScheduleArray.count;
}



-(void)movieCell:(UITableViewCell *)cell favoriteButtonClicked:(UIButton *)button {
    SCMovieCell *movieCell = (SCMovieCell *)cell;
 //   NSLog(@"selected: %@", [NSNumber numberWithBool:button.selected]);
    NSDate * movieDate = [self combineDateWithTime: movieCell.date movieTime:movieCell.timeLabel.text];

    [self insertFavoriteToDatabase:movieDate byCity:movieCell.city byCinema:movieCell.cinema favoriteState:[NSNumber numberWithBool:!button.selected]];
   

}

-(void) insertFavoriteToDatabase:(NSDate *)date byCity:(NSString *)city byCinema:(NSString *)cinema favoriteState:(NSNumber *)favorite{
NSLog(@"Favorite: BUJAKAKAKAK");
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSManagedObjectContext *context = _managedObjectContext;
    
    NSEntityDescription *entity = [NSEntityDescription 
                                   entityForName:@"Schedule" inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(date = %@) AND (city = %@) AND (cinema = %@)", date, city, cinema]; 
    
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];
    
    
    Schedule *scheduleRow = [[context executeFetchRequest:fetchRequest error:&error] lastObject];
    NSLog(@"Favorite: %@", scheduleRow.favorite);
    scheduleRow.favorite = favorite;
    
    error = nil;
    
    if(![context save:&error])
        NSLog(@"Setting Favorite Db Error:%@",error);
      
    
   // return [NSMutableArray arrayWithArray:fetchedObjects];
    
}

-(void)changeFavoriteNotification:(NSNotification *)pNotification {
    SCMovieCell *movieCell = [pNotification object];
    
    NSNumber *favorite =  [[pNotification userInfo] valueForKey:@"favoriteButton"];
    [self insertFavoriteToDatabase:movieCell.date byCity:movieCell.city byCinema:movieCell.cinema favoriteState:favorite];
    NSLog(@"%@", favorite);
   // NSLog(@"wwew %@", (NSString*) [pNotification object]);

}


-(NSDate *) combineDateWithTime:(NSDate *)selectedDate movieTime:(NSString *)movieTime{

    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar ];
    NSDateFormatter * hours_minutes =  [[NSDateFormatter alloc ] init ];
    [hours_minutes setDateFormat:@"HH:mm"];
    NSDate *nsHours = [hours_minutes dateFromString:movieTime];
    unsigned int unitFlags = NSYearCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit;
    NSDateComponents *hourMinuteComp = [calendar components:NSHourCalendarUnit | NSMinuteCalendarUnit fromDate:nsHours];
    
    NSDateComponents *dateComponents = [calendar components:unitFlags fromDate:selectedDate];
    [dateComponents setHour:[hourMinuteComp hour]];
    [dateComponents setMinute:[hourMinuteComp minute]];
    
    return [calendar dateFromComponents:dateComponents];

}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    NSDateFormatter * hours_minutes =  [[NSDateFormatter alloc ] init ];
    [hours_minutes setDateFormat:@"HH:mm"];
    
    static NSString *CellIdentifier = @"MovieCell";
    SCMovieCell *cell = (SCMovieCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   
    cell.delegate = self;
    
    Schedule *schedule = [_ScheduleArray objectAtIndex:indexPath.row];
    cell.movieLabel.text = schedule.movie.title;
    cell.movieEnLabel.text = schedule.movie.titleEn;
    cell.favoriteButton.selected = [schedule.favorite boolValue];
    cell.timeLabel.text = [ hours_minutes  stringFromDate:schedule.date];
    cell.thumbImage.image = [UIImage imageNamed:schedule.movie.thumbImage];
    cell.cinema = schedule.cinema;
    cell.city = schedule.city;
   
    cell.date = schedule.date;
    
    //cell.favoriteButton.selected = [movieData.inFavorite boolValue];
    
    
    // Configure the cell...
    
    return cell;
}

-(IBAction)toggleFavorite:(UIButton *)sender {
  //  NSLog(@"%@",[sender parentViewController]);
    if(sender.selected){
        sender.selected = NO;
    }
    else {
        sender.selected = YES;
    }
      [[NSNotificationCenter defaultCenter] postNotificationName:@"changeFavoriteValue" object:nil];
}


-(NSMutableArray *) getMoviesByDateAndCity:(NSDate *)startDate endDate:(NSDate *)endDate{

    
    NSError *error;
    
    NSManagedObjectContext *context = _managedObjectContext;
    
    NSSortDescriptor *sortByDate = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:TRUE];


    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription 
                                   entityForName:@"Schedule" inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(date > %@) AND (date < %@) AND (city=%@)", startDate, [startDate dateByAddingTimeInterval:60*60*24], [_config getCityName]]; 
    
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sortByDate]];
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];
    
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    [_ScheduleArray removeAllObjects];
    for (Schedule *model in fetchedObjects) {
        [_ScheduleArray addObject:model];
     
    } 
   Schedule *schedule = [_ScheduleArray lastObject];
    NSLog(@"%@",schedule.date);
    return [NSMutableArray arrayWithArray:fetchedObjects];
}

- (IBAction)nextDay:(id)sender {
    

 [_dateString nextDay];
       
    _ScheduleArray = [self getMoviesByDateAndCity:[_dateString getCurrentDate].date endDate:[_dateString getNextDay].date];

    
    [_dateNavigatorView.dateLabel setText:[_dateString getCurrentDate].dateStringLt];
    [_dateNavigatorView.dateLabelEn setText:[_dateString getCurrentDate].dateStringEn];    
    
    [self disableDateNavigationButtons ];
    
    [self.scheduleTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationLeft];
    
}

- (IBAction)previousDay:(id)sender {
 
   
    _ScheduleArray = [self getMoviesByDateAndCity:[_dateString getPreviousDay].date endDate:[_dateString getCurrentDate].date];
    
    [_dateNavigatorView.dateLabel  setText:[_dateString getPreviousDay].dateStringLt];
    [_dateNavigatorView.dateLabelEn  setText:[_dateString getPreviousDay].dateStringEn];

    [_dateString previousDay];
    
     [self disableDateNavigationButtons ];
    
    [self.scheduleTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationLeft];
    
    
    
     [self.scheduleTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationRight];}

-(void) disableDateNavigationButtons {
    if(![_dateString getPreviousDay]){
        [_dateNavigatorView.previousButton setEnabled:FALSE];
    }
    else {
        [_dateNavigatorView.previousButton setEnabled:TRUE];
    }
    if(![_dateString getNextDay]){
        [_dateNavigatorView.nextButton setEnabled:FALSE];
    }
    else {
          [_dateNavigatorView.nextButton setEnabled:TRUE];
    }
}

@end
