//
//  AppDelegate.swift
//  AppodealSwiftDemo
//
//  Copyright © 2017 appodeal. All rights reserved.
//


import UIKit
import Appodeal
import StackConsentManager


@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    private struct AppodealConstants {
        static let key: String = "dee74c5129f53fc629a44a690a02296694e3eef99f2d3a5f"
        static let adTypes: AppodealAdType = [.interstitial, .rewardedVideo, .banner, .nativeAd]
        static let logLevel: APDLogLevel = .debug
        static let testMode: Bool = true
    }
    
    var window: UIWindow?
    
    // MARK: Controller Life Cycle
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        synchroniseConsent()
        configureAppearance()
        return true
    }
    
    // MARK: Appodeal Initialization
    private func initializeAppodealSDK() {
        /// Custom settings
        // Appodeal.setFramework(.native, version: "1.0.0")
        // Appodeal.setTriggerPrecacheCallbacks(true)
        // Appodeal.setLocationTracking(true)
        
        /// Test Mode
        Appodeal.setTestingEnabled(AppodealConstants.testMode)
        
        /// User Data
        // Appodeal.setUserId("userID")
        // Appodeal.setUserAge(25)
        // Appodeal.setUserGender(.male)
        Appodeal.setLogLevel(AppodealConstants.logLevel)
        Appodeal.setAutocache(true, types: AppodealConstants.adTypes)
        
        let consent = STKConsentManager.shared().consentStatus != .nonPersonalized
        Appodeal.initialize(
            withApiKey: AppodealConstants.key,
            types: AppodealConstants.adTypes,
            hasConsent: consent
        )
    }
    
    // MARK: Consent manager
    private func synchroniseConsent() {
        STKConsentManager.shared().synchronize(withAppKey: AppodealConstants.key) { error in
            error.map { print("Error while synchronising consent manager: \($0)") }
            guard STKConsentManager.shared().shouldShowConsentDialog == .true else {
                self.initializeAppodealSDK()
                return
            }
            
            STKConsentManager.shared().loadConsentDialog { [unowned self] error in
                error.map { print("Error while loading consent dialog: \($0)") }
                guard let controller = self.window?.rootViewController, STKConsentManager.shared().isConsentDialogReady else {
                    self.initializeAppodealSDK()
                    return
                }
                
                STKConsentManager.shared().showConsentDialog(fromRootViewController: controller,
                                                             delegate: self)
            }
        }
    }
    
    // MARK: Appearance
    private func configureAppearance() {
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


extension AppDelegate: STKConsentManagerDisplayDelegate {
    func consentManagerWillShowDialog(_ consentManager: STKConsentManager) {}
    
    func consentManager(_ consentManager: STKConsentManager, didFailToPresent error: Error) {
        initializeAppodealSDK()
    }
    
    func consentManagerDidDismissDialog(_ consentManager: STKConsentManager) {
        initializeAppodealSDK()
    }
}
