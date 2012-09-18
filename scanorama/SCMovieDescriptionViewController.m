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

@synthesize movieDescriptionTextView = _movieDescriptionTextView;
@synthesize bottomView = _bottomView;
@synthesize webView = _webView;
@synthesize movieMetaTextView = _movieMetaTextView;

- (void)viewWillAppear:(BOOL)animated {
    

    CGRect rect = _textView.frame;
    CGRect descriptionRect = _movieDescriptionTextView.frame;
    CGRect bottomRect = _bottomView.frame;
    CGRect movieMetaRect = _movieMetaTextView.frame;
    
    CGFloat strech = 0;
    
    movieMetaRect.size = _movieMetaTextView.contentSize;
  //  movieMetaRect.size.height += 40;
    strech += movieMetaRect.size.height - 70;
    
    descriptionRect.size = _movieDescriptionTextView.contentSize;
    descriptionRect.size.height += 40;  // Magic constant for borders 
    descriptionRect.origin.y += strech; //Move component
    strech += descriptionRect.size.height - 140;
    
    rect.size = _textView.contentSize;
    rect.size.height += 40;  // Magic constant for borders
    rect.origin.y += strech;
    strech += rect.size.height - 70 - 40;
    
    bottomRect.origin.y += strech;

    _movieMetaTextView.frame = movieMetaRect;
    _textView.frame = rect;
    _bottomView.frame = bottomRect;
    _movieDescriptionTextView.frame = descriptionRect;
    
    _scrollView.contentSize = CGSizeMake(320, 160 + 400 + 200 + 5*50 + strech);

    [[self navigationController] setNavigationBarHidden:NO animated:YES]; 
    [ self navigationController].navigationBar.barStyle = UIBarStyleBlack;

    [self addWebViewToBottom:@"http://www.youtube.com/embed/oHg5SJYRHA0" ];
    
}


-(void)addWebViewToBottom:(NSString *)videoUrl{

    _webView.autoresizesSubviews = YES;
    _webView.autoresizingMask=(UIViewAutoresizingFlexibleHeight);
    NSString *htmlString = [NSString stringWithFormat:@"<iframe class=\"youtube-player\" type=\"text/html\" width=\"285\" height=\"200\" src=\"%@\" frameborder=\"0\"> </iframe>", videoUrl]    ;
    
    
    [_webView loadHTMLString:htmlString baseURL:[NSURL URLWithString:@"http://www.youtube.com"]];

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
    [self setMovieDescriptionTextView:nil];
    [self setBottomView:nil];
    [self setWebView:nil];
    [self setMovieMetaTextView:nil];
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
