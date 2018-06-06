//
//  AppDelegate.m
//  ASGDPRTests
//
//  Created by Lozhkin Ilya on 6/5/18.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import "AppDelegate.h"
#import <ASGDPR/ASGDPR.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [ASGDPR presentConsentDialogForPublisherIds:@[] consentBlock:^(ASConsentStatus status) {
        
    }];
    
    return YES;
}


@end
