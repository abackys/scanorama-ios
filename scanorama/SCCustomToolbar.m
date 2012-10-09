//
//  SCCustomToolbar.m
//  scanorama
//
//  Created by Lion User on 08/10/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SCCustomToolbar.h"

@implementation SCCustomToolbar




// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [[UIImage imageNamed:@"toolbar_320x88.png"] drawInRect:rect];
    // Drawing code
}


@end
