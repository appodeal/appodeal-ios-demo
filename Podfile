platform :ios, '12.4'
workspace 'AppodealDemo.xcworkspace'

source 'https://github.com/appodeal/CocoaPods.git'
source 'https://cdn.cocoapods.org/'

install! 'cocoapods', 
  :deterministic_uuids => false,
  :warn_for_multiple_pod_sources => false

use_frameworks!

def appodeal
    pod 'Appodeal', '3.3.0-beta.3'
    pod 'APDAdjustAdapter', '3.3.0.0-beta.3'
    pod 'APDAmazonAdapter', '3.3.0.0-beta.3'
    pod 'APDAppLovinAdapter', '3.3.0.0-beta.3'
    pod 'APDAppLovinMAXAdapter', '3.3.0.0-beta.3'
    pod 'APDAppsFlyerAdapter', '3.3.0.0-beta.3'
    pod 'APDBidMachineAdapter', '3.3.0.0-beta.3'
    pod 'APDBidonAdapter', '3.3.0.0-beta.3'
    pod 'APDBigoAdsAdapter', '3.3.0.0-beta.3'
    pod 'APDCriteoAdapter', '3.3.0.0-beta.3'
    pod 'APDDTExchangeAdapter', '3.3.0.0-beta.3'
    pod 'APDFacebookAdapter', '3.3.0.0-beta.3'
    pod 'APDFirebaseAdapter', '3.3.0.0-beta.3'
    pod 'APDGoogleAdMobAdapter', '3.3.0.0-beta.3'
    pod 'APDIABAdapter', '3.3.0.0-beta.3'
    pod 'APDInMobiAdapter', '3.3.0.0-beta.3'
    pod 'APDIronSourceAdapter', '3.3.0.0-beta.3'
    pod 'APDMetaAudienceNetworkAdapter', '3.3.0.0-beta.3'
    pod 'APDMintegralAdapter', '3.3.0.0-beta.3'
    pod 'APDMyTargetAdapter', '3.3.0.0-beta.3'
    pod 'APDPangleAdapter', '3.3.0.0-beta.3'
    pod 'APDSentryAdapter', '3.3.0.0-beta.3'
    pod 'APDSmaatoAdapter', '3.3.0.0-beta.3'
    pod 'APDTapjoyAdapter', '3.3.0.0-beta.3'
    pod 'APDUnityAdapter', '3.3.0.0-beta.3'
    pod 'APDVungleAdapter', '3.3.0.0-beta.3'
    pod 'APDYandexAdapter', '3.3.0.0-beta.3'
    pod 'AppLovinMediationAmazonAdMarketplaceAdapter', '4.7.6.0'
    pod 'AppLovinMediationBidMachineAdapter', '2.4.0.1.0'
    pod 'AppLovinMediationFacebookAdapter', '6.12.0.3'
    pod 'AppLovinMediationFyberAdapter'
    pod 'AppLovinMediationGoogleAdManagerAdapter'
    pod 'AppLovinMediationGoogleAdapter'
    pod 'AppLovinMediationInMobiAdapter', '10.6.4.0'
    pod 'AppLovinMediationIronSourceAdapter'
    pod 'AppLovinMediationMintegralAdapter', '7.5.3.0.0'
    pod 'AppLovinMediationMyTargetAdapter', '5.20.1.1'
    pod 'AppLovinMediationUnityAdsAdapter'
    pod 'AppLovinMediationVungleAdapter', '7.2.0.0'
    pod 'AppLovinMediationYandexAdapter', '5.2.1.0'
    pod 'BidMachineAmazonAdapter', '2.4.0.0'
    pod 'BidMachineCriteoAdapter', '2.4.0.0'
    pod 'BidMachineMetaAudienceAdapter', '2.4.0.1'
    pod 'BidMachineMintegralAdapter', '2.4.0.1'
    pod 'BidMachineMyTargetAdapter', '2.4.0.2'
    pod 'BidMachinePangleAdapter', '2.4.0.0'
    pod 'BidMachineSmaatoAdapter', '2.4.0.0'
    pod 'BidMachineTapjoyAdapter', '2.4.0.0'
    pod 'BidMachineVungleAdapter', '2.4.0.1'
    pod 'BidonAdapterAmazon', '0.4.7.1'
    pod 'BidonAdapterAppLovin', '0.4.7.1'
    pod 'BidonAdapterBidMachine', '0.4.7.2'
    pod 'BidonAdapterBigoAds', '0.4.7.4'
    pod 'BidonAdapterDTExchange', '0.4.7.4'
    pod 'BidonAdapterGoogleAdManager', '0.4.7.1'
    pod 'BidonAdapterGoogleMobileAds', '0.4.7.1'
    pod 'BidonAdapterInMobi', '0.4.7.2'
    pod 'BidonAdapterMetaAudienceNetwork', '0.4.7.1'
    pod 'BidonAdapterMintegral', '0.4.7.2'
    pod 'BidonAdapterUnityAds', '0.4.7.2'
    pod 'BidonAdapterVungle', '0.4.7.2'
end

target 'AppodealSwiftDemo' do
  project 'AppodealSwiftDemo/AppodealSwiftDemo.xcodeproj'

  appodeal
end

target 'AppodealObjectiveCDemo' do
  project 'AppodealObjectiveCDemo/AppodealObjectiveCDemo.xcodeproj'
  appodeal
end

target 'AppodealSwiftUIDemo' do
  project 'AppodealSwiftUIDemo/AppodealSwiftUIDemo.xcodeproj'
  appodeal
end
