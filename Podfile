platform :ios, '10.0'
workspace 'AppodealDemo.xcworkspace'

source 'https://github.com/appodeal/CocoaPods.git'
source 'https://cdn.cocoapods.org/'

install! 'cocoapods', 
  :deterministic_uuids => false,
  :warn_for_multiple_pod_sources => false

use_frameworks!

def appodeal
  pod 'APDAdColonyAdapter', '3.0.0.1'
  pod 'BDMAdColonyAdapter', '~> 1.9.4'
  pod 'APDAdjustAdapter', '3.0.0.1'
  pod 'APDAppLovinAdapter', '3.0.0.1'
  pod 'APDAppsFlyerAdapter', '3.0.0.1'
  pod 'APDBidMachineAdapter', '3.0.0.1' # Required
  pod 'BDMCriteoAdapter', '~> 1.9.4'
  pod 'BDMAmazonAdapter', '~> 1.9.4.2'
  pod 'BDMSmaatoAdapter', '~> 1.9.4'
  pod 'BDMTapjoyAdapter', '~> 1.9.4'
  pod 'APDFirebaseAdapter', '3.0.0.1'
  pod 'APDGoogleAdMobAdapter', '3.0.0.1'
  pod 'APDIABAdapter', '3.0.0.1' # Required
  pod 'BDMIABAdapter', '~> 1.9.4'
  pod 'APDFacebookAdapter', '3.0.0.1'
  pod 'APDMetaAudienceNetworkAdapter', '3.0.0.1'
  pod 'BDMMetaAudienceAdapter', '~> 1.9.4'
  pod 'APDMyTargetAdapter', '3.0.0.1'
  pod 'BDMMyTargetAdapter', '~> 1.9.4'
  pod 'APDStackAnalyticsAdapter', '3.0.0.1' # Required
  pod 'APDUnityAdapter', '3.0.0.1'
  pod 'APDVungleAdapter', '3.0.0.1'
  pod 'BDMVungleAdapter', '~> 1.9.4'
  pod 'APDYandexAdapter', '3.0.0.1'
  
  # Following pods are not contains
  # arm64-simulator architecture slice
  # and can not be launched on
  # a simulator without Rosetta.
  pod 'BDMPangleAdapter', '~> 1.9.4', :configuration => 'Release'
  pod 'Ads-Global', :configuration => 'Release'
  pod 'OneKit-Pangle', '1.1.21-pangle', :configuration => 'Release'
  pod 'RangersAPM-Pangle', '2.3.2-pangle', :configuration => 'Release'
  
  pod 'APDIronSourceAdapter', '3.0.0.1', :configuration => 'Release'
  pod 'IronSourceSDK', :configuration => 'Release'
  
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
