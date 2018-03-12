//
//  ASCustomBannerViewController.m
//  appodeal_demo
//
//  Copyright © 2017 appodeal. All rights reserved.
//

#import "ASCustomBannerViewController.h"
#import <Appodeal/Appodeal.h>

#define isTablet UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad

@interface ASCustomBannerViewController ()<AppodealBannerViewDelegate>

@property (strong, nonatomic) IBOutlet APDBannerView *bannerView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *height;

@end

@implementation ASCustomBannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGSize bannerSize = kAPDAdSize320x50;
    if (isTablet) {
        bannerSize = kAPDAdSize728x90;
    }
    
//    If you don't use storyboard - need create, add to subviews and set delegate
//    
//    self.bannerView = [[AppodealBannerView alloc] initWithSize:bannerSize rootViewController:self];
//    self.bannerView.delegate = self;
//    [self.view addSubview:self.bannerView];
//
//    You can set custom seettings
//    [self.bannerView setBackgroundVisible:YES];
//    [self.bannerView setUsesSmartSizing:YES];
    
    [self.bannerView setAdSize:bannerSize];
    self.height.constant = bannerSize.height;
    
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
