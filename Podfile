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

    pod 'Appodeal', '2.10.2'
    pod 'APDAdColonyAdapter', '2.10.2.1'
    pod 'APDAmazonAdsAdapter', '2.10.2.1'
    pod 'APDAppLovinAdapter', '2.10.2.1'
    pod 'APDBidMachineAdapter', '2.10.2.1'
    pod 'APDFacebookAudienceAdapter', '2.10.2.1'
    pod 'APDGoogleAdMobAdapter', '2.10.2.1'
    pod 'APDIronSourceAdapter', '2.10.2.1'
    pod 'APDMyTargetAdapter', '2.10.2.1'
    pod 'APDOguryAdapter', '2.10.2.1'
    pod 'APDSmaatoAdapter', '2.10.2.1'
    pod 'APDStartAppAdapter', '2.10.2.1'
    pod 'APDUnityAdapter', '2.10.2.1'
    pod 'APDVungleAdapter', '2.10.2.1'
    pod 'APDYandexAdapter', '2.10.2.1'

    # Optional adapter
    pod 'APDChartboostAdapter', '2.10.2.1'
    pod 'APDInMobiAdapter', '2.10.2.1'
    pod 'APDMintegralAdapter', '2.10.2.1'
    pod 'APDSmaatoAdapter', '2.10.2.1'
    pod 'APDTapjoyAdapter', '2.10.2.1'
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
