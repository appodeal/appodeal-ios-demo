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
  pod 'Appodeal', '3.3.2'
  pod 'APDAdjustAdapter', '3.3.2.0'
  pod 'APDAmazonAdapter', '3.3.2.0'
  pod 'APDAppLovinAdapter', '3.3.2.0'
  pod 'APDAppLovinMAXAdapter', '3.3.2.0'
  pod 'APDAppsFlyerAdapter', '3.3.2.0'
  pod 'APDBidMachineAdapter', '3.3.2.0'
  pod 'APDBidonAdapter', '3.3.2.0'
  pod 'APDBigoAdsAdapter', '3.3.2.0'
  pod 'APDDTExchangeAdapter', '3.3.2.0'
  pod 'APDFacebookAdapter', '3.3.2.0'
  pod 'APDFirebaseAdapter', '3.3.2.0'
  pod 'APDGoogleAdMobAdapter', '3.3.2.0'
  pod 'APDIABAdapter', '3.3.2.0'
  pod 'APDInMobiAdapter', '3.3.2.0'
  pod 'APDIronSourceAdapter', '3.3.2.0'
  pod 'APDMetaAudienceNetworkAdapter', '3.3.2.0'
  pod 'APDMintegralAdapter', '3.3.2.0'
  pod 'APDMyTargetAdapter', '3.3.2.0'
  pod 'APDPangleAdapter', '3.3.2.0'
  pod 'APDSentryAdapter', '3.3.2.0'
  pod 'APDSmaatoAdapter', '3.3.2.0'
  pod 'APDUnityAdapter', '3.3.2.0'
  pod 'APDVungleAdapter', '3.3.2.0'
  pod 'APDYandexAdapter', '3.3.2.0'
  pod 'AmazonPublisherServicesSDK', '4.9.2'
  pod 'AppLovinMediationAmazonAdMarketplaceAdapter'
  pod 'AppLovinMediationBidMachineAdapter'
  pod 'AppLovinMediationFacebookAdapter'
  pod 'AppLovinMediationFyberAdapter'
  pod 'AppLovinMediationGoogleAdManagerAdapter'
  pod 'AppLovinMediationGoogleAdapter'
  pod 'AppLovinMediationInMobiAdapter'
  pod 'AppLovinMediationIronSourceAdapter'
  pod 'AppLovinMediationMintegralAdapter'
  pod 'AppLovinMediationMyTargetAdapter'
  pod 'AppLovinMediationUnityAdsAdapter'
  pod 'AppLovinMediationVungleAdapter'
  pod 'AppLovinMediationYandexAdapter'
  pod 'BidMachineAmazonAdapter'
  pod 'BidMachineMetaAudienceAdapter', '2.6.0.0'
  pod 'BidMachineMintegralAdapter', '2.6.0.0'
  pod 'BidMachineMyTargetAdapter', '2.6.0.0'
  pod 'BidMachinePangleAdapter', '2.6.0.0'
  pod 'BidMachineSmaatoAdapter', '2.6.0.0'
  pod 'BidMachineVungleAdapter', '2.6.0.0'
  pod 'BidonAdapterAmazon', '0.6.0.0'
  pod 'BidonAdapterAppLovin', '0.6.0.0'
  pod 'BidonAdapterBidMachine', '0.6.0.0'
  pod 'BidonAdapterBigoAds', '0.6.0.0'
  pod 'BidonAdapterDTExchange', '0.6.0.0'
  pod 'BidonAdapterGoogleAdManager', '0.6.0.0'
  pod 'BidonAdapterGoogleMobileAds', '0.6.0.0'
  pod 'BidonAdapterInMobi', '0.6.0.0'
  pod 'BidonAdapterMetaAudienceNetwork', '0.6.0.0'
  pod 'BidonAdapterMintegral', '0.6.0.0'
  pod 'BidonAdapterUnityAds', '0.6.0.0'
  pod 'BidonAdapterVungle', '0.6.0.0'
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
