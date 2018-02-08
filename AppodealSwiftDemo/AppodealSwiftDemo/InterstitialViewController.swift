//
//  InterstitialViewController.swift
//  AppodealSwiftDemo
//
//  Copyright © 2017 appodeal. All rights reserved.
//

import Appodeal
import UIKit

class InterstitialViewController: RootViewController {

    @IBOutlet weak var placementField: UITextField!
    
    // MARK: Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Appodeal.setInterstitialDelegate(self)
    }
    
    // MARK: Actions
    
    @IBAction func showButtonPressed(_ sender: UIButton) {
        guard let placement = placementField.text else {
            return
        }
        if Appodeal.canShowAd(.interstitial, forPlacement: placement) {
            Appodeal.showAd(.interstitial, forPlacement: placement, rootViewController: self)
        }
    }
    
}

extension InterstitialViewController: AppodealInterstitialDelegate {
    
    /// Method called when precache (cheap and fast load) or usual interstitial view did load
    ///
    /// - Warning: If you want show only expensive ad, ignore this callback call with precache equal to YES
    /// - Parameter precache: If precache is YES it's mean that precache loaded
    func interstitialDidLoadAdIsPrecache(_ precache: Bool) {
        
    }

    /// Method called if interstitial mediation failed
    func interstitialDidFailToLoadAd() {
        
    }
    
    /// Method called if interstitial mediation was success, but ready ad network can't show ad or
    /// ad presentation was to frequently according your placement settings
    func interstitialDidFailToPresent() {
        
    }
    
    /// Method called when interstitial will display on screen
    func interstitialWillPresent() {
        
    }

    /// Method called after interstitial leave screeen
    func interstitialDidDismiss() {
        
    }

    /// Method called when user tap on interstitial
    func interstitialDidClick() {
        
    }
    
}
