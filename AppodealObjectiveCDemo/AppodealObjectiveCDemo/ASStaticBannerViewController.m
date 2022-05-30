//
//  ASStaticBannerViewController.m
//  appodeal_demo
//
//  Copyright © 2017 appodeal. All rights reserved.
//

#import "ASStaticBannerViewController.h"
#import <Appodeal/Appodeal.h>


@interface ASStaticBannerViewController ()<AppodealBannerDelegate>

@property (strong, nonatomic) IBOutlet UITextField *placementField;

@end

@implementation ASStaticBannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /// Configure banner ads appearance
    // [Appodeal setSmartBannersEnabled:YES];
    // [Appodeal setBannerAnimationEnabled:YES];
    // [Appodeal setBannerBackgroundVisible:YES];
    [Appodeal setBannerDelegate:self];
}

- (IBAction)topClick:(UIButton *)sender {
    NSString * placement = [self.placementField.text length] ? self.placementField.text : nil;
    if ([Appodeal isInitializedForAdType:AppodealAdTypeBanner] && [Appodeal canShow:AppodealAdTypeBanner forPlacement:placement]) {
        [Appodeal showAd:AppodealShowStyleBannerTop forPlacement:placement rootViewController:self];
    }
}

- (IBAction)bottomClick:(UIButton *)sender {
    NSString * placement = [self.placementField.text length] ? self.placementField.text : nil;
    if ([Appodeal isInitializedForAdType:AppodealAdTypeBanner] && [Appodeal canShow:AppodealAdTypeBanner forPlacement:placement]) {
        [Appodeal showAd:AppodealShowStyleBannerBottom forPlacement:placement rootViewController:self];
    }
}

#pragma mark - AppodealBannerDelegate

- (void)bannerDidLoadAdIsPrecache:(BOOL)precache {}
- (void)bannerDidFailToLoadAd {}
- (void)bannerDidClick {}
- (void)bannerDidShow {}

@end
