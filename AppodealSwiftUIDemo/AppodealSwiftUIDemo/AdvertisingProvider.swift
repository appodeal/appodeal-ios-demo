//
//  AdvertisingProvider.swift
//  AppodealSwiftUIDemo
//
//  Created by Stas Kochkin on 02.03.2020.
//  Copyright © 2020 com.appodeal. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import Appodeal
import StackConsentManager



/// Advertising interface that provides published state
/// which can be used in SwiftUI
final class AdvertisingProvider: NSObject, ObservableObject {
    // MARK: Types and definitions
    private typealias SynchroniseConsentCompletion = () -> Void
    
    /// Constants
    private struct AppodealConstants {
        static let key: String = "dee74c5129f53fc629a44a690a02296694e3eef99f2d3a5f"
        static let adTypes: AppodealAdType = [.interstitial, .rewardedVideo, .banner, .nativeAd]
        static let logLevel: APDLogLevel = .debug
        static let testMode: Bool = true
        static let placement: String = "default"
    }
    
    /// APDBannerView SwiftUI interface
    struct Banner: UIViewRepresentable {
        typealias UIViewType = APDBannerView
        
        func makeUIView(context: UIViewRepresentableContext<Banner>) -> APDBannerView {
            // Use shared banner view to
            return AdvertisingProvider.shared.bannerView
        }
        
        func updateUIView(_ uiView: APDBannerView, context: UIViewRepresentableContext<Banner>) {
            uiView.rootViewController = UIApplication.shared.rootViewController
        }
    }
    
    /// Native view SwiftUI interface
    struct Native: UIViewRepresentable {
        let ad: APDNativeAd
        
        func makeUIView(context: UIViewRepresentableContext<Native>) -> NativeView {
            guard
                let viewController = UIApplication.shared.rootViewController,
                let uiView = uiView(for: viewController)
            else {
                return NativeView()
            }
            return uiView
        }

        func updateUIView(_ uiView: NativeView, context: UIViewRepresentableContext<Native>) {}
        
        private func uiView(for viewController: UIViewController) -> NativeView? {
            return try? ad.getViewForPlacement(
                AdvertisingProvider.AppodealConstants.placement,
                withRootViewController: viewController
            ) as? NativeView
        }
    }
    
    // MARK: Stored properties
    /// Singleton object of provider
    static let shared: AdvertisingProvider = AdvertisingProvider()
    
    private var synchroniseConsentCompletion: SynchroniseConsentCompletion?
    
    let bannerHeight: CGFloat = {
        UIDevice.current.userInterfaceIdiom == .pad ? kAPDAdSize728x90.height : kAPDAdSize320x50.height
    }()
    
    fileprivate lazy var bannerView: APDBannerView = {
        // CHo
        let adSize = UIDevice.current.userInterfaceIdiom == .pad ?
            kAPDAdSize728x90 :
            kAPDAdSize320x50
        
        let banner = APDBannerView(
            size:  adSize,
            rootViewController: UIApplication.shared.rootViewController ?? UIViewController()
        )
        
        banner.frame = CGRect(
            x: 0,
            y: 0,
            width: adSize.width,
            height: adSize.height
        )
        
        banner.delegate = self
        
        return banner
    }()
    
    
    // MARK: Published properties
    @Published var isAdInitialised     = false
    @Published var isBannerReady       = false
    @Published var isInterstitialReady = false
    @Published var isRewardedReady     = false
    
    // MARK: Public methods
    func initialize() {
        synchroniseConsent { [weak self] in
            self?.initializeAppodeaSDK()
        }
    }
    
    func presentInterstitial() {
        defer { isInterstitialReady = false }
        guard
            Appodeal.canShow(.interstitial, forPlacement: AppodealConstants.placement),
            let viewController = UIApplication.shared.rootViewController
        else { return }
        Appodeal.showAd(.interstitial,
                        forPlacement: AppodealConstants.placement,
                        rootViewController: viewController)
    }
    
    func presentRewarded() {
        defer { isRewardedReady = false }
        guard
            Appodeal.canShow(.rewardedVideo, forPlacement: AppodealConstants.placement),
            let viewController = UIApplication.shared.rootViewController
        else { return }
        Appodeal.showAd(.rewardedVideo,
                        forPlacement: AppodealConstants.placement,
                        rootViewController: viewController)
    }
    
    // MARK: Private methods
    private func initializeAppodeaSDK() {
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
        // Disable autocache for banner and native ad
        // we will cache it manually
        Appodeal.setAutocache(false, types: [.banner, .nativeAd])
        // Set delegates
        Appodeal.setInterstitialDelegate(self)
        Appodeal.setRewardedVideoDelegate(self)
        
        let consent = STKConsentManager.shared().consentStatus != .nonPersonalized
        Appodeal.initialize(
            withApiKey: AppodealConstants.key,
            types: AppodealConstants.adTypes,
            hasConsent: consent
        )
        
        // Trigger banner cache
        // It can be done after any moment after Appodeal initialisation
        bannerView.loadAd()
        
        self.isAdInitialised = true
    }
    
    private func synchroniseConsent(completion: SynchroniseConsentCompletion?) {
        STKConsentManager.shared().synchronize(withAppKey: AppodealConstants.key) { error in
            error.map { print("Error while synchronising consent manager: \($0)") }
            guard STKConsentManager.shared().shouldShowConsentDialog == .true else {
                completion?()
                return
            }
            
            STKConsentManager.shared().loadConsentDialog { [weak self] error in
                error.map { print("Error while loading consent dialog: \($0)") }
                guard let controller = UIApplication.shared.rootViewController,
                    STKConsentManager.shared().isConsentDialogReady
                    else {
                        completion?()
                        return
                }
                
                self?.synchroniseConsentCompletion = completion
                STKConsentManager.shared().showConsentDialog(
                    fromRootViewController: controller,
                    delegate: self
                )
            }
        }
    }
}

// MARK: Protocols implementations
extension AdvertisingProvider: APDBannerViewDelegate {
    func bannerViewDidLoadAd(_ bannerView: APDBannerView,
                             isPrecache precache: Bool) {
        isBannerReady = true
    }
    
    func bannerView(_ bannerView: APDBannerView,
                    didFailToLoadAdWithError error: Error) {
        isBannerReady = false
    }
}


extension AdvertisingProvider: AppodealInterstitialDelegate {
    func interstitialDidLoadAdIsPrecache(_ precache: Bool) {
        isInterstitialReady = true
    }
    
    func interstitialDidFailToLoadAd() {
        isInterstitialReady = false
    }
    
    func interstitialDidExpired() {
        isInterstitialReady = false
    }
}


extension AdvertisingProvider: AppodealRewardedVideoDelegate {
    func rewardedVideoDidLoadAdIsPrecache(_ precache: Bool) {
        isRewardedReady = true
    }
    
    func rewardedVideoDidFailToLoadAd() {
        isRewardedReady = false
    }
    
    func rewardedVideoDidExpired() {
        isRewardedReady = false
    }
}


extension AdvertisingProvider: STKConsentManagerDisplayDelegate {
    func consentManager(_ consentManager: STKConsentManager, didFailToPresent error: Error) {
        synchroniseConsentCompletion?()
    }
    
    func consentManagerDidDismissDialog(_ consentManager: STKConsentManager) {
        synchroniseConsentCompletion?()
    }
    
    // No-op
    func consentManagerWillShowDialog(_ consentManager: STKConsentManager) {}
}
