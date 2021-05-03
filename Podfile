platform :ios, '10.0'
workspace 'AppodealDemo.xcworkspace'

source 'https://github.com/appodeal/CocoaPods.git'
source 'https://cdn.cocoapods.org/'

install! 'cocoapods', 
    :deterministic_uuids => false, 
    :warn_for_multiple_pod_sources => false
    
use_frameworks!

def appodeal
    pod 'StackConsentManager', '~> 1.1.0'

    pod 'Appodeal', '2.10.0-Beta'
    pod 'APDAdColonyAdapter', '2.10.0.1-Beta'
    pod 'APDAmazonAdsAdapter', '2.10.0.1-Beta'
    pod 'APDAppLovinAdapter', '2.10.0.1-Beta'
    pod 'APDBidMachineAdapter', '2.10.0.1-Beta'
    pod 'APDFacebookAudienceAdapter', '2.10.0.1-Beta'
    pod 'APDGoogleAdMobAdapter', '2.10.0.1-Beta'
    pod 'APDIronSourceAdapter', '2.10.0.1-Beta'
    pod 'APDMyTargetAdapter', '2.10.0.1-Beta'
    pod 'APDOguryAdapter', '2.10.0.1-Beta'
    pod 'APDSmaatoAdapter', '2.10.0.1-Beta'
    pod 'APDStartAppAdapter', '2.10.0.1-Beta'
    pod 'APDUnityAdapter', '2.10.0.1-Beta'
    pod 'APDVungleAdapter', '2.10.0.1-Beta'
    pod 'APDYandexAdapter', '2.10.0.1-Beta'

    # Optional adapter
    # pod 'APDChartboostAdapter', '2.10.0.1-Beta'
    # pod 'APDInMobiAdapter', '2.10.0.1-Beta'
    # pod 'APDMintegralAdapter', '2.10.0.1-Beta'
    # pod 'APDSmaatoAdapter', '2.10.0.1-Beta'
    # pod 'APDTapjoyAdapter', '2.10.0.1-Beta' 
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
