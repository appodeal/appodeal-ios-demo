platform :ios, '10.0'
workspace 'AppodealDemo.xcworkspace'

source 'https://github.com/appodeal/CocoaPods.git'
source 'https://cdn.cocoapods.org/'

install! 'cocoapods', 
:deterministic_uuids => false,
:warn_for_multiple_pod_sources => false

use_frameworks!

def appodeal
  pod 'APDBidMachineAdapter',          '3.0.0.1-Beta' # Required
  pod 'APDIABAdapter',                 '3.0.0.1-Beta' # Required
  pod 'APDStackAnalyticsAdapter',      '3.0.0.1-Beta' # Required
  pod 'APDAdColonyAdapter',            '3.0.0.1-Beta'
  pod 'APDAdjustAdapter',              '3.0.0.1-Beta'
  pod 'APDAmazonAdsAdapter',           '3.0.0.1-Beta'
  pod 'APDAppLovinAdapter',            '3.0.0.1-Beta'
  pod 'APDAppsFlyerAdapter',           '3.0.0.1-Beta'
  pod 'APDFirebaseAdapter',            '3.0.0.1-Beta'
  pod 'APDGoogleAdMobAdapter',         '3.0.0.1-Beta'
  pod 'APDIronSourceAdapter',          '3.0.0.1-Beta'
  pod 'APDFacebookAdapter',            '3.0.0.1-Beta'
  pod 'APDMetaAudienceNetworkAdapter', '3.0.0.1-Beta'
  pod 'APDMyTargetAdapter',            '3.0.0.1-Beta'
  pod 'APDUnityAdapter',               '3.0.0.1-Beta'
  pod 'APDVungleAdapter',              '3.0.0.1-Beta'
  pod 'APDYandexAdapter',              '3.0.0.1-Beta'
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
