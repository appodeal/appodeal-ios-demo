//
//  AppDelegate.swift
//  AppodealSwiftDemo
//
//  Copyright © 2017 appodeal. All rights reserved.
//


import Appodeal
import UIKit
import ASGDPR


struct Constants {
    static let appKey = "dee74c5129f53fc629a44a690a02296694e3eef99f2d3a5f"
    static let publisherId = "pub-0123456789012345"
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    // MARK: Controller Life Cycle
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initializeAppodealSDK()
        configureAppearance()
        
        return true
    }
    
    // MARK: Appodeal Initialization
    func initializeAppodealSDK() {
        /// Custom settings
        // Appodeal.setFramework(.native, version: "1.0.0")
        // Appodeal.setTriggerPrecacheCallbacks(true)
        // Appodeal.setLocationTracking(true)
        
        /// Test Mode
        // Appodeal.setTestingEnabled(true)
        
        /// User Data
        // Appodeal.setUserId("userID")
        // Appodeal.setUserAge(25)
        // Appodeal.setUserGender(.male)
        Appodeal.setLogLevel(.debug)
        let adTypes: AppodealAdType = [.interstitial, .rewardedVideo, .banner, .nativeAd]
        Appodeal.setAutocache(true, types: adTypes)
        
        // Google mobile ads publisher id from https://developers.google.com/admob/ios/eu-consent
        // you need to replace this value with your publisher id
        let publisherIds = [Constants.publisherId]
        ASGDPR.presentConsentDialog(forPublisherIds: publisherIds) { (status) in
            let consent = status != .notPersonalized
            Appodeal.initialize(withApiKey: Constants.appKey,
                                types: adTypes,
                                hasConsent: consent)
        }
    }
    
    // MARK: Appearance
    func configureAppearance() {
        let navBarAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
        
        UINavigationBar.appearance().tintColor = .white
        UIBarButtonItem.appearance().setTitleTextAttributes(navBarAttributes, for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes(navBarAttributes, for: .highlighted)
        
        UITabBar.appearance().tintColor = .white
        if #available(iOS 10.0, *) {
            UITabBar.appearance().unselectedItemTintColor = .lightGray
        }
    }
}

