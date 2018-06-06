//
//  ASGDPR.m
//  ASGDPR
//
//  Created by Lozhkin Ilya on 5/8/18.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import "ASGDPR.h"
#import "ASPrivacyController.h"
#import "ASConsentController.h"

#import <AdSupport/AdSupport.h>
#import <PersonalizedAdConsent/PersonalizedAdConsent.h>


#define ASK_USER_CONSENT @"ask_userConsent"
#define ASK_NAVIGAION_CONTROLLER_ID @"ASNavigationViewController"

static UIWindow *currentWindow = nil;

@implementation ASGDPR

+ (void)presentConsentDialogForPublisherIds:(NSArray<NSString *> *)publisherIds
                               consentBlock:(ASConsentBlock)consentBlock {
    [PACConsentInformation.sharedInstance requestConsentInfoUpdateForPublisherIdentifiers:publisherIds completionHandler:^(NSError *_Nullable error) {
//        [self presentPrivacyUserStory:^(BOOL userConsent) {
//
//        }];
//        return;
        // Check that user in EEA
        if (!PACConsentInformation.sharedInstance.requestLocationInEEAOrUnknown) {
            consentBlock(ASConsentStatusNotRequired);
            return;
        }
        // Check that LAT disabled
        BOOL isLimitAdTrackingEnabled = !ASIdentifierManager.sharedManager.isAdvertisingTrackingEnabled;
        if (isLimitAdTrackingEnabled) {
            consentBlock(ASConsentStatusNotPersonalized);
            return;
        }
        // Check that we already ask user for consent
        NSNumber * userConsent = self.userConsent;
        if (userConsent) {
            ASConsentStatus status = userConsent.boolValue ? ASConsentStatusPersonalized : ASConsentStatusNotPersonalized;
            consentBlock(status);
            return;
        }
        // Show dialog
        [self presentPrivacyUserStory:^(BOOL userConsent) {
            [self saveUserConsent:userConsent];
            
            currentWindow.hidden = YES;
            currentWindow = nil;
            ASConsentStatus status = userConsent ? ASConsentStatusPersonalized : ASConsentStatusNotPersonalized;
            consentBlock(status);
        }];
    }];
}

+ (NSBundle *)bundle {
    return NSBundle.mainBundle;
}

+ (void)presentPrivacyUserStory:(void(^)(BOOL))consent {
    UIWindow * presentedWindow = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];

    ASPrivacyController * controller = [ASPrivacyController new];
    controller.consentBlock = consent;
    
    presentedWindow.rootViewController      = controller;
    presentedWindow.windowLevel             = UIWindowLevelAlert + 1;
    presentedWindow.hidden                  = NO;
    presentedWindow.backgroundColor         = UIColor.whiteColor;
    
    currentWindow = presentedWindow;
}

+ (NSNumber *)userConsent {
    return [[NSUserDefaults standardUserDefaults] objectForKey:ASK_USER_CONSENT];
}

+ (void)saveUserConsent:(BOOL)hasConsent {
    return [[NSUserDefaults standardUserDefaults] setObject:@(hasConsent) forKey:ASK_USER_CONSENT];
}

@end

