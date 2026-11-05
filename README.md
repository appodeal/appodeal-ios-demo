# appodeal-ios-demo
Appodeal iOS SDK Demo Project

[![](https://img.shields.io/badge/docs-Swift-green.svg)](https://docs.appodeal.com/ios/get-started)
[![](https://img.shields.io/badge/docs-ObjectiveC-green.svg)](https://docs.appodeal.com/ios/get-started)

Stable version of Appodeal SDK is **4.4.2**
 
SDK integration documentation: [docs](https://docs.appodeal.com/ios/get-started)

The native examples in Swift, Objective-C and SwiftUI use `APDNativeAdContainerView`
with Appodeal 4.4.2 for native ad presentation and interaction handling.

Keep the existing native template registered through `adViewClass`. Add the returned
container to your layout and retain its `APDNativeAd` while it is displayed. To
customize the template, use `container.templateView` without removing it from the
container. Do not cast the container itself to your template class.

See the [native integration guide](https://docs.appodeal.com/ios/ad-types/native)
and [4.4.2 upgrade guide](https://docs.appodeal.com/ios/upgrade-guide).
