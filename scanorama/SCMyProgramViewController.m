//
//  SCMyProgramViewController.m
//  scanorama
//
//  Created by Lion User on 07/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SCMyProgramViewController.h"
#import "SCAppDelegate.h"

@interface SCMyProgramViewController ()

@end

@implementation SCMyProgramViewController

@synthesize managedObjectContext = _managedObjectContext;
@synthesize config = _config;
@synthesize fetchedResultsController = _fetchedResultsController;
@synthesize favoriteMovieArray = _favoriteMovieArray;


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

    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void) textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"Bujawawa");
}

- (void)viewWillAppear:(BOOL)animated
{
    _favoriteMovieArray = [[NSMutableArray alloc] init];
    [self getFavoriteMoviesArray];
    NSLog(@"MyProgramView");
    
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
    NSLog(@"%@",context);
    
    NSSortDescriptor *sortByDate = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:TRUE];
    
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription 
                                   entityForName:@"Schedule" inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"favorite = 1", [_config getCityName]]; 
    
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sortByDate]];
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];
    
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    NSLog(@"fetched: %i",[fetchedObjects count ]);
    [self addMoviesArrayToSectionsArrays:fetchedObjects];
    
    
    



}

-(void) addMoviesArrayToSectionsArrays:(NSArray *)moviesArray{
    unsigned int flags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    int lastDateInt = 0;
    int currentDateInt = 0;
    
    NSMutableArray *sectionArray = [[NSMutableArray alloc] init ];
    Schedule *tempSchedule = (Schedule *) [moviesArray objectAtIndex:0];
    NSDate *lastDate = tempSchedule.date;
     for (Schedule *scheduleData in moviesArray) {
         
      //   [_favoriteMovieArray addObject:model];    
     
     
     // Preparing dates for comparing YY-MM-DD only    
       //  NSDateComponents *lastDateComp = [calendar components:flags fromDate:lastDate];
       //  NSDate lastDate = [calendar dateFromComponents:lastDateComp];
         
         lastDateInt = [calendar ordinalityOfUnit:NSDayCalendarUnit inUnit:NSEraCalendarUnit forDate:lastDate];
          currentDateInt = [calendar ordinalityOfUnit:NSDayCalendarUnit inUnit:NSEraCalendarUnit forDate:scheduleData.date];
         
    //     NSLog(@"%i  currentDate: %i",lastDateInt, currentDateInt);
         if(currentDateInt != lastDateInt){
             NSLog(@"Last date %@ , CurrentDate: %@", lastDate, scheduleData.date);
             NSLog(@"%i", sectionArray.count);
              [_favoriteMovieArray addObject: [sectionArray copy]];
              NSLog(@"SectionArray %i", [sectionArray count]);
             [sectionArray removeAllObjects];
         }
         [sectionArray addObject:scheduleData];
         lastDate = scheduleData.date;
     
     } 
         NSLog(@"SectionArray %i", [sectionArray count]);
    [_favoriteMovieArray addObject:[sectionArray copy] ];
    
    for(NSMutableArray *array in _favoriteMovieArray){
        NSLog(@"QQQQQ%i", [array count]);
    }
    NSLog(@"Favorite Array : %i", _favoriteMovieArray.count);
     
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return _favoriteMovieArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
   // NSLog(@"WEWEWE: %@", [_favoriteMovieArray lastObject]);
    for(NSMutableArray *array in _favoriteMovieArray){
        NSLog(@"%i", [array count]);
    }
    
    NSArray *sectionData = (NSArray *) [_favoriteMovieArray objectAtIndex:section ];
      NSLog(@"NumberOFrow: %i at section: %i", sectionData.count, section);
    return sectionData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MovieCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    return cell;
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
