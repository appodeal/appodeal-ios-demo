//
//  ASRectangleBannerViewController.m
//  appodeal_demo
//
//  Copyright © 2017 appodeal. All rights reserved.
//

#import "ASRectangleBannerViewController.h"
#import <Appodeal/Appodeal.h>

@interface ASRectangleBannerViewController ()<AppodealBannerViewDelegate>

@property (strong, nonatomic) IBOutlet AppodealMRECView *bannerView;

@end

@implementation ASRectangleBannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    if you don't use storyboard - need create, add to subviews and set delegate
//    
//    self.bannerView = [[AppodealMRECView alloc] initWithRootViewController:self];
//    self.bannerView.delegate = self;
//    [self.view addSubview:self.bannerView];
    
    [self.bannerView loadAd];
}

#pragma mark - AppodealBannerViewDelegate

/**
 *  Method called when banner did load firstly, after refresh this method not call
 *
 *  @param bannerView Nonnul, ready to show banner
 */
- (void)bannerViewDidLoadAd:(APDBannerView *)bannerView{
    
}

/**
 *  Method called in case that banner mediation failed
 *
 *  @param bannerView Nonnul failed banner view
 *  @param error      Error occured while mediation
 */
- (void)bannerView:(APDBannerView *)bannerView didFailToLoadAdWithError:(NSError *)error{
    
}

/**
 *  Method called when user tap on banner
 *
 *  @param bannerView Nonnul banner view
 */
- (void)bannerViewDidInteract:(APDBannerView *)bannerView{
    
}

/*!
 *  Method called after any banner was show
 *
 *  @param bannerView On screen banner view
 */
- (void)bannerViewDidShow:(APDBannerView *)bannerView{
    
}

@end
