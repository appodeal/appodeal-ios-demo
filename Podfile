platform :ios, '12.0'
workspace 'AppodealDemo.xcworkspace'

source 'https://github.com/appodeal/CocoaPods.git'
source 'https://cdn.cocoapods.org/'

install! 'cocoapods', 
  :deterministic_uuids => false,
  :warn_for_multiple_pod_sources => false

use_frameworks!

def appodeal
    pod 'APDAdColonyAdapter', '3.0.2.1'
    pod 'BidMachineAdColonyAdapter', '~> 2.0.0.0'
    pod 'APDAdjustAdapter', '3.0.2.1'
    pod 'APDAppLovinAdapter', '3.0.2.1'
    pod 'APDAppsFlyerAdapter', '3.0.2.1'
    pod 'APDBidMachineAdapter', '3.0.2.1' # Required
    pod 'BidMachineAmazonAdapter', '~> 2.0.0.0'
    pod 'BidMachineCriteoAdapter', '~> 2.0.0.0'
    pod 'BidMachineSmaatoAdapter', '~> 2.0.0.0'
    pod 'BidMachineTapjoyAdapter', '~> 2.0.0.0'
    pod 'BidMachinePangleAdapter', '~> 2.0.0.0'
    pod 'BidMachineNotsyAdapter', '~> 2.0.0.4'
    pod 'APDFirebaseAdapter', '3.0.2.1'
    pod 'APDGoogleAdMobAdapter', '3.0.2.1'
    pod 'APDIABAdapter', '3.0.2.1' # Required
    pod 'APDIronSourceAdapter', '3.0.2.1'
    pod 'APDFacebookAdapter', '3.0.2.1'
    pod 'APDMetaAudienceNetworkAdapter', '3.0.2.1'
    pod 'BidMachineMetaAudienceAdapter', '~> 2.0.0.0'
    pod 'APDMyTargetAdapter', '3.0.2.1'
    pod 'BidMachineMyTargetAdapter', '~> 2.0.0.2'
    pod 'APDStackAnalyticsAdapter', '3.0.2.1' # Required
    pod 'APDUnityAdapter', '3.0.2.1'
    pod 'APDVungleAdapter', '3.0.2.1'
    pod 'BidMachineVungleAdapter', '~> 2.0.0.1'
    pod 'APDYandexAdapter', '3.0.2.1'
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
