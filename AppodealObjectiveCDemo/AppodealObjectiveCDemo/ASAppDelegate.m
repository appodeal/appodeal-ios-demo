//
//  AppDelegate.m
//  appodeal_demo
//
//  Copyright © 2017 appodeal. All rights reserved.
//

#import "ASAppDelegate.h"
#import <Appodeal/Appodeal.h>
#import <StackConsentManager/StackConsentManager.h>

#if __has_include(<AppTrackingTransparency/AppTrackingTransparency.h>)
#import <AppTrackingTransparency/AppTrackingTransparency.h>
#endif


#define APP_KEY                 @"dee74c5129f53fc629a44a690a02296694e3eef99f2d3a5f"


@interface ASAppDelegate () <STKConsentManagerDisplayDelegate>

@end


@implementation ASAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self requestTrackingAuthorization];
    [self configureAppearance];
    return YES;
}

- (void)initializeSDK {
    /// Custom settings
    // [Appodeal setFramework:APDFrameworkNative version:@"1.0.0"]
    // [Appodeal setTriggerPrecacheCallbacks:YES];
    // [Appodeal setLocationTracking:YES];
    /// Test Mode
    [Appodeal setTestingEnabled:YES];
    
    /// User Data
    // [Appodeal setUserId:@"user_id"];
    // [Appodeal setUserAge:1];
    // [Appodeal setUserGender:AppodealUserGenderMale];
    
    [Appodeal setLogLevel:APDLogLevelDebug];
    [Appodeal setAutocache:YES types:AppodealAdTypeInterstitial | AppodealAdTypeRewardedVideo | AppodealAdTypeBanner];
    
    AppodealAdType types = AppodealAdTypeInterstitial | AppodealAdTypeRewardedVideo | AppodealAdTypeBanner | AppodealAdTypeNativeAd;
    if (STKConsentManager.sharedManager.consent != nil) {
        [Appodeal initializeWithApiKey:APP_KEY
                                 types:types
                         consentReport:STKConsentManager.sharedManager.consent];
    } else {
        [Appodeal initializeWithApiKey:APP_KEY
                                 types:types];
    }
}

- (void)requestTrackingAuthorization {
#if __has_include(<AppTrackingTransparency/AppTrackingTransparency.h>)
    if (@available(iOS 14, *)) {
        __weak typeof(self) weakSelf = self;
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            __strong typeof(self) strongSelf = weakSelf;
            [strongSelf synchroniseConsent];
        }];
    } else {
        [self synchroniseConsent];
    }
#else
    [self synchroniseConsent];
#endif
}

- (void)synchroniseConsent {
    __weak typeof(self) weakSelf = self;
    [STKConsentManager.sharedManager synchronizeWithAppKey:APP_KEY completion:^(NSError *error) {
        __strong typeof(self) strongSelf = weakSelf;
        if (error) {
            NSLog(@"Error while synchronising consent manager: %@", error);
        }
        
        if (STKConsentManager.sharedManager.shouldShowConsentDialog != STKConsentBoolTrue) {
            [strongSelf initializeSDK];
            return ;
        }
        
        [STKConsentManager.sharedManager loadConsentDialog:^(NSError *error) {
            if (error) {
                NSLog(@"Error while loading consent dialog: %@", error);
            }
            
            if (!STKConsentManager.sharedManager.isConsentDialogReady) {
                [strongSelf initializeSDK];
                return ;
            }
            UIViewController *rootViewController = strongSelf.window.rootViewController;
            [STKConsentManager.sharedManager showConsentDialogFromRootViewController:rootViewController
                                                                            delegate:strongSelf];
        }];
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

#pragma mark - STKConsentManagerDisplayDelegate

- (void)consentManagerWillShowDialog:(STKConsentManager *)consentManager {}

- (void)consentManagerDidDismissDialog:(STKConsentManager *)consentManager {
    [self initializeSDK];
}

- (void)consentManager:(STKConsentManager *)consentManager didFailToPresent:(NSError *)error {
    [self initializeSDK];
}

@end

