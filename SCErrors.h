//
//  SCErrors.h
//  scanorama
//
//  Created by Lion User on 02/10/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCErrors : NSObject

- (void)showAlert:(NSString *)message
           result:(id)result
            error:(NSError *)error;


@end
