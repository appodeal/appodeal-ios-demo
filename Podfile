platform :ios, '9.0'
workspace 'AppodealDemo.xcworkspace'

# source 'https://github.com/appodeal/CocoaPods.git'
source 'https://github.com/CocoaPods/Specs.git'

install! 'cocoapods', :deterministic_uuids => false, :warn_for_multiple_pod_sources => false
use_frameworks!

def appodeal
    pod 'StackConsentManager', '~> 1.0'
    pod 'APDAdColonyAdapter', '2.6.1.1' 
    pod 'APDAmazonAdsAdapter', '2.6.1.1' 
    pod 'APDAppLovinAdapter', '2.6.1.1' 
    pod 'APDAppodealAdExchangeAdapter', '2.6.1.1' 
    pod 'APDChartboostAdapter', '2.6.1.1' 
    pod 'APDFacebookAudienceAdapter', '2.6.1.1' 
    pod 'APDGoogleAdMobAdapter', '2.6.1.1' 
    pod 'APDInMobiAdapter', '2.6.1.1' 
    pod 'APDInnerActiveAdapter', '2.6.1.1' 
    pod 'APDIronSourceAdapter', '2.6.1.1' 
    pod 'APDMintegralAdapter', '2.6.1.1' 
    pod 'APDMyTargetAdapter', '2.6.1.1' 
    pod 'APDOguryAdapter', '2.6.1.1' 
    pod 'APDOpenXAdapter', '2.6.1.1' 
    pod 'APDPubnativeAdapter', '2.6.1.1' 
    pod 'APDSmaatoAdapter', '2.6.1.1' 
    pod 'APDStartAppAdapter', '2.6.1.1' 
    pod 'APDTapjoyAdapter', '2.6.1.1' 
    pod 'APDUnityAdapter', '2.6.1.1' 
    pod 'APDVungleAdapter', '2.6.1.1' 
    pod 'APDYandexAdapter', '2.6.1.1' 
end

target 'AppodealSwiftDemo' do
    project 'AppodealSwiftDemo/AppodealSwiftDemo.xcodeproj'
    appodeal
end

target 'AppodealObjectiveCDemo' do
    project 'AppodealObjectiveCDemo/AppodealObjectiveCDemo.xcodeproj'
    appodeal
end