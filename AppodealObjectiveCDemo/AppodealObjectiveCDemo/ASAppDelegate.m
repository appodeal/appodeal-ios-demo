//
//  AppDelegate.m
//  appodeal_demo
//
//  Copyright © 2017 appodeal. All rights reserved.
//

#import "ASAppDelegate.h"
#import <Appodeal/Appodeal.h>
#import <ASExtentions/ASExtentions.h>

#define APP_KEY @"2356404caf4dbc0314f9605bdf0f164d485086ae5212942e"

@interface ASAppDelegate ()

@end

@implementation ASAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self initializeSDK];
    [self configureAppearance];
    
    return YES;
}

- (void)initializeSDK{
//    <Custom settings>
//    [Appodeal setFramework:APDFrameworkNative];
//    [Appodeal setPluginVersion:@"1.1.1"];
//
//    <Test mode>
//    [Appodeal setTestingEnabled:YES];
//
//    <User data>
//    [Appodeal setUserId:@"user_id"];
//    [Appodeal setUserEmail:@"info@"];
//    [Appodeal setUserBirthday:[NSDate date]];
//    [Appodeal setUserAge:1];
//    [Appodeal setUserGender:AppodealUserGenderMale];
//    [Appodeal setUserOccupation:AppodealUserOccupationWork];
//    [Appodeal setUserRelationship:AppodealUserRelationshipSearching];
//    [Appodeal setUserSmokingAttitude:AppodealUserSmokingAttitudeNeutral];
//    [Appodeal setUserAlcoholAttitude:AppodealUserAlcoholAttitudeNeutral];
//    [Appodeal setUserInterests:@"SPORT, KINO"];
    
    [Appodeal setLogLevel:APDLogLevelOff];
    
    [Appodeal setAutocache:YES types:AppodealAdTypeInterstitial | AppodealAdTypeRewardedVideo | AppodealAdTypeBanner];
    [Appodeal initializeWithApiKey:APP_KEY types:AppodealAdTypeInterstitial | AppodealAdTypeRewardedVideo | AppodealAdTypeBanner | AppodealAdTypeNativeAd];
}

- (void)configureAppearance {
    
    [[UINavigationBar appearance] setTintColor:UIColor.whiteColor];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor clearColor]} forState:UIControlStateNormal];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor clearColor]} forState:UIControlStateHighlighted];
    
    if ([[UITabBar appearance] respondsToSelector:@selector(setUnselectedItemTintColor:)]) {
        [[UITabBar appearance] setUnselectedItemTintColor:UIColor.lightGrayColor];
    }
    [[UITabBar appearance] setTintColor:UIColor.whiteColor];
}

@end

