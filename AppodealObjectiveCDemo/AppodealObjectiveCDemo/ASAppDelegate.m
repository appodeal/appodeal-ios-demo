//
//  AppDelegate.m
//  appodeal_demo
//
//  Copyright © 2017 appodeal. All rights reserved.
//

#import "ASAppDelegate.h"
#import <Appodeal/Appodeal.h>
#import <StackConsentManager/StackConsentManager.h>


#define APP_KEY                 @"dee74c5129f53fc629a44a690a02296694e3eef99f2d3a5f"


@interface ASAppDelegate () <STKConsentManagerDisplayDelegate>

@end


@implementation ASAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self synchroniseConsent];
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
    BOOL consent = STKConsentManager.sharedManager.consentStatus != STKConsentStatusNonPersonalized;
    [Appodeal initializeWithApiKey:APP_KEY
                             types:types
                        hasConsent:consent];
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

