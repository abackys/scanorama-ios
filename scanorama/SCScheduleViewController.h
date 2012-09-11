//
//  SCScheduleViewController.h
//  scanorama
//
//  Created by Lion User on 07/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCMovieCell.h"

@interface SCScheduleViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>



- (IBAction)toggleFavorite:(UIButton *)sender;

@property (strong, nonatomic) NSMutableArray * MoviesArray;
@property (weak, nonatomic) IBOutlet UILabel *scheduleDate;
@property (weak, nonatomic) IBOutlet UILabel *scheduleDateEn;
- (IBAction)nextDay:(id)sender;
- (IBAction)previousDay:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *scheduleTableView;

@property (strong, nonatomic) IBOutlet SCMovieCell *movieCell;





@end
