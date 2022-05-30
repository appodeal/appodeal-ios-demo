//
//  AppDelegate.m
//  appodeal_demo
//
//  Copyright © 2017 appodeal. All rights reserved.
//

#import "ASAppDelegate.h"
#import <Appodeal/Appodeal.h>\


#define APP_KEY                 @"dee74c5129f53fc629a44a690a02296694e3eef99f2d3a5f"


@interface ASAppDelegate () <AppodealInitializationDelegate>
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
    [Appodeal setTestingEnabled:YES];
    [Appodeal setLogLevel:APDLogLevelDebug];
    [Appodeal setAutocache:YES types:AppodealAdTypeInterstitial | AppodealAdTypeRewardedVideo | AppodealAdTypeBanner];
    
    /// User Data
    // [Appodeal setUserId:@"user_id"];
    
    AppodealAdType types = AppodealAdTypeInterstitial | AppodealAdTypeRewardedVideo | AppodealAdTypeBanner | AppodealAdTypeNativeAd;
    
    [Appodeal setInitializationDelegate:self];
    [Appodeal initializeWithApiKey:APP_KEY types:types];
}

- (void)appodealSDKDidInitialize {
    //here you can do any additional actions
}

- (void)configureAppearance {
    [[UINavigationBar appearance] setTintColor:UIColor.whiteColor];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor clearColor]} forState:UIControlStateNormal];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor clearColor]} forState:UIControlStateHighlighted];
    
    [[UITabBar appearance] setTintColor:UIColor.whiteColor];
    [[UITabBar appearance] setBackgroundColor:UIColor.systemRedColor];
    if ([[UITabBar appearance] respondsToSelector:@selector(setUnselectedItemTintColor:)]) {
        [[UITabBar appearance] setUnselectedItemTintColor:UIColor.lightGrayColor];
    }
}

@end

