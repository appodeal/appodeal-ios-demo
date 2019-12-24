platform :ios, '9.0'
workspace 'AppodealDemo.xcworkspace'

# source 'https://github.com/appodeal/CocoaPods.git'
source 'https://github.com/CocoaPods/Specs.git'

install! 'cocoapods', :deterministic_uuids => false, :warn_for_multiple_pod_sources => false
use_frameworks!

def appodeal
    pod 'StackConsentManager', '~> 1.0'
    pod 'Appodeal', '~> 2.5.14'
end

target 'AppodealSwiftDemo' do
    project 'AppodealSwiftDemo/AppodealSwiftDemo.xcodeproj'
    appodeal
end

target 'AppodealObjectiveCDemo' do
    project 'AppodealObjectiveCDemo/AppodealObjectiveCDemo.xcodeproj'
    appodeal
end