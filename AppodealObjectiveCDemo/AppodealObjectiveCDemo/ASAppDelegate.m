//
//  AppDelegate.m
//  appodeal_demo
//
//  Copyright © 2017 appodeal. All rights reserved.
//

#import "ASAppDelegate.h"
#import <Appodeal/Appodeal.h>
#import <ASExtentions/ASExtentions.h>
#import <ASGDPR/ASGDPR.h>

#define APP_KEY                 @"dee74c5129f53fc629a44a690a02296694e3eef99f2d3a5f"
#define ADMOB_PUBLISHER_ID      @"pub-0123456789012345"


@interface ASAppDelegate ()

@end

@implementation ASAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self initializeSDK];
    [self configureAppearance];
    
    return YES;
}

- (void)initializeSDK {
    /// Custom settings
    // [Appodeal setFramework:APDFrameworkNative version:@"1.0.0"]
    // [Appodeal setTriggerPrecacheCallbacks:YES];
    // [Appodeal setLocationTracking:YES];
    /// Test Mode
    // [Appodeal setTestingEnabled:YES];
    
    /// User Data
    // [Appodeal setUserId:@"user_id"];
    // [Appodeal setUserAge:1];
    // [Appodeal setUserGender:AppodealUserGenderMale];
    
    [Appodeal setLogLevel:APDLogLevelDebug];
    [Appodeal setAutocache:YES types:AppodealAdTypeInterstitial | AppodealAdTypeRewardedVideo | AppodealAdTypeBanner];
    
    // Google mobile ads publisher id from https://developers.google.com/admob/ios/eu-consent
    // you need to replace this value with your publisher id
    NSArray <NSString *> *publisherIds = @[ADMOB_PUBLISHER_ID];
    [ASGDPR presentConsentDialogForPublisherIds:publisherIds consentBlock:^(ASConsentStatus status) {
        AppodealAdType types = AppodealAdTypeInterstitial | AppodealAdTypeRewardedVideo | AppodealAdTypeBanner | AppodealAdTypeNativeAd;
        BOOL consent = status != ASConsentStatusNotPersonalized;
        [Appodeal initializeWithApiKey:APP_KEY
                                 types:types
                            hasConsent:consent];
    }];
}

- (void)configureAppearance {
    [[UINavigationBar appearance] setTintColor:UIColor.whiteColor];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor clearColor]} forState:UIControlStateNormal];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor clearColor]} forState:UIControlStateHighlighted];
    
    [[UITabBar appearance] setTintColor:UIColor.whiteColor];
    if ([[UITabBar appearance] respondsToSelector:@selector(setUnselectedItemTintColor:)]) {
        [[UITabBar appearance] setUnselectedItemTintColor:UIColor.lightGrayColor];
    }
}

@end

