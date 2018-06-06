//
//  ASRootViewController.m
//  appodeal_demo
//
//  Copyright © 2017 appodeal. All rights reserved.
//

#import "ASRootViewController.h"

@interface ASRootViewController ()

@end

@implementation ASRootViewController


- (IBAction)tapOnView:(UITapGestureRecognizer *)sender {
    [[self.view viewWithTag:10] resignFirstResponder];
}


@end
