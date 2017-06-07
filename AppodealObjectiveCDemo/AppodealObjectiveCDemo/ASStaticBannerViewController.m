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
    
//    You can set custom seettings
//    [Appodeal setSmartBannersEnabled:YES];
//    [Appodeal setBannerAnimationEnabled:YES];
//    [Appodeal setBannerBackgroundVisible:YES];
    
    [Appodeal setBannerDelegate:self];
}

- (IBAction)topClick:(UIButton *)sender {
//    if ([Appodeal isReadyForShowWithStyle:AppodealShowStyleBannerTop]) {
//        [Appodeal showAd:AppodealShowStyleBannerTop rootViewController:self];
//    }
    
    NSString * placement = [self.placementField.text length] ? self.placementField.text : nil;
    if ([Appodeal canShowAd:AppodealShowStyleBannerTop forPlacement:placement]) {
        [Appodeal showAd:AppodealShowStyleBannerTop forPlacement:placement rootViewController:self];
    }
}

- (IBAction)bottomClick:(UIButton *)sender {
//    if ([Appodeal isReadyForShowWithStyle:AppodealShowStyleBannerBottom]) {
//        [Appodeal showAd:AppodealShowStyleBannerBottom rootViewController:self];
//    }
    
    NSString * placement = [self.placementField.text length] ? self.placementField.text : nil;
    if ([Appodeal canShowAd:AppodealShowStyleBannerBottom forPlacement:placement]) {
        [Appodeal showAd:AppodealShowStyleBannerBottom forPlacement:placement rootViewController:self];
    }
}

#pragma mark - AppodealBannerDelegate

/*!
 *  Method called when precache (cheap and fast load) or usual banner view did load
 *
 *  @param precache If precache is YES it's mean that precache loaded
 */
- (void)bannerDidLoadAdIsPrecache:(BOOL)precache{
    
}

/*!
 *  Method called if banner mediation failed
 */
- (void)bannerDidFailToLoadAd{
    
}

/*!
 *  Method called when user tap on banner
 */
- (void)bannerDidClick{
    
}

/*!
 *  Method called when banner did show
 */
- (void)bannerDidShow{
    
}

@end
