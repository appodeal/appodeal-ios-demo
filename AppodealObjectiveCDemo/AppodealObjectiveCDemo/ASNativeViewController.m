//
//  ASNativeViewController.m
//  AppodealObjectiveCDemo
//
//  Copyright © 2018 appodeal. All rights reserved.
//

#import "ASNativeViewController.h"
#import "ASNativeView.h"

#import <Appodeal/Appodeal.h>


#define kASDefaultCell @"kASDefaultCell"
#define kASNativeCell  @"kASNativeCell"

NSUInteger const period = 5;

@interface ASNativeViewController () <APDNativeAdQueueDelegate>

@property (nonatomic, strong) NSMapTable <NSIndexPath *, APDNativeAd *> *adCache;
@property (nonatomic, strong) APDNativeAdQueue *nativeAdQueue;

@end

@implementation ASNativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.adCache = [NSMapTable strongToStrongObjectsMapTable];    
    [self.nativeAdQueue loadAd];
}

- (void)presentNativeOnView:(UIView *)view fromIndex:(NSIndexPath *)index {
    APDNativeAd *nativeAd = [self.adCache objectForKey:index];
    // Get ad from cache
    if (nativeAd != nil) {
        UIView *adView = [nativeAd getAdViewForController:self];
        [self layoutAdView:adView superview:view];
        return;
    }
    // Get ad from queue
    nativeAd = [[self.nativeAdQueue getNativeAdsOfCount:1] firstObject];
    if (nativeAd != nil) {
        // Save native ad for future use
        [self.adCache setObject:nativeAd forKey:index];
        UIView *adView = [nativeAd getAdViewForController:self];
        [self layoutAdView:adView superview:view];
    }
}

- (void)layoutAdView:(UIView *)adView superview:(UIView *)superview {
    if (adView) {
        [superview addSubview:adView];
        adView.translatesAutoresizingMaskIntoConstraints = NO;
        [NSLayoutConstraint activateConstraints:@[
            [adView.leftAnchor constraintEqualToAnchor:superview.leftAnchor],
            [adView.rightAnchor constraintEqualToAnchor:superview.rightAnchor],
            [adView.topAnchor constraintEqualToAnchor:superview.topAnchor],
            [adView.bottomAnchor constraintEqualToAnchor:superview.bottomAnchor]
        ]];
    }
}

- (APDNativeAdQueue *)nativeAdQueue {
    if (!_nativeAdQueue) {
        _nativeAdQueue = [APDNativeAdQueue nativeAdQueueWithSdk:nil
                                                       settings:self.nativeAdSettings
                                                       delegate:self
                                                      autocache:YES];
    }
    return _nativeAdQueue;
}

- (APDNativeAdSettings *)nativeAdSettings {
    APDNativeAdSettings * _instance = [APDNativeAdSettings new];
    _instance.adViewClass = ASNativeView.class;
    _instance.type = APDNativeAdTypeAuto;
    return _instance;
}

#pragma mark - UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if (indexPath.row  && (indexPath.row % period == 0)) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kASNativeCell];
        [self presentNativeOnView:cell.contentView fromIndex:indexPath];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:kASDefaultCell];
        cell.contentView.layer.masksToBounds = YES;
        cell.contentView.layer.cornerRadius = 16;
    }
    return cell;
}

#pragma mark - APDNativeAdQueueDelegate

- (void)adQueueAdIsAvailable:(APDNativeAdQueue *)adQueue ofCount:(NSUInteger)count {}
- (void)adQueue:(APDNativeAdQueue *)adQueue failedWithError:(NSError *)error {}

@end
