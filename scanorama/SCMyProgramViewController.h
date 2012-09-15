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

@interface SCMyProgramViewController : UITableViewController <UITextFieldDelegate, NSFetchedResultsControllerDelegate>


@property (strong, nonatomic) SCConfig * config;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

-(void) textFieldDidBeginEditing:(UITextField *)textField;

@end
