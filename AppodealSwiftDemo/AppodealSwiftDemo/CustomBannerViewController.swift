//
//  CustomBannerViewController.swift
//  AppodealSwiftDemo
//
//  Copyright © 2017 appodeal. All rights reserved.
//

let kIsTablet = (UIDevice.current.userInterfaceIdiom == .pad)

import Appodeal
import UIKit

class CustomBannerViewController: RootViewController {

    @IBOutlet weak var bannerView: APDBannerView!
    @IBOutlet weak var bannerViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    // MARK: Setup
    
    func setup() {
        
//        ~~> In case you don't use storyboards, you need to create and place subviews programmatically, then set the delegate <~~
        
//        bannerView = AppodealBannerView(size: bannerSize, rootViewController: self)
//        view.addSubview(bannerView)
//        bannerView.setDelegate(self)
        
        
//        ~~> Custom Settings <~~
        
//        bannerView.backgroundVisible = true
//        bannerView.usesSmartSizing = true
        
        var bannerSize = kAPDAdSize320x50
        if kIsTablet {
            bannerSize = kAPDAdSize728x90
        }
        
        bannerView.adSize = bannerSize
//        bannerViewHeightConstraint.constant = bannerSize.height
        
        bannerView.loadAd()
    }

}

extension CustomBannerViewController: AppodealBannerViewDelegate {

    /// Method called when banner did load firstly, after refresh this method not call
    ///
    /// - Parameters:
    ///   - bannerView: ready to show banner
    ///   - precache: is precache
    func bannerViewDidLoadAd(_ bannerView: APDBannerView, isPrecache precache: Bool) {
        
    }
    
    /// Method called in case that banner mediation failed
    ///
    /// - Parameters:
    ///   - bannerView: failed banner view
    ///   - error: Error occured while mediation
    func bannerView(_ bannerView: APDBannerView, didFailToLoadAdWithError error: Error) {
        
    }

    /// Called when user tap on banner
    ///
    /// - Parameter bannerView: banner view
    func bannerViewDidInteract(_ bannerView: APDBannerView) {
        
    }
    
    
    /// Method called after any banner was show
    ///
    /// - Parameter bannerView: on screen banner view
    func bannerViewDidShow(_ bannerView: APDBannerView) {
        
    }
}
