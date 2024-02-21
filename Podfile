platform :ios, '12.4'
workspace 'AppodealDemo.xcworkspace'

source 'https://github.com/appodeal/CocoaPods.git'
source 'https://cdn.cocoapods.org/'

install! 'cocoapods', 
  :deterministic_uuids => false,
  :warn_for_multiple_pod_sources => false

use_frameworks!

def appodeal
  pod 'Appodeal', '3.3.0-beta.2'
  pod 'BidMachineAdColonyAdapter', '~> 2.4.0.0'
  pod 'APDAdjustAdapter', '3.3.0.0-beta.2'
  pod 'APDAmazonAdapter', '3.3.0.0-beta.2'
  pod 'BidMachineAmazonAdapter', '= 2.4.0.0'
  pod 'BidonAdapterAmazon', '~> 0.4.7'
  pod 'APDAppLovinMAXAdapter', '3.3.0.0-beta.2'
  pod 'APDAppsFlyerAdapter', '3.3.0.0-beta.2'
  pod 'APDBidonAdapter', '3.3.0.0-beta.2' # Required
  pod 'BidonAdapterBidMachine', '~> 0.4.7.2'
  pod 'APDBigoAdsAdapter', '3.3.0.0-beta.2'
  pod 'BidonAdapterBigoAds', '~> 0.4.7.3'
  pod 'APDCriteoAdapter', '3.3.0.0-beta.2'
  pod 'BidMachineCriteoAdapter', '~> 2.4.0.0'
  pod 'APDDTExchangeAdapter', '3.3.0.0-beta.2'
  pod 'BidonAdapterDTExchange', '~> 0.4.7.3'
  pod 'AppLovinMediationFyberAdapter'
  pod 'APDFacebookAdapter', '3.3.0.0-beta.2'
  pod 'APDFirebaseAdapter', '3.3.0.0-beta.2'
  pod 'APDGoogleAdMobAdapter', '3.3.0.0-beta.2'
  pod 'BidonAdapterGoogleMobileAds', '~> 0.4.7'
  pod 'BidonAdapterGoogleAdManager', '~> 0.4.7'
  pod 'AppLovinMediationGoogleAdManagerAdapter'
  pod 'AppLovinMediationGoogleAdapter'
  pod 'APDIABAdapter', '3.3.0.0-beta.2' # Required
  pod 'APDInMobiAdapter', '3.3.0.0-beta.2'
  pod 'BidonAdapterInMobi', '~> 0.4.7'
  pod 'APDIronSourceAdapter', '3.3.0.0-beta.2'
  pod 'AppLovinMediationIronSourceAdapter'
  pod 'APDMetaAudienceNetworkAdapter', '3.3.0.0-beta.2'
  pod 'BidMachineMetaAudienceAdapter', '~> 2.4.0.1'
  pod 'BidonAdapterMetaAudienceNetwork', '~> 0.4.7'
  pod 'AppLovinMediationFacebookAdapter'
  pod 'APDMintegralAdapter', '3.3.0.0-beta.2'
  pod 'BidMachineMintegralAdapter', '= 2.4.0.1'
  pod 'BidonAdapterMintegral', '~> 0.4.7.2'
  pod 'AppLovinMediationMintegralAdapter'
  pod 'APDMyTargetAdapter', '3.3.0.0-beta.2'
  pod 'BidMachineMyTargetAdapter', '~> 2.4.0.1'
  pod 'AppLovinMediationMyTargetAdapter'
  pod 'APDPangleAdapter', '3.3.0.0-beta.2'
  pod 'BidMachinePangleAdapter', '~> 2.4.0.0'
  pod 'APDSentryAdapter', '3.3.0.0-beta.2'
  pod 'APDSmaatoAdapter', '3.3.0.0-beta.2'
  pod 'BidMachineSmaatoAdapter', '~> 2.4.0.0'
  pod 'APDBidMachineAdapter', '3.3.0.0-beta.2' # Required
  pod 'AppLovinMediationBidMachineAdapter'
  pod 'APDTapjoyAdapter', '3.3.0.0-beta.2'
  pod 'BidMachineTapjoyAdapter', '~> 2.4.0.0'
  pod 'APDUnityAdapter', '3.3.0.0-beta.2'
  pod 'BidonAdapterUnityAds', '~> 0.4.7'
  pod 'AppLovinMediationUnityAdsAdapter'
  pod 'APDVungleAdapter', '3.3.0.0-beta.2'
  pod 'BidMachineVungleAdapter', '~> 2.4.0.1'
  pod 'BidonAdapterVungle', '~> 0.4.7.2'
  pod 'AppLovinMediationVungleAdapter'
  pod 'APDYandexAdapter', '3.3.0.0-beta.2'
  pod 'AppLovinMediationYandexAdapter'
  pod 'APDAppLovinAdapter', '3.3.0.0-beta.2'
  pod 'BidonAdapterAppLovin', '~> 0.4.7'
  pod 'AppLovinMediationAmazonAdMarketplaceAdapter'
  pod 'AppLovinMediationInMobiAdapter'
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
