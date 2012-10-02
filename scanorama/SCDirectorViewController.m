//
//  SCDirectorViewController.m
//  scanorama
//
//  Created by Lion User on 01/10/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SCDirectorViewController.h"

@interface SCDirectorViewController ()

@end

@implementation SCDirectorViewController
@synthesize movieData = _movieData;


-(void) viewWillAppear:(BOOL)animated {
    NSLog(@"%@", _movieData.director);
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
