platform :ios, '12.4'
workspace 'AppodealDemo.xcworkspace'

source 'https://github.com/appodeal/CocoaPods.git'
source 'https://cdn.cocoapods.org/'

install! 'cocoapods', 
  :deterministic_uuids => false,
  :warn_for_multiple_pod_sources => false

use_frameworks!

def appodeal
   pod 'Appodeal', '3.2.1'
   pod 'APDAdColonyAdapter', '3.2.1.0'
   pod 'BidMachineAdColonyAdapter', '~> 2.4.0'
   pod 'APDAdjustAdapter', '3.2.1.0'
   pod 'APDAppLovinAdapter', '3.2.1.0'
   pod 'BidonAdapterAppLovin', '~> 0.4.7'
   pod 'APDAppsFlyerAdapter', '3.2.1.0'
   pod 'APDBidMachineAdapter', '3.2.1.0' # Required
   pod 'BidMachineAmazonAdapter', '= 2.4.0'
   pod 'BidMachineCriteoAdapter', '~> 2.4.0'
   pod 'BidMachineSmaatoAdapter', '~> 2.4.0'
   pod 'BidMachineTapjoyAdapter', '~> 2.4.0'
   pod 'BidMachinePangleAdapter', '~> 2.4.0'
   pod 'APDBidonAdapter', '3.2.1.0' # Required
   pod 'BidonAdapterBidMachine', '~> 0.4.7.2'
   pod 'BidonAdapterAmazon', '~> 0.4.7'
   pod 'APDBigoAdsAdapter', '3.2.1.0'
   pod 'BidonAdapterBigoAds', '~> 0.4.7'
   pod 'APDDTExchangeAdapter', '3.2.1.0'
   pod 'BidonAdapterDTExchange', '~> 0.4.7'
   pod 'APDFirebaseAdapter', '3.2.1.0'
   pod 'APDGoogleAdMobAdapter', '3.2.1.0'
   pod 'BidonAdapterGoogleMobileAds', '~> 0.4.7'
   pod 'BidonAdapterGoogleAdManager', '~> 0.4.7'
   pod 'APDIABAdapter', '3.2.1.0' # Required
   pod 'APDInMobiAdapter', '3.2.1.0'
   pod 'BidonAdapterInMobi', '~> 0.4.7'
   pod 'APDIronSourceAdapter', '3.2.1.0'
   pod 'APDFacebookAdapter', '3.2.1.0'
   pod 'APDMetaAudienceNetworkAdapter', '3.2.1.0'
   pod 'BidMachineMetaAudienceAdapter', '~> 2.4.0'
   pod 'BidonAdapterMetaAudienceNetwork', '~> 0.4.7'
   pod 'APDMintegralAdapter', '3.2.1.0'
   pod 'BidMachineMintegralAdapter', '= 2.4.0.1'
   pod 'BidonAdapterMintegral', '~> 0.4.7.2'
   pod 'APDMyTargetAdapter', '3.2.1.0'
   pod 'BidMachineMyTargetAdapter', '~> 2.4.0'
   pod 'APDStackAnalyticsAdapter', '3.2.1.0' # Required
   pod 'APDStackCrashReporterAdapter', '3.2.1.0'
   pod 'APDUnityAdapter', '3.2.1.0'
   pod 'BidonAdapterUnityAds', '~> 0.4.7'
   pod 'APDVungleAdapter', '3.2.1.0'
   pod 'BidMachineVungleAdapter', '~> 2.4.0'
   pod 'BidonAdapterVungle', '~> 0.4.7.2'
   pod 'APDYandexAdapter', '3.2.1.0'
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
