//
//  StaticBannerViewController.swift
//  AppodealSwiftDemo
//
//  Copyright © 2017 appodeal. All rights reserved.
//

import Appodeal
import UIKit


class StaticBannerViewController: RootViewController {
    @IBOutlet weak var placementField: UITextField!
    
    // MARK: Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        /// Configure banner ads appearance
        // Appodeal.setSmartBannersEnabled(true)
        // Appodeal.setBannerAnimationEnabled(true)
        // Appodeal.setBannerBackgroundVisible(true)
        Appodeal.setBannerDelegate(self)
    }
    
    // MARK: Actions
    @IBAction func bannerTopButtonPressed(_ sender: UIButton) {
        guard
            let placement = placementField.text,
            Appodeal.isInitalized(for: . banner),
            Appodeal.canShow(.banner, forPlacement: placement)
        else {
            return
        }
        Appodeal.showAd(.bannerTop,
                        forPlacement: placement,
                        rootViewController: self)
    }
    
    @IBAction func bannerBottomButtonPressed(_ sender: UIButton) {
        guard
            let placement = placementField.text,
            Appodeal.isInitalized(for: . banner),
            Appodeal.canShow(.banner, forPlacement: placement)
        else {
            return
        }
        Appodeal.showAd(.bannerBottom,
                        forPlacement: placement,
                        rootViewController: self)
    }
}


extension StaticBannerViewController: AppodealBannerDelegate {
    func bannerDidLoadAdIsPrecache(_ precache: Bool) {}
    func bannerDidFailToLoadAd() {}
    func bannerDidClick() {}
    func bannerDidShow() {}
}
