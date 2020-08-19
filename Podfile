platform :ios, '9.0'
workspace 'AppodealDemo.xcworkspace'

source 'https://github.com/appodeal/CocoaPods.git'
source 'https://cdn.cocoapods.org/'

install! 'cocoapods', :deterministic_uuids => false, :warn_for_multiple_pod_sources => false
use_frameworks!

def appodeal
    pod 'StackConsentManager', '~> 1.0.1'
    pod 'APDAdColonyAdapter', '2.7.3.1-Beta' 
    pod 'APDAmazonAdsAdapter', '2.7.3.1-Beta' 
    pod 'APDAppLovinAdapter', '2.7.3.1-Beta' 
    pod 'APDAppodealAdExchangeAdapter', '2.7.3.1-Beta' 
    pod 'APDChartboostAdapter', '2.7.3.1-Beta' 
    pod 'APDFacebookAudienceAdapter', '2.7.3.1-Beta' 
    pod 'APDGoogleAdMobAdapter', '2.7.3.1-Beta' 
    pod 'APDInMobiAdapter', '2.7.3.1-Beta' 
    pod 'APDInnerActiveAdapter', '2.7.3.1-Beta' 
    pod 'APDIronSourceAdapter', '2.7.3.1-Beta' 
    pod 'APDMintegralAdapter', '2.7.3.1-Beta' 
    pod 'APDMyTargetAdapter', '2.7.3.1-Beta' 
    pod 'APDOguryAdapter', '2.7.3.1-Beta' 
    pod 'APDOpenXAdapter', '2.7.3.1-Beta' 
    pod 'APDPubnativeAdapter', '2.7.3.1-Beta' 
    pod 'APDSmaatoAdapter', '2.7.3.1-Beta' 
    pod 'APDStartAppAdapter', '2.7.3.1-Beta' 
    pod 'APDTapjoyAdapter', '2.7.3.1-Beta' 
    pod 'APDUnityAdapter', '2.7.3.1-Beta' 
    pod 'APDVungleAdapter', '2.7.3.1-Beta' 
    pod 'APDYandexAdapter', '2.7.3.1-Beta' 
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