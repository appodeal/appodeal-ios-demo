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
        /// In case you don't use storyboards, you need to create and place subviews programmatically, then set the delegate
        // bannerView = AppodealBannerView(size: bannerSize, rootViewController: self)
        // view.addSubview(bannerView)
        // bannerView.setDelegate(self)
    
        /// Configure banner ads appearance
        // bannerView.backgroundVisible = true
        // bannerView.usesSmartSizing = true
        // bannerViewHeightConstraint.constant = bannerSize.height

        let bannerSize = kIsTablet ? kAPDAdSize728x90 : kAPDAdSize320x50
        bannerView.adSize = bannerSize
        bannerView.loadAd()
    }
}


extension CustomBannerViewController: AppodealBannerViewDelegate {
    func bannerViewDidLoadAd(_ bannerView: APDBannerView, isPrecache precache: Bool) {}
    func bannerView(_ bannerView: APDBannerView, didFailToLoadAdWithError error: Error) {}
    func bannerViewDidInteract(_ bannerView: APDBannerView) {}
    func bannerViewDidShow(_ bannerView: APDBannerView) {}
}
