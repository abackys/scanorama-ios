//
//  SCMovieDescriptionViewController.h
//  scanorama
//
//  Created by Lion User on 17/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movies.h"
#import "Schedule.h"


@interface SCMovieDescriptionViewController : UIViewController

@property (strong, nonatomic) Movies *movieData;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UITextView *movieDescriptionTextView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextView *movieMetaTextView;
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;

@property (weak, nonatomic) IBOutlet UITextView *scheduleTextView;
- (void)shareMovie;
- (IBAction)shareMovieButtonClicked:(id)sender;
	
@end
