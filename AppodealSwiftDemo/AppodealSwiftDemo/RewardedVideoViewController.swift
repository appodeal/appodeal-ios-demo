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
        if Appodeal.canShow(.rewardedVideo, forPlacement: placement) {
            Appodeal.showAd(.rewardedVideo, forPlacement: placement, rootViewController: self)
        }
    }

}

extension RewardedVideoViewController: AppodealRewardedVideoDelegate {
    
    /// Method called when rewarded video loads
    ///
    /// - Parameter precache: If precache is YES it means that precached ad loaded
    func rewardedVideoDidLoadAdIsPrecache(_ precache: Bool) {
        
    }
    
    
    /// Method called if rewarded video mediation failed
    func rewardedVideoDidFailToLoadAd() {
        
    }

    /// Method called if rewarded mediation was successful, but ready ad network can't show ad or
    /// ad presentation was too frequent according to your placement settings
    ///
    /// - Parameter error: Error object that indicates error reason
    func rewardedVideoDidFailToPresentWithError(_ error: Error) {
        
    }

    /// Method called after rewarded video start displaying
    func rewardedVideoDidPresent() {
        
    }
    
    /*!
     *  Method called before rewarded video leaves screen
     *  @param wasFullyWatched boolean flag indicated that user watch video fully
     */
    
    
    /// Method called before rewarded video leaves screen
    ///
    /// - Parameter wasFullyWatched: boolean flag indicated that user watch video fully
    func rewardedVideoWillDismissAndWasFullyWatched(_ wasFullyWatched: Bool) {
        
    }

    ///  Method called after fully watch of video
    ///
    /// - Warning: After call this method rewarded video can stay on screen and show postbanner
    /// - Parameters:
    ///   - rewardAmount: Amount of app curency tuned via Appodeal Dashboard
    ///   - rewardName: Name of app curency tuned via Appodeal Dashboard
    func rewardedVideoDidFinish(_ rewardAmount: UInt, name rewardName: String?) {
        
    }
}
