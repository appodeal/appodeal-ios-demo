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
        guard
            let placement = placementField.text,
            Appodeal.isInitalized(for: .rewardedVideo),
            Appodeal.canShow(.rewardedVideo, forPlacement: placement)
        else {
            return
        }
        Appodeal.showAd(.rewardedVideo,
                        forPlacement: placement,
                        rootViewController: self)
    }
}

extension RewardedVideoViewController: AppodealRewardedVideoDelegate {
    func rewardedVideoDidLoadAdIsPrecache(_ precache: Bool) {}
    func rewardedVideoDidFailToLoadAd() {}
    func rewardedVideoDidFailToPresentWithError(_ error: Error) {}
    func rewardedVideoDidPresent() {}
    func rewardedVideoWillDismissAndWasFullyWatched(_ wasFullyWatched: Bool) {}
    func rewardedVideoDidFinish(_ rewardAmount: float_t, name rewardName: String?) {}
}
