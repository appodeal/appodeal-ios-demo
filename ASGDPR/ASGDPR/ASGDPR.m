//
//  ASGDPR.m
//  ASGDPR
//
//  Created by Lozhkin Ilya on 5/8/18.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import "ASGDPR.h"
#import "ASPrivacyController.h"
#import <AdSupport/AdSupport.h>

#define ASK_USER_CONSENT @"ask_userConsent"
#define ASK_NAVIGAION_CONTROLLER_ID @"ASNavigationViewController"

static UIWindow *currentWindow = nil;

@implementation ASGDPR

+ (void)present:(ASConsentBlock)consentBlock {
    [self present:consentBlock legacy:NO];
}

+ (void)present:(ASConsentBlock)consentBlock legacy:(BOOL)legacy {
    
    BOOL isLimited = ![[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled];
    NSNumber * userConsent = self.userConsent;
    
    if (!isLimited && userConsent.boolValue) {
        consentBlock(YES);
    } else if (!isLimited && !userConsent) {
        [self presentPrivacyUserStory:^(BOOL consent){
            [self saveUserConsent:consent];
            
            currentWindow.hidden = YES;
            currentWindow = nil;
            consentBlock(consent);
        }];
    } else {
        consentBlock(NO);
    }
}

+ (void)presentPrivacyUserStory:(ASConsentBlock)consent {
    UIWindow *presentedWindow = [[UIWindow alloc] initWithFrame: UIScreen.mainScreen.bounds];
    
    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"GDPRBoard" bundle: NSBundle.mainBundle];
    UINavigationController * navigation = [storyBoard instantiateViewControllerWithIdentifier: ASK_NAVIGAION_CONTROLLER_ID];
    ASPrivacyController * controller = [storyBoard instantiateViewControllerWithIdentifier:@"ASPrivacy"];
    controller.consentBlock = consent;
    
    presentedWindow.rootViewController      = navigation;
    presentedWindow.windowLevel             = UIWindowLevelAlert + 1;
    presentedWindow.hidden                  = NO;

    currentWindow = presentedWindow;
    
    [navigation pushViewController:controller animated:NO];
}

+ (NSNumber *)userConsent {
    return [[NSUserDefaults standardUserDefaults] objectForKey:ASK_USER_CONSENT];
}

+ (void)saveUserConsent:(BOOL)hasConsent {
    return [[NSUserDefaults standardUserDefaults] setObject:@(hasConsent) forKey:ASK_USER_CONSENT];
}

@end

