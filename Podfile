platform :ios, '12.4'
workspace 'AppodealDemo.xcworkspace'

source 'https://github.com/appodeal/CocoaPods.git'
source "https://github.com/bidon-io/CocoaPods_Specs.git"
source 'https://cdn.cocoapods.org/'

install! 'cocoapods', 
  :deterministic_uuids => false,
  :warn_for_multiple_pod_sources => false

use_frameworks!

def appodeal
  pod 'Appodeal', '3.3.0-beta.4'
  pod 'APDAdjustAdapter', '3.3.0.0-beta.4'
  pod 'APDAmazonAdapter', '3.3.0.0-beta.4'
  pod 'APDAppLovinAdapter', '3.3.0.0-beta.4'
  pod 'APDAppLovinMAXAdapter', '3.3.0.0-beta.4'
  pod 'APDAppsFlyerAdapter', '3.3.0.0-beta.4'
  pod 'APDBidMachineAdapter', '3.3.0.0-beta.4'
  pod 'APDBidonAdapter', '3.3.0.0-beta.4'
  pod 'APDBigoAdsAdapter', '3.3.0.0-beta.4'
  pod 'APDDTExchangeAdapter', '3.3.0.0-beta.4'
  pod 'APDFacebookAdapter', '3.3.0.0-beta.4'
  pod 'APDFirebaseAdapter', '3.3.0.0-beta.4'
  pod 'APDGoogleAdMobAdapter', '3.3.0.0-beta.4'
  pod 'APDIABAdapter', '3.3.0.0-beta.4'
  pod 'APDInMobiAdapter', '3.3.0.0-beta.4'
  pod 'APDIronSourceAdapter', '3.3.0.0-beta.4'
  pod 'APDMetaAudienceNetworkAdapter', '3.3.0.0-beta.4'
  pod 'APDMintegralAdapter', '3.3.0.0-beta.4'
  pod 'APDMyTargetAdapter', '3.3.0.0-beta.4'
  pod 'APDPangleAdapter', '3.3.0.0-beta.4'
  pod 'APDSentryAdapter', '3.3.0.0-beta.4'
  pod 'APDSmaatoAdapter', '3.3.0.0-beta.4'
  pod 'APDUnityAdapter', '3.3.0.0-beta.4'
  pod 'APDVungleAdapter', '3.3.0.0-beta.4'
  pod 'APDYandexAdapter', '3.3.0.0-beta.4'
  pod 'AppLovinMediationAmazonAdMarketplaceAdapter'
  pod 'AppLovinMediationBidMachineAdapter'
  pod 'AppLovinMediationFacebookAdapter'
  pod 'AppLovinMediationFyberAdapter'
  pod 'AppLovinMediationGoogleAdManagerAdapter'
  pod 'AppLovinMediationGoogleAdapter'
  pod 'AppLovinMediationInMobiAdapter'
  pod 'AppLovinMediationIronSourceAdapter'
  pod 'AppLovinMediationMintegralAdapter', '7.6.1.0.0'
  pod 'AppLovinMediationMyTargetAdapter', '5.20.1.1'
  pod 'AppLovinMediationUnityAdsAdapter'
  pod 'AppLovinMediationVungleAdapter', '7.3.0.0'
  pod 'AppLovinMediationYandexAdapter', '5.2.1.0'
  pod 'BidMachineAmazonAdapter', '2.6.0.1'
  pod 'BidMachineMetaAudienceAdapter', '2.6.0.0'
  pod 'BidMachineMintegralAdapter', '2.6.0.0'
  pod 'BidMachineMyTargetAdapter', '2.6.0.0'
  pod 'BidMachinePangleAdapter', '2.6.0.0'
  pod 'BidMachineSmaatoAdapter', '2.6.0.0'
  pod 'BidMachineVungleAdapter', '2.6.0.0'
  pod 'BidonAdapterAmazon', '0.4.8.0'
  pod 'BidonAdapterAppLovin', '0.4.8.0'
  pod 'BidonAdapterBidMachine', '0.4.8.0'
  pod 'BidonAdapterBigoAds', '0.4.8.0'
  pod 'BidonAdapterDTExchange', '0.4.8.0'
  pod 'BidonAdapterGoogleAdManager', '0.4.8.0'
  pod 'BidonAdapterGoogleMobileAds', '0.4.8.0'
  pod 'BidonAdapterInMobi', '0.4.8.0'
  pod 'BidonAdapterMetaAudienceNetwork', '0.4.8.0'
  pod 'BidonAdapterMintegral', '0.4.8.0'
  pod 'BidonAdapterUnityAds', '0.4.8.0'
  pod 'BidonAdapterVungle', '0.4.8.0'
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
