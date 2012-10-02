//
//  SCErrors.m
//  scanorama
//
//  Created by Lion User on 02/10/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SCErrors.h"

@implementation SCErrors


- (void)showAlert:(NSString *)message
           result:(id)result
            error:(NSError *)error {
    
    NSString *alertMsg;
    NSString *alertTitle;
    if (error) {
        alertMsg = error.localizedDescription;
        alertTitle = @"Klaida";
    } else {
       
        alertMsg = message;
        alertTitle = @"Pasidalinta";
    }
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:alertTitle
                                                        message:alertMsg
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
}


@end
