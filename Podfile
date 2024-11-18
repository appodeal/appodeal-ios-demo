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
  pod 'Appodeal', '3.4.0'
  pod 'APDAdjustAdapter', '3.4.0.0'
  pod 'APDAmazonAdapter', '3.4.0.0'
  pod 'APDAppLovinAdapter', '3.4.0.0'
  pod 'APDAppLovinMAXAdapter', '3.4.0.0'
  pod 'APDAppsFlyerAdapter', '3.4.0.0'
  pod 'APDBidMachineAdapter', '3.4.0.0'
  pod 'APDBidonAdapter', '3.4.0.0'
  pod 'APDBigoAdsAdapter', '3.4.0.0'
  pod 'APDDTExchangeAdapter', '3.4.0.0'
  pod 'APDFacebookAdapter', '3.4.0.0'
  pod 'APDFirebaseAdapter', '3.4.0.0'
  pod 'APDGoogleAdMobAdapter', '3.4.0.0'
  pod 'APDIABAdapter', '3.4.0.0'
  pod 'APDInMobiAdapter', '3.4.0.0'
  pod 'APDIronSourceAdapter', '3.4.0.0'
  pod 'APDMetaAudienceNetworkAdapter', '3.4.0.0'
  pod 'APDMintegralAdapter', '3.4.0.0'
  pod 'APDMyTargetAdapter', '3.4.0.0'
  pod 'APDPangleAdapter', '3.4.0.0'
  pod 'APDSentryAdapter', '3.4.0.0'
  pod 'APDUnityAdapter', '3.4.0.0'
  pod 'APDVungleAdapter', '3.4.0.0'
  pod 'APDYandexAdapter', '3.4.0.0'
  pod 'AmazonPublisherServicesSDK', '4.9.7'
  pod 'AppLovinMediationAmazonAdMarketplaceAdapter', '4.9.7.0'
  pod 'AppLovinMediationBidMachineAdapter', '3.0.1.0.0'
  pod 'AppLovinMediationFacebookAdapter', '6.15.2.1'
  pod 'AppLovinMediationFyberAdapter', '8.3.2.1'
  pod 'AppLovinMediationGoogleAdManagerAdapter', '11.9.0.1'
  pod 'AppLovinMediationGoogleAdapter', '11.9.0.1'
  pod 'AppLovinMediationInMobiAdapter', '10.7.5.1'
  pod 'AppLovinMediationIronSourceAdapter', '8.3.0.0.2'
  pod 'AppLovinMediationMintegralAdapter', '7.7.2.0.1'
  pod 'AppLovinMediationMyTargetAdapter', '5.21.8.0'
  pod 'AppLovinMediationUnityAdsAdapter', '4.12.2.1'
  pod 'AppLovinMediationVungleAdapter', '7.4.1.1'
  pod 'AppLovinMediationYandexAdapter', '5.2.1.0'
  pod 'BidMachineAmazonAdapter', '3.0.1.0'
  pod 'BidMachineMetaAudienceAdapter', '3.0.1.0'
  pod 'BidMachineMintegralAdapter', '3.0.1.0'
  pod 'BidMachineMyTargetAdapter', '3.0.1.1'
  pod 'BidMachinePangleAdapter', '3.0.1.0'
  pod 'BidMachineVungleAdapter', '3.0.1.0'
  pod 'BidonAdapterAppLovin', '0.7.0.0'
  pod 'BidonAdapterBidMachine', '0.7.0.0'
  pod 'BidonAdapterBigoAds', '0.7.0.0'
  pod 'BidonAdapterChartboost', '0.7.0.0'
  pod 'BidonAdapterDTExchange', '0.7.0.0'
  pod 'BidonAdapterGoogleAdManager', '0.7.0.0'
  pod 'BidonAdapterGoogleMobileAds', '0.7.0.0'
  pod 'BidonAdapterInMobi', '0.7.0.0'
  pod 'BidonAdapterIronSource', '0.7.0.0'
  pod 'BidonAdapterMetaAudienceNetwork', '0.7.0.0'
  pod 'BidonAdapterMintegral', '0.7.0.0'
  pod 'BidonAdapterMyTarget', '0.7.0.0'
  pod 'BidonAdapterUnityAds', '0.7.0.0'
  pod 'BidonAdapterVungle', '0.7.0.0'
  pod 'BidonAdapterYandex', '0.7.0.0'
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
