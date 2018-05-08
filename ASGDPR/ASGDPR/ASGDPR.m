//
//  ASGDPR.m
//  ASGDPR
//
//  Created by Lozhkin Ilya on 5/8/18.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import "ASGDPR.h"
#import "ASPrivacyController.h"
#import "ASBlankController.h"
#import <AdSupport/AdSupport.h>

#define ASK_USER_CONSENT @"ask_userConsent"

static UIWindow *currentWindow = nil;

@implementation ASGDPR

+ (void)present:(ASConsentBlock)consentBlock {
    [self present:consentBlock legacy:NO];
}

+ (void)present:(ASConsentBlock)consentBlock legacy:(BOOL)legacy {
    
    BOOL isLimited = ![[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled];
    NSNumber *userConsent = self.userConsent;
    
    if (!isLimited && userConsent.boolValue) {
        consentBlock(YES);
    } else if (!isLimited && !userConsent) {
        
        ASConsentBlock consent = ^(BOOL consent) {
            consentBlock(consent);
            [self saveUserConsent:consent];
            
            currentWindow.hidden = YES;
            currentWindow = nil;
            if (!consent) {
                [self presentViewController:[ASBlankController controller]];
            }
        };
        [self presentViewController:[ASPrivacyController controllerWitConsent:consent]];
    } else {
        consentBlock(NO);
        [self presentViewController:[ASBlankController controller]];
    }
}

+ (void)presentViewController:(UIViewController *)controller {
    UIWindow *presentedWindow = [[UIWindow alloc] initWithFrame: UIScreen.mainScreen.bounds];
    
    presentedWindow.rootViewController      = controller;
    presentedWindow.windowLevel             = UIWindowLevelAlert + 1;
    presentedWindow.hidden                  = NO;
    
    currentWindow = presentedWindow;
}

+ (NSNumber *)userConsent {
    return [[NSUserDefaults standardUserDefaults] objectForKey:ASK_USER_CONSENT];
}

+ (void)saveUserConsent:(BOOL)hasConsent {
    return [[NSUserDefaults standardUserDefaults] setObject:@(hasConsent) forKey:ASK_USER_CONSENT];
}

@end

