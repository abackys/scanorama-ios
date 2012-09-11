//
//  SCTabBarViewController.h
//  scanorama
//
//  Created by Lion User on 07/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCTabBarViewController : UITabBarController <UITabBarDelegate>

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item;


@end
