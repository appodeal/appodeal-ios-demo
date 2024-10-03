platform :ios, '13.0'
workspace 'AppodealDemo.xcworkspace'

source 'https://github.com/appodeal/CocoaPods.git'
source "https://github.com/bidon-io/CocoaPods_Specs.git"
source 'https://cdn.cocoapods.org/'

install! 'cocoapods',
  :deterministic_uuids => false,
  :warn_for_multiple_pod_sources => false

use_frameworks!

def appodeal
  pod 'Appodeal', '3.4.0-beta.1'
  pod 'APDAdjustAdapter', '3.4.0.0-beta.1'
  pod 'APDAmazonAdapter', '3.4.0.0-beta.1'
  pod 'APDAppLovinAdapter', '3.4.0.0-beta.1'
  pod 'APDAppLovinMAXAdapter', '3.4.0.0-beta.1'
  pod 'APDAppsFlyerAdapter', '3.4.0.0-beta.1'
  pod 'APDBidMachineAdapter', '3.4.0.0-beta.1'
  pod 'APDBidonAdapter', '3.4.0.0-beta.1'
  pod 'APDBigoAdsAdapter', '3.4.0.0-beta.1'
  pod 'APDDTExchangeAdapter', '3.4.0.0-beta.1'
  pod 'APDFacebookAdapter', '3.4.0.0-beta.1'
  pod 'APDFirebaseAdapter', '3.4.0.0-beta.1'
  pod 'APDGoogleAdMobAdapter', '3.4.0.0-beta.1'
  pod 'APDIABAdapter', '3.4.0.0-beta.1'
  pod 'APDInMobiAdapter', '3.4.0.0-beta.1'
  pod 'APDIronSourceAdapter', '3.4.0.0-beta.1'
  pod 'APDMetaAudienceNetworkAdapter', '3.4.0.0-beta.1'
  pod 'APDMintegralAdapter', '3.4.0.0-beta.1'
  pod 'APDMyTargetAdapter', '3.4.0.0-beta.1'
  pod 'APDPangleAdapter', '3.4.0.0-beta.1'
  pod 'APDSentryAdapter', '3.4.0.0-beta.1'
  pod 'APDSmaatoAdapter', '3.4.0.0-beta.1'
  pod 'APDUnityAdapter', '3.4.0.0-beta.1'
  pod 'APDVungleAdapter', '3.4.0.0-beta.1'
  pod 'APDYandexAdapter', '3.4.0.0-beta.1'
  pod 'AmazonPublisherServicesSDK', '4.9.7'
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
  pod 'BidMachineMetaAudienceAdapter', '3.0.1.0'
  pod 'BidMachineMintegralAdapter', '3.0.1.0'
  pod 'BidMachineMyTargetAdapter', '3.0.1.1'
  pod 'BidMachinePangleAdapter', '3.0.1.0'
  pod 'BidMachineSmaatoAdapter', '3.0.1.0'
  pod 'BidMachineVungleAdapter', '3.0.1.0'
  pod 'BidonAdapterAmazon', '0.7.0.0-beta.1'
  pod 'BidonAdapterAppLovin', '0.7.0.0-beta.1'
  pod 'BidonAdapterBidMachine', '0.7.0.0-beta.1'
  pod 'BidonAdapterBigoAds', '0.7.0.0-beta.1'
  pod 'BidonAdapterDTExchange', '0.7.0.0-beta.1'
  pod 'BidonAdapterGoogleAdManager', '0.7.0.0-beta.1'
  pod 'BidonAdapterGoogleMobileAds', '0.7.0.0-beta.1'
  pod 'BidonAdapterInMobi', '0.7.0.0-beta.1'
  pod 'BidonAdapterMetaAudienceNetwork', '0.7.0.0-beta.1'
  pod 'BidonAdapterMintegral', '0.7.0.0-beta.1'
  pod 'BidonAdapterUnityAds', '0.7.0.0-beta.1'
  pod 'BidonAdapterVungle', '0.7.0.0-beta.1'
  pod 'BidonAdapterMyTarget', '0.7.0.0-beta.1'
  pod 'BidonAdapterChartboost', '0.7.0.0-beta.1'
  pod 'BidonAdapterYandex', '0.7.0.0-beta.1'
  pod 'BidonAdapterIronSource', '0.7.0.0-beta.1'
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
