//
//  ASInterstitialViewController.m
//  appodeal_demo
//
//  Copyright © 2017 appodeal. All rights reserved.
//

#import "ASInterstitialViewController.h"
#import <Appodeal/Appodeal.h>

@interface ASInterstitialViewController ()<AppodealInterstitialDelegate>

@property (strong, nonatomic) IBOutlet UITextField *placementField;

@end

@implementation ASInterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Appodeal setInterstitialDelegate:self];
}

- (IBAction)showClick:(UIButton *)sender {
    
//    if ([Appodeal isReadyForShowWithStyle:AppodealShowStyleInterstitial]) {
//        [Appodeal showAd:AppodealShowStyleInterstitial rootViewController:self];
//    }
    
    NSString * placement = [self.placementField.text length] ? self.placementField.text : nil;
    if ([Appodeal canShow:AppodealAdTypeInterstitial forPlacement:placement]) {
        [Appodeal showAd:AppodealShowStyleInterstitial forPlacement:placement rootViewController:self];
    }
}

#pragma mark - AppodealInterstitialDelegate

/*!
 *  Method called when precache (cheap and fast load) or usual interstitial view did load
 *  @warning If you want show only expensive ad, ignore this callback call with precache equal to YES
 *
 *  @param precache If precache is YES it's mean that precache loaded
 */
- (void)interstitialDidLoadAdIsPrecache:(BOOL)precache{
    
}

/*!
 *  Method called if interstitial mediation failed
 */
- (void)interstitialDidFailToLoadAd{
    
}

/*!
 *  Method called if interstitial mediation was success, but ready ad network can't show ad or
 *  ad presentation was to frequently according your placement settings
 */
- (void)interstitialDidFailToPresent{
    
}

/*!
 *  Method called when interstitial will display on screen
 */
- (void)interstitialWillPresent{
    
}

/*!
 *  Method called after interstitial leave screeen
 */
- (void)interstitialDidDismiss{
    
}

/*!
 *  Method called when user tap on interstitial
 */
- (void)interstitialDidClick{
    
}

@end
