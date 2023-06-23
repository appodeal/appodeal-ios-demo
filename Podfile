platform :ios, '12.0'
workspace 'AppodealDemo.xcworkspace'

source 'https://github.com/appodeal/CocoaPods.git'
source 'https://cdn.cocoapods.org/'

install! 'cocoapods', 
  :deterministic_uuids => false,
  :warn_for_multiple_pod_sources => false

use_frameworks!

def appodeal
  pod 'APDAdColonyAdapter', '3.1.3.0-beta.2'
  pod 'BidMachineAdColonyAdapter', '~> 2.2.0.0'
  pod 'APDAdjustAdapter', '3.1.3.0-beta.2'
  pod 'APDAppLovinAdapter', '3.1.3.0-beta.2'
  pod 'APDAppsFlyerAdapter', '3.1.3.0-beta.2'
  pod 'APDBidMachineAdapter', '3.1.3.0-beta.2' # Required
  pod 'BidMachineMintegralAdapter', '~> 2.2.0.0'
  pod 'BidMachineAmazonAdapter', '~> 2.2.0.0'
  pod 'BidMachineCriteoAdapter', '~> 2.2.0.0'
  pod 'BidMachineSmaatoAdapter', '~> 2.2.0.0'
  pod 'BidMachineTapjoyAdapter', '~> 2.2.0.0'
  pod 'BidMachinePangleAdapter', '~> 2.2.0.0'
  pod 'APDFirebaseAdapter', '3.1.3.0-beta.2'
  pod 'APDGoogleAdMobAdapter', '3.1.3.0-beta.2'
  pod 'APDIABAdapter', '3.1.3.0-beta.2' # Required
  pod 'APDIronSourceAdapter', '3.1.3.0-beta.2'
  pod 'APDFacebookAdapter', '3.1.3.0-beta.2'
  pod 'APDMetaAudienceNetworkAdapter', '3.1.3.0-beta.2'
  pod 'BidMachineMetaAudienceAdapter', '~> 2.2.0.0'
  pod 'APDMyTargetAdapter', '3.1.3.0-beta.2'
  pod 'BidMachineMyTargetAdapter', '~> 2.2.0.0'
  pod 'APDStackAnalyticsAdapter', '3.1.3.0-beta.2' # Required
  pod 'APDUnityAdapter', '3.1.3.0-beta.2'
  pod 'APDVungleAdapter', '3.1.3.0-beta.2'
  pod 'BidMachineVungleAdapter', '~> 2.2.0.0'
  pod 'APDYandexAdapter', '3.1.3.0-beta.2'
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
