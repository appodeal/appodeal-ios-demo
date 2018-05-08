//
//  ASBlankController.m
//  ASGDPR
//
//  Created by Lozhkin Ilya on 5/8/18.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import "ASBlankController.h"

@interface ASBlankController ()

@end

@implementation ASBlankController

+ (ASBlankController *)controller {
    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"GDPRBoard" bundle: NSBundle.mainBundle];
    ASBlankController *controller = [storyBoard instantiateViewControllerWithIdentifier:@"ASBlank"];
    
    return controller;
};

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
