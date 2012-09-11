//
//  SCMovieData.h
//  scanorama
//
//  Created by Lion User on 10/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCMovieData : NSObject


@property (strong) UIImage *thumbImage;
@property (strong) UIImage *fullImage;
@property (strong) NSString * title;
@property (strong) NSString * titleEn;
@property (strong) NSDate * date;
@property (strong) NSString* director;
@property (strong) NSString* createdYear;
@property (strong) NSString* movieLenght;
@property (assign) bool inFavorite;

- (id)initWithTitle:(NSString*)title thumbImage:(UIImage *)thumbImage fullImage:(UIImage *)fullImage   titleEn:(NSString *)titleEn director:(NSString *)director createdYear:(NSString *)createdYear movieLenght:(NSString *)movieLenght inFavorite:(BOOL)inFavorite date:(NSDate *)date ;

@end
