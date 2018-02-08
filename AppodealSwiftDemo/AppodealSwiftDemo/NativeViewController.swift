//
//  NativeViewController.swift
//  AppodealSwiftDemo
//
//  Copyright © 2017 appodeal. All rights reserved.
//

import UIKit
import Appodeal

class NativeViewController: UIViewController {
    
    @IBOutlet weak var nativeAdContainer: UIView!
    
    var nativeAdStack : [APDNativeAd]?
    
    
    lazy var nativeAdQueue : APDNativeAdQueue = {
        return APDNativeAdQueue(sdk: nil,
                                settings: self.nativeAdSettings,
                                delegate: self,
                                autocache: true)
    }()
    
    var nativeAdSettings: APDNativeAdSettings! {
        get {
            let instance = APDNativeAdSettings()
            instance.adViewClass = NativeView.self
            return instance;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nativeAdQueue.loadAd()
    }
    
    func presentNative() {
        let nativeAd : APDNativeAd! = nativeAdStack?.first!
        let nativeAdView = nativeAd .getViewFor(self)
        nativeAdContainer.addSubview(nativeAdView)
        nativeAdView.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint .activate([NSLayoutConstraint.init(item: nativeAdView,
                                                              attribute: .top,
                                                              relatedBy: .equal,
                                                              toItem: nativeAdContainer,
                                                              attribute: .top,
                                                              multiplier: 1.0,
                                                              constant: 0),
                                      NSLayoutConstraint.init(item: nativeAdView,
                                                              attribute: .leading,
                                                              relatedBy: .equal,
                                                              toItem: nativeAdContainer,
                                                              attribute: .leading,
                                                              multiplier: 1.0,
                                                              constant: 0),
                                      NSLayoutConstraint.init(item: nativeAdView,
                                                              attribute: .bottom,
                                                              relatedBy: .equal,
                                                              toItem: nativeAdContainer,
                                                              attribute: .bottom,
                                                              multiplier: 1.0,
                                                              constant: 0),
                                      NSLayoutConstraint.init(item: nativeAdView,
                                                              attribute: .trailing,
                                                              relatedBy: .equal,
                                                              toItem: nativeAdContainer,
                                                              attribute: .trailing,
                                                              multiplier: 1.0,
                                                              constant: 0)])
    }
    
}

extension NativeViewController : APDNativeAdQueueDelegate {
    
    /// Method called when loader receives native ad.
    ///
    /// - Parameters:
    ///   - adQueue: ad queue object
    ///   - count: count of available native ad
    func adQueueAdIsAvailable(_ adQueue: APDNativeAdQueue, ofCount count: UInt) {
        guard nativeAdStack?.count != nil else {
            nativeAdStack = nativeAdQueue.getNativeAds(ofCount: 1)
            presentNative()
            return
        }
    }

    /// Method called when loader fails to receive native ad.
    ///
    /// - Parameters:
    ///   - adQueue: ad queue object
    ///   - error: Error occurred
    func adQueue(_ adQueue: APDNativeAdQueue, failedWithError error: Error) {
         
    }
    
}
