//
//  ASRewardedViewController.m
//  appodeal_demo
//
//  Copyright © 2017 appodeal. All rights reserved.
//

#import "ASRewardedViewController.h"
#import <Appodeal/Appodeal.h>


@interface ASRewardedViewController ()<AppodealRewardedVideoDelegate>

@property (strong, nonatomic) IBOutlet UITextField *placementField;

@end

@implementation ASRewardedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Appodeal setRewardedVideoDelegate:self];
}

- (IBAction)showClick:(UIButton *)sender {
    NSString * placement = [self.placementField.text length] ? self.placementField.text : nil;
    if ([Appodeal isInitalizedForAdType:AppodealAdTypeRewardedVideo] && [Appodeal canShow:AppodealAdTypeRewardedVideo forPlacement:placement]) {
        [Appodeal showAd:AppodealShowStyleRewardedVideo forPlacement:placement rootViewController:self];
    }
}

#pragma mark - AppodealRewardedVideoDelegate

- (void)rewardedVideoDidLoadAdIsPrecache:(BOOL)precache {}
- (void)rewardedVideoDidFailToLoadAd {}
- (void)rewardedVideoDidFailToPresentWithError:(NSError *)error {}
- (void)rewardedVideoDidPresent {}
- (void)rewardedVideoWillDismissAndWasFullyWatched:(BOOL)wasFullyWatched {}
- (void)rewardedVideoDidFinish:(float)rewardAmount name:(NSString *)rewardName {}

@end
