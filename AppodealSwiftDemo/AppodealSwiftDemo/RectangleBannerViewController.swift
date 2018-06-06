//
//  RectangleBannerViewController.swift
//  AppodealSwiftDemo
//
//  Copyright © 2017 appodeal. All rights reserved.
//

import Appodeal
import UIKit

class RectangleBannerViewController: RootViewController {

    @IBOutlet weak var bannerView: AppodealMRECView!
    
    // MARK: Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        ~~> In case you don't use storyboards, you need to create and place subviews programmatically, then set the delegate <~~
//        
//        bannerView = AppodealMRECView(rootViewController: self)
//        view.addSubview(bannerView)
//        bannerView.setDelegate(self)
        
        bannerView.loadAd()
    }

}

extension RectangleBannerViewController: AppodealBannerViewDelegate {
    
    /**
     *  Method called when banner did load firstly, after refresh this method not call
     *
     *  @param bannerView Nonnul, ready to show banner
     */
    func bannerViewDidLoadAd(_ bannerView: APDBannerView!) {
        
    }
    
    /**
     *  Method called in case that banner mediation failed
     *
     *  @param bannerView Nonnul failed banner view
     *  @param error      Error occured while mediation
     */
    func bannerView(_ bannerView: APDBannerView!, didFailToLoadAdWithError error: Error!) {
        
    }
    
    /**
     *  Method called when user tap on banner
     *
     *  @param bannerView Nonnul banner view
     */
    func bannerViewDidInteract(_ bannerView: APDBannerView!) {
        
    }
    
    /*!
     *  Method called after any banner was show
     *
     *  @param bannerView On screen banner view
     */
    func bannerViewDidShow(_ bannerView: APDBannerView!) {
        
    }
    
}
