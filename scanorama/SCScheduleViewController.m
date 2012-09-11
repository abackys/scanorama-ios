//
//  SCScheduleViewController.m			
//  scanorama
//
//  Created by Lion User on 07/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SCScheduleViewController.h"
#import "SCMovieCell.h"
#import "SCMovieData.h"

@interface SCScheduleViewController ()

@end

@implementation SCScheduleViewController
@synthesize scheduleTableView = _scheduleTableView;
@synthesize movieCell = _movieCell;
@synthesize MoviesArray = _MoviesArray;
@synthesize scheduleDate = _scheduleDate;
@synthesize scheduleDateEn = _scheduleDateEn;


- (void)viewDidLoad
{
  
    
    NSDateComponents *dateComp = [[NSDateComponents alloc ] init];
    [dateComp setDay:4]; [dateComp setMonth:11]; [dateComp setYear:2012];
    [dateComp setHour:11]; [dateComp setMinute:49];
    
    NSDateComponents *dateComp2 = [[NSDateComponents alloc ] init];
    [dateComp2 setDay:4]; [dateComp2 setMonth:11]; [dateComp2 setYear:2012];
    [dateComp2 setHour:12]; [dateComp2 setMinute:28];
    
    NSDateComponents *dateComp3 = [[NSDateComponents alloc ] init];
    [dateComp3 setDay:4]; [dateComp3 setMonth:11]; [dateComp3 setYear:2012];
    [dateComp3 setHour:14]; [dateComp3 setMinute:27];
    
    
    UIImage *thumbImage = [UIImage imageNamed:@"movie80x80.gif"];
    NSString * title = [[ NSString alloc] initWithString:@"Tadas Blinda"];
    
    NSDate * date = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] dateFromComponents:dateComp];
    NSDate * date2 = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] dateFromComponents:dateComp2];
    NSDate * date3 = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] dateFromComponents:dateComp3];
    
    
    SCMovieData *movieData1 = [[SCMovieData alloc] initWithTitle:title thumbImage:thumbImage fullImage:thumbImage titleEn:title director:title createdYear:title movieLenght:title inFavorite:YES date:date];
    SCMovieData *movieData2 = [[SCMovieData alloc] initWithTitle:@"Bumburas Melynas" thumbImage:[UIImage imageNamed:@"god80x80.jpeg"] fullImage:thumbImage titleEn:@"Blue Bumbu" director:title createdYear:title movieLenght:title inFavorite:NO date:date2];
    SCMovieData *movieData3 = [[SCMovieData alloc] initWithTitle:@"Vytai juodais drabuziais 3" thumbImage:[UIImage imageNamed:@"mib80x80.jpeg"] fullImage:thumbImage titleEn:@"Men in Black 3" director:title createdYear:title movieLenght:title inFavorite:NO date:date3];
    
    
    _MoviesArray = [[NSMutableArray alloc] init];
    //  _MoviesArray = [NSMutableArray arrayWithObject:movieData];
    
    //  NSLog(@"%@", _MoviesArray);
    
    [_MoviesArray addObject:movieData1];
    [_MoviesArray addObject:movieData2];
    [_MoviesArray addObject:movieData3];
    [_MoviesArray addObject:movieData1];
    
    [super viewDidLoad];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{

    [self setScheduleDate:nil];
    [self setScheduleDateEn:nil];
    [self setScheduleTableView:nil];

    [self setMovieCell:nil];

    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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
  //  NSLog(@"%i", _MoviesArray.count);
    return _MoviesArray.count;
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    NSDateFormatter * hours_minutes =  [[NSDateFormatter alloc ] init ];
    [hours_minutes setDateFormat:@"HH:mm"];
    
    static NSString *CellIdentifier = @"MovieCell";
    SCMovieCell *cell = (SCMovieCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   
    
    SCMovieData *movieData = [_MoviesArray objectAtIndex:indexPath.row];
    cell.movieLabel.text = movieData.title;
    cell.movieEnLabel.text = movieData.titleEn;
    cell.timeLabel.text = [hours_minutes stringFromDate:movieData.date];
    cell.thumbImage.image = movieData.thumbImage;
    
    cell.favoriteButton.selected = movieData.inFavorite;
    
    // Configure the cell...
    
    return cell;
}

-(IBAction)toggleFavorite:(UIButton *)sender {
    
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


- (IBAction)nextDay:(id)sender {
    
    [self.scheduleDate setText:@"Sausio 1"];
    [self.scheduleDateEn setText:@"1st of January"];
    [self.scheduleTableView reloadData];
    
}

- (IBAction)previousDay:(id)sender {
    [self.scheduleDate setText:@"Sausio 0"];
    [self.scheduleDateEn setText:@"0st of January"];
    [self.scheduleTableView reloadData];
}
@end
