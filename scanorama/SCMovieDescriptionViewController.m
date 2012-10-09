//
//  SCMovieDescriptionViewController.m
//  scanorama
//
//  Created by Lion User on 17/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SCMovieDescriptionViewController.h"
#import "SCDirectorViewController.h"
#import "SCAppDelegate.h"
#import "SCErrors.h"


@implementation SCMovieDescriptionViewController
@synthesize shareMovieButton = _shareMovieButton;

@synthesize movieData = _movieData;

@synthesize scrollView = _scrollView;

@synthesize movieDescriptionTextView = _movieDescriptionTextView;
@synthesize bottomView = _bottomView;
@synthesize webView = _webView;
@synthesize movieMetaTextView = _movieMetaTextView;
@synthesize headerImage = _headerImage;
@synthesize scheduleTextView = _scheduleTextView;

- (void)viewWillAppear:(BOOL)animated {
    
    UIImage *promoImg = [UIImage imageNamed:_movieData.fullImage];
    _shareMovieButton.enabled = TRUE;
    CGRect rect = _scheduleTextView.frame;
    CGRect descriptionRect = _movieDescriptionTextView.frame;
    CGRect bottomRect = _bottomView.frame;
    CGRect movieMetaRect = _movieMetaTextView.frame;
    CGRect promoImgRect = _headerImage.frame;
    
   
    // Promo Img height adjust
    CGFloat imgw = promoImg.size.width;
    CGFloat imgh = promoImg.size.height;
    CGFloat imgNewH = (imgh * 320) / imgw;
 
   
    NSString *movieMetaText = [NSString stringWithFormat:@"Režisierius: %@ \nScenarijus: %@ \nOperatorius: %@ \nMontažas: %@", _movieData.director,_movieData.screenplay, _movieData.cinematography, _movieData.editing ] ;
    
  
    if([_movieData.music length]) {
        movieMetaText =  [movieMetaText stringByAppendingFormat:@"\nMuzika: %@", _movieData.music];
    }
    
    if([_movieData.cast length]) {
        movieMetaText = [movieMetaText stringByAppendingFormat:@"\nVaidina: %@", _movieData.cast];
    }
    
    
    _movieMetaTextView.text = movieMetaText;

    _movieDescriptionTextView.text = _movieData.moviedescription;
    //_movieDescriptionTextView.text = @"q";
    _scheduleTextView.text = [self formatMovieScheduleText];
    
    CGFloat strech = 0;
    promoImgRect.size.height = imgNewH;
    
    strech += promoImgRect.size.height - 160;
    
    movieMetaRect.size = _movieMetaTextView.contentSize;
    movieMetaRect.origin.y += strech; //Move component
   // movieMetaRect.size.height -= 20;
    strech += movieMetaRect.size.height - 70;
    
    descriptionRect.size = _movieDescriptionTextView.contentSize;
    descriptionRect.size.height += 40;  // Magic constant for borders 
    descriptionRect.origin.y += strech; //Move component
    strech += descriptionRect.size.height - 140;
    
    rect.size = _scheduleTextView.contentSize;
    rect.size.height += 20;  // Magic constant for borders
    rect.origin.y += strech;
    strech += rect.size.height - 70 - 40;
    
    bottomRect.origin.y += strech;

    _movieMetaTextView.frame = movieMetaRect;
    _scheduleTextView.frame = rect;
    _bottomView.frame = bottomRect;
    _movieDescriptionTextView.frame = descriptionRect;
    
    _scrollView.contentSize = CGSizeMake(320, 160 + 400 + 200 + 5*50 + strech);

    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    
     [[ self navigationController].navigationBar setBackgroundImage:[UIImage imageNamed:@"toolbar_320x88.png"] forBarMetrics:UIBarMetricsDefault];
    
            
   // [ self navigationController].navigationBar.barStyle = UIBarStyleBlack;

    [self addWebViewToBottom:@"http://www.youtube.com/embed/oHg5SJYRHA0" ];
    
    
    

    _headerImage.frame = promoImgRect;
    _headerImage.image = promoImg ;
    
//   _scheduleTextView.hidden = TRUE;
    
}

