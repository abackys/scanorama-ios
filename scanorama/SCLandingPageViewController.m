//
//  SCLandingPageViewController.m
//  scanorama
//
//  Created by Lion User on 06/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SCLandingPageViewController.h"
#import "SCScheduleViewController.h"
#import "SCConfig.h"

@interface SCLandingPageViewController ()

@end

@implementation SCLandingPageViewController
@synthesize vilniusButton = _vilniusButton;
@synthesize kaunasButton = _kaunasButton;
@synthesize klaipedaButton = _klaipedaButton;
@synthesize siauliaiButton = _siauliaiButton;
@synthesize cityId = _cityId;


- (void)viewDidLoad
{

   // [[self navigationController] setTitle:@"Landing Page"];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setVilniusButton:nil];
    [self setKaunasButton:nil];
    [self setKlaipedaButton:nil];
    [self setSiauliaiButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)landingButton:(UIButton *)sender {
    
    SCConfig *config = [SCConfig sharedInstance];
    
    if(sender == _vilniusButton ){
        NSLog(@"Vilnius");
        [config setCityId:[NSNumber numberWithInt:1]];
    }
    else if(sender == _kaunasButton) {
        NSLog(@"Kaunas");
        [config setCityId:[NSNumber numberWithInt:2]];
    }  
    else if(sender == _klaipedaButton) {
        NSLog(@"Klaipeda");
        [config setCityId:[NSNumber numberWithInt:3]];
    }  
    else if(sender == _siauliaiButton) {
        NSLog(@"Siauliai");
        [config setCityId:[NSNumber numberWithInt:4]];
    }

    
    
    //[self setView:(UIView*)viewContr];
    [self performSegueWithIdentifier:@"showSchedule" sender:self];

    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    if([segue.identifier isEqualToString:@"showSchedule"]){
       
     //   SCScheduleViewController *scheduleController = (SCScheduleViewController *)segue.destinationViewController;
     //   if([scheduleController respondsToSelector:@selector(cityToolbarButton) ])
     //  NSLog(@"%@",scheduleController.cityToolbarButton);
      
    //    [newController setT]
   //     newController.testInt = [NSNumber numberWithInt:15];
    //    NSLog(@"%@", newController);
    }
   // [(SCFirstViewController *)segue.destinationViewController setView:<#(UIView *)#>]
}
@end
