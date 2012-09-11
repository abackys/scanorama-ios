//
//  SCMovieData.m
//  scanorama
//
//  Created by Lion User on 10/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SCMovieData.h"

@implementation SCMovieData

@synthesize thumbImage = _thumbImage;
@synthesize fullImage = _fullImage;
@synthesize titleEn = _titleEn;
@synthesize title = _title;
@synthesize date = _date;
@synthesize director = _director;
@synthesize createdYear = _createdYear;
@synthesize movieLenght = _movieLenght;
@synthesize inFavorite = _inFavorite;


- (id)initWithTitle:(NSString*)title thumbImage:(UIImage *)thumbImage fullImage:(UIImage *)fullImage   titleEn:(NSString *)titleEn director:(NSString *)director createdYear:(NSString *)createdYear movieLenght:(NSString *)movieLenght inFavorite:(BOOL)inFavorite date:(NSDate *)date {
    
    if ((self = [super init])) {
        self.thumbImage = thumbImage;
        self.fullImage = fullImage;
        self.title = title;
        self.titleEn = titleEn;
        self.date = date;
        self.director = director;
        self.createdYear = createdYear;
        self.movieLenght = movieLenght;
        self.inFavorite = inFavorite;

    }
    return self;
}

@end
