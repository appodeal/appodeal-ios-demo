//
//  RewardedVideoViewController.swift
//  AppodealSwiftDemo
//
//  Copyright © 2017 appodeal. All rights reserved.
//

import Appodeal
import UIKit

class RewardedVideoViewController: RootViewController {

    @IBOutlet weak var placementField: UITextField!
    
    // MARK: Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Appodeal.setRewardedVideoDelegate(self)
    }

    // MARK: Actions
    
    @IBAction func showButtonPressed(_ sender: UIButton) {
        guard let placement = placementField.text else {
            return
        }
        if Appodeal.canShowAd(.rewardedVideo, forPlacement: placement) {
            Appodeal.showAd(.rewardedVideo, forPlacement: placement, rootViewController: self)
        }
    }

}

extension RewardedVideoViewController: AppodealRewardedVideoDelegate {
    
    /*!
     *  Method called when rewarded video did load
     */
    func rewardedVideoDidLoadAd() {
        
    }
    
    /*!
     *  Mehtod called if rewarded video mediation failed
     */
    func rewardedVideoDidFailToLoadAd() {
        
    }
    
    /*!
     *  Method called if interstitial mediation was success, but ready ad network can't show ad or
     *  ad presentation was to frequently according your placement settings
     */
    func rewardedVideoDidFailToPresent() {
        
    }
    
    /*!
     *  Method called after rewarded video start displaying
     */
    func rewardedVideoDidPresent() {
        
    }
    
    /*!
     *  Methof called before rewarded video leave screen
     */
    func rewardedVideoWillDismiss() {
        
    }
    
    /*!
     *  Method called after fully watch of video
     *  @warning After call this method rewarded video can stay on screen and show postbanner
     *
     *  @param rewardAmount Amount of app curency tuned via Appodeal Dashboard
     *  @param rewardName   Name of app curency tuned via Appodeal Dashboard
     */
    func rewardedVideoDidFinish(_ rewardAmount: UInt, name rewardName: String!) {
        
    }
    
}
