//
//  SCMoviesViewController.m
//  scanorama
//
//  Created by Lion User on 07/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SCMoviesViewController.h"
#import "SCAppDelegate.h"
#import "SCMovieCell.h"
#import "SCMovieDescriptionViewController.h"



@interface SCMoviesViewController ()



@end

@implementation SCMoviesViewController

@synthesize config = _config;
@synthesize fetchedResultsController = _fetchedResultsController;
@synthesize managedObjectContext = _managedObjectContext;
@synthesize MoviesArray = _MoviesArray;
@synthesize tableView = _tableView;



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

-(void)viewWillAppear:(BOOL)animated {
     
    self.tabBarController.title = @"Filmai";
    _MoviesArray = [self getAllMovies];
    
    NSLog(@"Atsirado Filmai");
}

-(void) viewWillDisappear:(BOOL)animated {
 

//    [self.navigationItem setTitle:@"Filmai"];
 //   self.navigationItem.backBarButtonItem.title = @"Atgal";
}

- (void)viewDidUnload
{
   // NSMutableArray * _MoviesArray = [[NSMutableArray alloc] init];
    [self setTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


-(NSMutableArray *)getAllMovies {
    
    
    NSError *error;
    
    NSManagedObjectContext *context = _managedObjectContext;
        
    NSSortDescriptor *sortByDate = [[NSSortDescriptor alloc] initWithKey:@"group" ascending:TRUE];            
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription 
                                   entityForName:@"Movies" inManagedObjectContext:context];
  //  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"favorite = 1", [_config getCityName]]; 
    
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sortByDate]];
    [fetchRequest setEntity:entity];
   // [fetchRequest setPredicate:predicate];
    
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    NSLog(@"fetched Movies: %i",[fetchedObjects count ]);
    if([fetchedObjects count ])
        return [self addMoviesToSectionsByGroups:fetchedObjects];
   //return 
    
}

-(NSMutableArray *) addMoviesToSectionsByGroups:(NSArray *)moviesArray{

    NSMutableArray *sectionArray = [[NSMutableArray alloc] init ];
    NSMutableArray * sectionedMovieArray = [[NSMutableArray alloc] init];
    Movies *tempMovie = (Movies *) [moviesArray objectAtIndex:0];
    
    NSString *lastgroup = tempMovie.group;
    NSString *currentGroup = tempMovie.group;
   
    for (Movies *movieRowData in moviesArray) {
        currentGroup = movieRowData.group;
        if(![lastgroup isEqualToString:currentGroup]){            
            [sectionedMovieArray addObject: [sectionArray copy]];
            [sectionArray removeAllObjects];
        }
        [sectionArray addObject:movieRowData];
        lastgroup = movieRowData.group;        
    }     
    [sectionedMovieArray addObject:[sectionArray copy] ];
    return sectionedMovieArray;
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    Movies * movieData =  [[_MoviesArray objectAtIndex:section ] firstObject ];
    
    if(movieData.group)
        return movieData.group;
    else {
        NSLog(@"%@", movieData);
        return @"TTT";
    }
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return _MoviesArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    NSArray *sectionData = (NSArray *) [_MoviesArray objectAtIndex:section ];
    return sectionData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDateFormatter * hours_minutes =  [[NSDateFormatter alloc ] init ];
    [hours_minutes setDateFormat:@"HH:mm"];
    
    NSArray *sectionArray = [_MoviesArray objectAtIndex:indexPath.section];
    Movies * movie = [sectionArray objectAtIndex:indexPath.row];
    static NSString *CellIdentifier = @"MovieCell";
    SCMovieCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
 //   cell.delegate = self;
    cell.movieLabel.text = movie.title;
    cell.movieEnLabel.text = movie.titleEn;
   // cell.favoriteButton.selected = [movie.favorite boolValue];
   // cell.timeLabel.text = [ hours_minutes  stringFromDate:schedule.date];
    cell.thumbImage.image = [UIImage imageNamed:movie.thumbImage];
   // cell.cinema = schedule.cinema;
   // cell.city = schedule.city;
   // cell.date = schedule.date;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SCMovieDescriptionViewController *detailController = segue.destinationViewController;
    NSLog(@"priesh");
    NSArray *sectionData = [_MoviesArray objectAtIndex:self.tableView.indexPathForSelectedRow.section];
    Movies *movieData = [sectionData objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    NSLog(@"%@", self.tableView);
    detailController.movieData = movieData;
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
