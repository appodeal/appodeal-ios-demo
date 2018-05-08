//
//  ASGDPR.m
//  ASGDPR
//
//  Created by Lozhkin Ilya on 5/8/18.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import "ASGDPR.h"
#import "ASPrivacyController.h"

static UIWindow *currentWindow = nil;

@implementation ASGDPR

+ (void)present:(ASConsentBlock)consentBlock {
    
    dispatch_block_t completionBlock = ^{
        currentWindow.hidden = YES;
        currentWindow = nil;
    };
    
    ASPrivacyController *controller = [ASPrivacyController controllerWitnConsent:consentBlock
                                                                      completion:completionBlock];
    UIWindow *presentedWindow = [[UIWindow alloc] initWithFrame: UIScreen.mainScreen.bounds];
    
    presentedWindow.rootViewController      = controller;
    presentedWindow.windowLevel             = UIWindowLevelAlert + 1;
    presentedWindow.hidden                  = NO;
    
    currentWindow = presentedWindow;
}



@end

