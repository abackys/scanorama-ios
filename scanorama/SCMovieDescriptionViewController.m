//
//  SCMovieDescriptionViewController.m
//  scanorama
//
//  Created by Lion User on 17/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SCMovieDescriptionViewController.h"


@implementation SCMovieDescriptionViewController

@synthesize movieData = _movieData;
@synthesize textView = _textView;
@synthesize scrollView = _scrollView;
@synthesize bottomView = _bottomView;

- (void)viewWillAppear:(BOOL)animated {
    
    
    NSLog(@"%@", _movieData);
    CGRect rect = _textView.frame;
    CGRect bottomRect = _bottomView.frame;
    
    
    rect.size = _textView.contentSize;
    bottomRect.origin.y += rect.size.height - 100;
    
   // rect.origin.y = 50;
   // CGPoint *point = CGPointMake(200, 200);
  //  _bottomView.frame.origin = (_bottomView.frame.origin.y + 100);
    _textView.frame = rect;
    _bottomView.frame = bottomRect;
    _scrollView.contentSize = CGSizeMake(320, 640 + rect.size.height - 100);
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
    [self setTextView:nil];
    [self setScrollView:nil];
    [self setBottomView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(void) configureView:(Movies *)movieData {
    
}

    


@end