-(NSString *)formatMovieScheduleText{
    
    NSSet *scheduleSet = _movieData.schedule;
    NSDateFormatter *dateFormatterDay = [[NSDateFormatter alloc] init];
    [dateFormatterDay setDateFormat:@"d"];
    
    NSDateFormatter *dateFormatterHour = [[NSDateFormatter alloc] init];
    [dateFormatterHour setDateFormat:@"HH:mm"];
    
    
    
    NSSortDescriptor *dateDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:TRUE];
    NSArray *scheduleDataSorted = [scheduleSet sortedArrayUsingDescriptors:[NSArray arrayWithObject:dateDescriptor]];
   
    NSEnumerator * scheduleEnumerator =  [scheduleDataSorted objectEnumerator];
    Schedule *scheduleRow;
    NSString *scheduleText = @"";
    while(scheduleRow = [scheduleEnumerator nextObject]){
        NSString *dateStringDay = [dateFormatterDay stringFromDate:scheduleRow.date];
        NSString *dateStringHours = [dateFormatterHour stringFromDate:scheduleRow.date];
        
         NSLog(@"%@",scheduleRow.date  );
        scheduleText =  [scheduleText stringByAppendingFormat:@"%@d. %@ %@(%@)\n",dateStringDay , dateStringHours, scheduleRow.cinema, scheduleRow.city];       
    }
    
   
    //NSLog(@"%@",scheduleText  );
    return scheduleText;
}


-(void)addWebViewToBottom:(NSString *)videoUrl{

    _webView.autoresizesSubviews = YES;
    _webView.autoresizingMask=(UIViewAutoresizingFlexibleHeight);
    NSString *htmlString = [NSString stringWithFormat:@"<iframe class=\"youtube-player\" type=\"text/html\" width=\"285\" height=\"200\" src=\"%@\" frameborder=\"0\"> </iframe>", videoUrl]    ;
    
    
    [_webView loadHTMLString:htmlString baseURL:[NSURL URLWithString:@"http://www.youtube.com"]];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    SCDirectorViewController *detailController = segue.destinationViewController;
    detailController.movieData = _movieData;
 
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
  
    [self setScrollView:nil];
    [self setMovieDescriptionTextView:nil];
    [self setBottomView:nil];
    [self setWebView:nil];
    [self setMovieMetaTextView:nil];
    [self setHeaderImage:nil];
    [self setScheduleTextView:nil];
    [self setShareMovieButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(void) configureView:(Movies *)movieData {
    
}


    


- (void)shareMovie {
    
    NSString *message = [NSString stringWithFormat:@"Scanorama Europos šalių kino forumas\n %@(%@)\n %@\n", _movieData.title, _movieData.titleNative, _movieData.moviedescription];
    NSLog(@"%@", message);
    _shareMovieButton.enabled = FALSE;
    [FBRequestConnection startForPostStatusUpdate:message
                                completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                                    
                                    SCErrors *showError  = [[SCErrors alloc] init];
                                    [showError showAlert:[NSString stringWithFormat:@"Jūs pasidalinote \"%@\" su savo draugais", _movieData.title ] result:result error:error];
                                    
                                    NSLog(@"%@", error);
                                }];    
}

- (IBAction)shareMovieButtonClicked:(id)sender {
    
    SCAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSLog(@"qqqq%@", [NSNumber numberWithBool:appDelegate.sessionFb.isOpen]);
    if(!appDelegate.sessionFb.isOpen){
        
         NSLog(@"Viduj");
      
     appDelegate.sessionFb = [[FBSession alloc] initWithPermissions:[NSArray arrayWithObject:@"status_update"]];
     //   NSLog(@"viduj vidujss");
        
        [appDelegate.sessionFb  openWithCompletionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
            [FBSession setActiveSession:appDelegate.sessionFb];
            NSLog(@"Open WIth CompletionnHeader%@", [session accessToken]);
            [self shareMovie];
        } ];

    }
    else {
        [self shareMovie];
    }
    
}
@end
