//
//  AppDelegate.m
//  appodeal_demo
//
//  Copyright © 2017 appodeal. All rights reserved.
//

#import "ASAppDelegate.h"

#import <ASGDPR/ASGDPR.h>
#import <Appodeal/Appodeal.h>
#import <ASExtentions/ASExtentions.h>

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
    
    AppodealAdType types = AppodealAdTypeInterstitial | AppodealAdTypeRewardedVideo | AppodealAdTypeBanner | AppodealAdTypeMREC;
    [Appodeal setAutocache:YES types:types];
    
    // Google mobile ads publisher id from https://developers.google.com/admob/ios/eu-consent
    // you need to replace this value with your publisher id
    NSArray <NSString *> * publisherIds = @[ADMOB_PUBLISHER_ID];
    [ASGDPR presentConsentDialogForPublisherIds:publisherIds consentBlock:^(ASConsentStatus status) {
        BOOL consent = status != ASConsentStatusNotPersonalized;
        if (consent) {
            [Appodeal initializeWithApiKey:APP_KEY
                                     types:types];
        }
    }];
    
    [Appodeal initializeWithApiKey:APP_KEY types:AppodealAdTypeInterstitial | AppodealAdTypeRewardedVideo | AppodealAdTypeBanner |AppodealAdTypeMREC];
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

