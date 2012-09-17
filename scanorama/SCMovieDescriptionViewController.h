//
//  SCMovieDescriptionViewController.h
//  scanorama
//
//  Created by Lion User on 17/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movies.h"

@interface SCMovieDescriptionViewController : UIViewController

@property (strong, nonatomic) Movies *movieData;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

 		
@end
