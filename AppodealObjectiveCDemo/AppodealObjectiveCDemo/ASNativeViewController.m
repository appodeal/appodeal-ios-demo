//
//  ASNativeViewController.m
//  AppodealObjectiveCDemo
//
//  Copyright © 2018 appodeal. All rights reserved.
//

#import "ASNativeViewController.h"
#import "ASNativeView.h"

#import <Appodeal/Appodeal.h>
#import <ASExtentions/ASExtentions.h>


#define kASDefaultCell @"kASDefaultCell"
#define kASNativeCell  @"kASNativeCell"

NSUInteger const period = 5;

@interface ASNativeViewController () <APDNativeAdQueueDelegate>

@property (nonatomic, strong) NSMapTable <NSIndexPath *,__kindof APDNativeAd *>* nativeAdStack;
@property (nonatomic, strong) APDNativeAdQueue * nativeAdQueue;

@end

@implementation ASNativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nativeAdStack = [NSMapTable strongToStrongObjectsMapTable];
    [self.nativeAdQueue loadAd];
}

- (void)presentNativeOnView:(UIView *)view fromIndex:(NSIndexPath *)index {
    APDNativeAd * nativeAd = nil;
    if ([self.nativeAdStack objectForKey:index]) {
        nativeAd = [self.nativeAdStack objectForKey:index];
    } else if (self.nativeAdQueue.currentAdCount) {
        nativeAd = [[self.nativeAdQueue getNativeAdsOfCount:1] firstObject];
        [self.nativeAdStack setObject:nativeAd forKey:index];
    }
    
    if (nativeAd) {
        UIView *nativeView = [nativeAd getAdViewForController:self];
        [view addSubview:nativeView];
        [nativeView asxEdgesEqualView:view];
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
    UITableViewCell * cell = nil;
    if (indexPath.row  && (indexPath.row % period == 0)) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kASNativeCell];
        [self presentNativeOnView:cell.contentView fromIndex:indexPath];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:kASDefaultCell];
        [cell.contentView asxRound];
    }
    return cell;
}

#pragma mark - APDNativeAdQueueDelegate

- (void)adQueueAdIsAvailable:(APDNativeAdQueue *)adQueue ofCount:(NSUInteger)count {}
- (void)adQueue:(APDNativeAdQueue *)adQueue failedWithError:(NSError *)error {}

@end
