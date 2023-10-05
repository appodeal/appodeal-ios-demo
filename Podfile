platform :ios, '13.0'
workspace 'AppodealDemo.xcworkspace'

source 'https://github.com/appodeal/CocoaPods.git'
source 'https://cdn.cocoapods.org/'

install! 'cocoapods', 
  :deterministic_uuids => false,
  :warn_for_multiple_pod_sources => false

use_frameworks!

def appodeal
  pod 'Appodeal', '3.2.0-beta.1'
  pod 'APDAdColonyAdapter', '3.2.0.0-beta.1'
  pod 'BidMachineAdColonyAdapter', '~> 2.3.0.0'
  pod 'APDAdjustAdapter', '3.2.0.0-beta.1'
  pod 'APDAppLovinAdapter', '3.2.0.0-beta.1'
  pod 'APDAppsFlyerAdapter', '3.2.0.0-beta.1'
  pod 'APDBidMachineAdapter', '3.2.0.0-beta.1' # Required
  pod 'BidMachineMintegralAdapter', '~> 2.3.0.0'
  pod 'BidMachineAmazonAdapter', '~> 2.3.0.0'
  pod 'BidMachineCriteoAdapter', '~> 2.3.0.0'
  pod 'BidMachineSmaatoAdapter', '~> 2.3.0.0'
  pod 'BidMachineTapjoyAdapter', '~> 2.3.0.0'
  pod 'BidMachinePangleAdapter', '~> 2.3.0.0'
  pod 'APDFirebaseAdapter', '3.2.0.0-beta.1'
  pod 'APDGoogleAdMobAdapter', '3.2.0.0-beta.1'
  pod 'APDIABAdapter', '3.2.0.0-beta.1' # Required
  pod 'APDIronSourceAdapter', '3.2.0.0-beta.1'
  pod 'APDFacebookAdapter', '3.2.0.0-beta.1'
  pod 'APDMetaAudienceNetworkAdapter', '3.2.0.0-beta.1'
  pod 'BidMachineMetaAudienceAdapter', '~> 2.3.0.0'
  pod 'APDMyTargetAdapter', '3.2.0.0-beta.1'
  pod 'BidMachineMyTargetAdapter', '~> 2.3.0.0'
  pod 'APDStackAnalyticsAdapter', '3.2.0.0-beta.1' # Required
  pod 'APDUnityAdapter', '3.2.0.0-beta.1'
  pod 'APDVungleAdapter', '3.2.0.0-beta.1'
  pod 'BidMachineVungleAdapter', '~> 2.3.0.0'
  pod 'APDYandexAdapter', '3.2.0.0-beta.1'
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
