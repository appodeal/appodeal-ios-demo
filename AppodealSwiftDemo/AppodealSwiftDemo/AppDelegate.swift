//
//  AppDelegate.swift
//  AppodealSwiftDemo
//
//  Copyright © 2017 appodeal. All rights reserved.
//

let kAPP_KEY = "dee74c5129f53fc629a44a690a02296694e3eef99f2d3a5f"

import Appodeal
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // MARK: Controller Life Cycle
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        initializeAppodealSDK()
        configureAppearance()
        
        return true
    }
    
    // MARK: Appodeal Initialization
    
    func initializeAppodealSDK() {
//        ~~> Custom settings <~~
//        Appodeal.setFramework(.native)
//        Appodeal.setPluginVersion("1.1.1")
//            
//        ~~> Test Mode <~~
//        Appodeal.setTestingEnabled(true)
//                
//        ~~> User Data <~~
//        Appodeal.setUserId("userID")
//        Appodeal.setUserEmail("user@email.com")
//        Appodeal.setUserBirthday(Date())
//        Appodeal.setUserAge(25)
//        Appodeal.setUserGender(.male)
//        Appodeal.setUserOccupation(.work)
//        Appodeal.setUserRelationship(.searching)
//        Appodeal.setUserSmokingAttitude(.neutral)
//        Appodeal.setUserAlcoholAttitude(.neutral)
//        Appodeal.setUserInterests("skydiving, meditation")
        
        
        let adTypes: AppodealAdType = [.interstitial, .rewardedVideo, .banner, .nativeAd]
        Appodeal.setLogLevel(.off)
        Appodeal.setAutocache(true, types: adTypes)
        Appodeal.initialize(withApiKey: kAPP_KEY, types: adTypes)
    }
    
    // MARK: Config
    
    func configureAppearance() {
        let navBarAttributes = [NSForegroundColorAttributeName: UIColor.clear]
        
        UINavigationBar.appearance().tintColor = .white
        
        UIBarButtonItem.appearance().setTitleTextAttributes(navBarAttributes, for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes(navBarAttributes, for: .highlighted)
        
        if #available(iOS 10.0, *) {
            UITabBar.appearance().unselectedItemTintColor = .lightGray
        }
        UITabBar.appearance().tintColor = .white
    }
}

