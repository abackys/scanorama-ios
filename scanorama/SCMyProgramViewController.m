//
//  SCMyProgramViewController.m
//  scanorama
//
//  Created by Lion User on 07/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SCMyProgramViewController.h"
#import "SCAppDelegate.h"
#import "SCDateString.h"

@interface SCMyProgramViewController ()

@end

@implementation SCMyProgramViewController

@synthesize managedObjectContext = _managedObjectContext;
@synthesize config = _config;
@synthesize fetchedResultsController = _fetchedResultsController;
@synthesize favoriteMovieArray = _favoriteMovieArray;
@synthesize scheduleView = _scheduleView;
@synthesize myProgramTableView = _myProgramTableView;




- (void)viewDidLoad
{
    
    SCAppDelegate *app = [UIApplication sharedApplication].delegate;
    _managedObjectContext = app.managedObjectContext;
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    _scheduleView = [[SCScheduleViewController alloc] init];
    
 
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.title = @"Mano Programa";
    
    _favoriteMovieArray = [[NSMutableArray alloc] init];   
    [self getFavoriteMoviesArray];
    [_myProgramTableView reloadData];
   
    
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


-(void) getFavoriteMoviesArray{
    
    
    NSError *error;
    
    NSManagedObjectContext *context = _managedObjectContext;
 
    
    NSSortDescriptor *sortByDate = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:TRUE];
    
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription 
                                   entityForName:@"Schedule" inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"favorite = 1", [_config getCityName]]; 
    
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sortByDate]];
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];
    
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
  //  NSLog(@"fetched: %i",[fetchedObjects count ]);
    if([fetchedObjects count])
    [self addMoviesArrayToSectionsArrays:fetchedObjects];
    
    
    



}

-(void) addMoviesArrayToSectionsArrays:(NSArray *)moviesArray{

    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    int lastDateInt = 0;
    int currentDateInt = 0;
    
    NSMutableArray *sectionArray = [[NSMutableArray alloc] init ];
    Schedule *tempSchedule = (Schedule *) [moviesArray objectAtIndex:0];
    NSDate *lastDate = tempSchedule.date;
     for (Schedule *scheduleData in moviesArray) {
     
     // Preparing dates for comparing YY-MM-DD only    
         
         lastDateInt = [calendar ordinalityOfUnit:NSDayCalendarUnit inUnit:NSEraCalendarUnit forDate:lastDate];
          currentDateInt = [calendar ordinalityOfUnit:NSDayCalendarUnit inUnit:NSEraCalendarUnit forDate:scheduleData.date];
         
    //     NSLog(@"%i  currentDate: %i",lastDateInt, currentDateInt);
         if(currentDateInt != lastDateInt){

              [_favoriteMovieArray addObject: [sectionArray copy]];
        //      NSLog(@"SectionArray %i", [sectionArray count]);
             [sectionArray removeAllObjects];
         }
         [sectionArray addObject:scheduleData];
         lastDate = scheduleData.date;
     
     } 
       
    [_favoriteMovieArray addObject:[sectionArray copy] ];

     
}

-(void)movieCell:(UITableViewCell *)cell favoriteButtonClicked:(UIButton *)button {
    SCMovieCell *movieCell = (SCMovieCell *)cell;

    NSDictionary *dict = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:!button.selected] forKey:@"favoriteButton"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeFavoriteValue" object:movieCell userInfo:dict];
    
    
 //   NSLog(@"%@", movieCell.timeLabel.text);
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    Schedule * scheduleData =  [[_favoriteMovieArray objectAtIndex:section ] firstObject ];
    SCDateString *dateString = [[SCDateString alloc] initWithPredefinedData];
    
    return [dateString getDateStringsByDate:scheduleData.date].dateStringLt;
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
 
    // Return the number of sections.
    return _favoriteMovieArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    
    NSArray *sectionData = (NSArray *) [_favoriteMovieArray objectAtIndex:section ];
     return sectionData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSDateFormatter * hours_minutes =  [[NSDateFormatter alloc ] init ];
    [hours_minutes setDateFormat:@"HH:mm"];
    
    NSArray *sectionArray = [_favoriteMovieArray objectAtIndex:indexPath.section];
    Schedule * schedule = [sectionArray objectAtIndex:indexPath.row];
    static NSString *CellIdentifier = @"MovieCell";
    SCMovieCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.delegate = self;
    cell.movieLabel.text = schedule.movie.title;
    cell.movieEnLabel.text = schedule.movie.titleEn;
    cell.favoriteButton.selected = [schedule.favorite boolValue];
    cell.timeLabel.text = [ hours_minutes  stringFromDate:schedule.date];
    cell.thumbImage.image = [UIImage imageNamed:schedule.movie.thumbImage];
    cell.cinema = schedule.cinema;
    cell.city = schedule.city;
    cell.date = schedule.date;
  
  
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
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
