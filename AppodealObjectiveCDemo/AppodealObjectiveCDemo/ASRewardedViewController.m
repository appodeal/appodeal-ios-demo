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
    
//    if ([Appodeal isReadyForShowWithStyle:AppodealShowStyleRewardedVideo]) {
//        [Appodeal showAd:AppodealShowStyleRewardedVideo rootViewController:self];
//    }
    
    NSString * placement = [self.placementField.text length] ? self.placementField.text : nil;
    
//    id<APDReward> reward = [Appodeal rewardForPlacement:placement];
    if ([Appodeal canShowAd:AppodealShowStyleRewardedVideo forPlacement:placement]) {
        [Appodeal showAd:AppodealShowStyleRewardedVideo forPlacement:placement rootViewController:self];
    }
}

#pragma mark - AppodealRewardedVideoDelegate

/*!
 *  Method called when rewarded video did load
 */
- (void)rewardedVideoDidLoadAd{
    
}

/*!
 *  Mehtod called if rewarded video mediation failed
 */
- (void)rewardedVideoDidFailToLoadAd{
    
}

/*!
 *  Method called if interstitial mediation was success, but ready ad network can't show ad or
 *  ad presentation was to frequently according your placement settings
 */
- (void)rewardedVideoDidFailToPresent{
    
}

/*!
 *  Method called after rewarded video start displaying
 */
- (void)rewardedVideoDidPresent{
    
}

/*!
 *  Methof called before rewarded video leave screen
 */
- (void)rewardedVideoWillDismiss{
    
}

/*!
 *  Method called after fully watch of video
 *  @warning After call this method rewarded video can stay on screen and show postbanner
 *
 *  @param rewardAmount Amount of app curency tuned via Appodeal Dashboard
 *  @param rewardName   Name of app curency tuned via Appodeal Dashboard
 */
- (void)rewardedVideoDidFinish:(NSUInteger)rewardAmount name:(NSString *)rewardName{
    
}

@end
