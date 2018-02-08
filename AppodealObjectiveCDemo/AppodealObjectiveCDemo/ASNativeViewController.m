//
//  ASNativeViewController.m
//  AppodealObjectiveCDemo
//
//  Copyright © 2018 appodeal. All rights reserved.
//

#import "ASNativeViewController.h"
#import "ASNativeView.h"

#import <Appodeal/Appodeal.h>

@interface ASNativeViewController () <APDNativeAdQueueDelegate>

@property (weak, nonatomic) IBOutlet UIView *nativeAdContainer;

@property (nonatomic, strong) APDNativeAdQueue * nativeAdQueue;
@property (nonatomic, strong) NSArray <__kindof APDNativeAd *> * nativeAdStack;

@end

@implementation ASNativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.nativeAdQueue loadAd];
}

- (void)presentNative {
    APDNativeAd * nativeAd = self.nativeAdStack.firstObject;
    UIView * nativeAdView = [nativeAd getAdViewForController:self];
    [self.nativeAdContainer addSubview:nativeAdView];
    nativeAdView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[[NSLayoutConstraint constraintWithItem:nativeAdView
                                                                           attribute:NSLayoutAttributeTop
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.nativeAdContainer
                                                                           attribute:NSLayoutAttributeTop
                                                                          multiplier:1.0
                                                                            constant:0],
                                              [NSLayoutConstraint constraintWithItem:nativeAdView
                                                                           attribute:NSLayoutAttributeLeading
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.nativeAdContainer
                                                                           attribute:NSLayoutAttributeLeading
                                                                          multiplier:1.0
                                                                            constant:0],
                                              [NSLayoutConstraint constraintWithItem:self.nativeAdContainer
                                                                           attribute:NSLayoutAttributeBottom
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:nativeAdView
                                                                           attribute:NSLayoutAttributeBottom
                                                                          multiplier:1.0
                                                                            constant:0],
                                              [NSLayoutConstraint constraintWithItem:nativeAdView
                                                                           attribute:NSLayoutAttributeTrailing
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.nativeAdContainer
                                                                           attribute:NSLayoutAttributeTrailing
                                                                          multiplier:1.0
                                                                            constant:0]]];
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

#pragma mark - APDNativeAdQueueDelegate

/**
 Method called when loader receives native ad.
 
 @param adQueue ad queue object
 @param count count of available native ad
 */
- (void)adQueueAdIsAvailable:(nonnull APDNativeAdQueue *)adQueue ofCount:(NSUInteger)count {
    if (!self.nativeAdStack.count) {
        self.nativeAdStack = [self.nativeAdQueue getNativeAdsOfCount:1];
        [self presentNative];
    }
}

/**
 Method called when loader fails to receive native ad.
 
 @param adQueue ad queue object
 @param error Error occurred
 */
- (void)adQueue:(nonnull APDNativeAdQueue *)adQueue failedWithError:(nonnull NSError *)error {
}

@end
