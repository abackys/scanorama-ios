//
//  SCTabBarViewController.m
//  scanorama
//
//  Created by Lion User on 07/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SCTabBarViewController.h"

@interface SCTabBarViewController (private)
- (UITabBar *)tabBar;
@end

@implementation SCTabBarViewController


- (void)viewDidLoad
{
    
    [super viewDidLoad];
   // [[self tabBar] setBackgroundColor:[UIColor greenColor]];
    [[self tabBar] setBackgroundImage:[UIImage imageNamed:@"tabBar_bg____1x48.png"]];
   // [[self tabBar] setTintColor:[UIColor colorWithRed:30/255 green:30/255 blue:30/255 alpha:1]];
    
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

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
   // NSLog(@"Viewsas pasikeite1");
}

@end
