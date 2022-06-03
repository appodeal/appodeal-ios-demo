platform :ios, '10.0'
workspace 'AppodealDemo.xcworkspace'

source 'https://github.com/appodeal/CocoaPods.git'
source 'https://cdn.cocoapods.org/'

install! 'cocoapods', 
  :deterministic_uuids => false,
  :warn_for_multiple_pod_sources => false

use_frameworks!

def appodeal
  pod 'APDAdColonyAdapter', '3.0.0.1-Beta.1'
  pod 'APDAdjustAdapter', '3.0.0.1-Beta.1'
  pod 'APDAppLovinAdapter', '3.0.0.1-Beta.1'
  pod 'APDAppsFlyerAdapter', '3.0.0.1-Beta.1'
  pod 'APDFirebaseAdapter', '3.0.0.1-Beta.1'
  pod 'APDGoogleAdMobAdapter', '3.0.0.1-Beta.1'
  pod 'APDIABAdapter', '3.0.0.1-Beta.1' # Required
  pod 'APDFacebookAdapter', '3.0.0.1-Beta.1'
  pod 'APDMetaAudienceNetworkAdapter', '3.0.0.1-Beta.1'
  pod 'APDMyTargetAdapter', '3.0.0.1-Beta.1'
  pod 'APDStackAnalyticsAdapter', '3.0.0.1-Beta.1' # Required
  pod 'APDUnityAdapter', '3.0.0.1-Beta.1'
  pod 'APDYandexAdapter', '3.0.0.1-Beta.1'
      
  # Some of dependencies don't support Apple Silicon iOS simulator
  # exclude them for building in debug
  pod 'APDAmazonAdsAdapter', '3.0.0.1-Beta.1', :configuration => 'Release'
  pod 'APDIronSourceAdapter', '3.0.0.1-Beta.1', :configuration => 'Release'
  pod 'APDVungleAdapter', '3.0.0.1-Beta.1', :configuration => 'Release'
  pod 'APDBidMachineAdapter', '3.0.0.1-Beta.1', :configuration => 'Release'
  pod 'BDMAmazonAdapter', :configuration => 'Release'
  pod 'BDMPangleAdapter', :configuration => 'Release'
  pod 'BDMVungleAdapter', :configuration => 'Release'
  pod 'AmazonPublisherServicesSDK', :configuration => 'Release'
  pod 'AmazonAd', :configuration => 'Release'
  pod 'IronSourceSDK', :configuration => 'Release'
  pod 'Ads-Global', :configuration => 'Release'
  pod 'VungleSDK', :configuration => 'Release'
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
