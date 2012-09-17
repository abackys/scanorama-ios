//
//  SCMovieDescriptionViewController.m
//  scanorama
//
//  Created by Lion User on 17/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SCMovieDescriptionViewController.h"

@interface SCMovieDescriptionViewController ()

@end

@implementation SCMovieDescriptionViewController

- (void)viewWillAppear:(BOOL)animated {
  //  self.navigationItem.backBarButtonItem.title = @"Atgalios";
    [[self navigationController] setNavigationBarHidden:NO animated:YES]; 
 
   // self.navigationItem.backBarButtonItem.title = @"Atgalios2";
    
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [[self navigationController] setNavigationBarHidden:YES animated:YES]; 
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
