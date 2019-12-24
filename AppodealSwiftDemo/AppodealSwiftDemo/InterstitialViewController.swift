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
        guard
            let placement = placementField.text,
            Appodeal.isInitalized(for: .interstitial),
            Appodeal.canShow(.interstitial, forPlacement: placement)
        else {
            return
        }
        Appodeal.showAd(.interstitial,
                        forPlacement: placement,
                        rootViewController: self)
    }
}

extension InterstitialViewController: AppodealInterstitialDelegate {
    func interstitialDidLoadAdIsPrecache(_ precache: Bool) {}
    func interstitialDidFailToLoadAd() {}
    func interstitialDidFailToPresent() {}
    func interstitialWillPresent() {}
    func interstitialDidDismiss() {}
    func interstitialDidClick() {}
}
