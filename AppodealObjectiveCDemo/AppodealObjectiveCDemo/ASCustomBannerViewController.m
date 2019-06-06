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
    
    /// If you don't use storyboard - need create, add to subviews and set delegate
    // self.bannerView = [[AppodealBannerView alloc] initWithSize:bannerSize rootViewController:self];
    // self.bannerView.delegate = self;
    // [self.view addSubview:self.bannerView];
    
    /// Configure banner ads appearance
    // [self.bannerView setBackgroundVisible:YES];
    // [self.bannerView setUsesSmartSizing:YES];
    
    [self.bannerView setAdSize:bannerSize];
    self.height.constant = bannerSize.height;
    
    [self.bannerView loadAd];
}

#pragma mark - AppodealBannerViewDelegate

- (void)bannerViewDidLoadAd:(APDBannerView *)bannerView isPrecache:(BOOL)precache {}
- (void)bannerView:(APDBannerView *)bannerView didFailToLoadAdWithError:(NSError *)error {}
- (void)bannerViewDidInteract:(APDBannerView *)bannerView {}
- (void)bannerViewDidShow:(APDBannerView *)bannerView {}

@end
