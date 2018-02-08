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
        
//        ~~> Custom Settings <~~
        
//        Appodeal.setSmartBannersEnabled(true)
//        Appodeal.setBannerAnimationEnabled(true)
//        Appodeal.setBannerBackgroundVisible(true)
        
        Appodeal.setBannerDelegate(self)
    }

    // MARK: Actions
    
    @IBAction func bannerTopButtonPressed(_ sender: UIButton) {
        guard let placement = placementField.text else {
            return
        }
        if Appodeal.canShowAd(.bannerTop, forPlacement: placement) {
            Appodeal.showAd(.bannerTop, forPlacement: placement, rootViewController: self)
        }
    }
    
    @IBAction func bannerBottomButtonPressed(_ sender: UIButton) {
        guard let placement = placementField.text else {
            return
        }
        if Appodeal.canShowAd(.bannerBottom, forPlacement: placement) {
            Appodeal.showAd(.bannerBottom, forPlacement: placement, rootViewController: self)
        }
    }
    
}

extension StaticBannerViewController: AppodealBannerDelegate {
    
    /// Method called when precache (cheap and fast load) or usual banner view did load
    ///
    /// - Parameter precache: If precache is YES it's mean that precache loaded
    func bannerDidLoadAdIsPrecache(_ precache: Bool) {
        
    }

    ///  Method called if banner mediation failed
    func bannerDidFailToLoadAd() {
        
    }
    
    /// Method called when user tap on banner
    func bannerDidClick() {
        
    }
    
    /// Method called when banner did show
    func bannerDidShow() {
        
    }
    
}
