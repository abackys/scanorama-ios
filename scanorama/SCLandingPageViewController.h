//
//  SCLandingPageViewController.h
//  scanorama
//
//  Created by Lion User on 06/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCLandingPageViewController : UIViewController

- (IBAction)landingButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *vilniusButton;
@property (weak, nonatomic) IBOutlet UIButton *kaunasButton;
@property (weak, nonatomic) IBOutlet UIButton *klaipedaButton;
@property (weak, nonatomic) IBOutlet UIButton *siauliaiButton;
@property (assign, nonatomic) NSInteger *cityId;
@end
