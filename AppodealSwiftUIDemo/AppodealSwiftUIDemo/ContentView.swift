//
//  ContentView.swift
//  AppodealSwiftUIDemo
//
//  Created by Stas Kochkin on 02.03.2020.
//  Copyright © 2020 com.appodeal. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var ad = AdvertisingProvider.shared
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                List {
                    FullscreenSection(
                        text: "interstitial",
                        ad: self.ad,
                        keyPath: \.isInterstitialReady
                    ) {
                        self.ad.presentInterstitial()
                    }
                    FullscreenSection(
                        text: "rewarded",
                        ad: self.ad,
                        keyPath: \.isRewardedReady
                    ) {
                        self.ad.presentInterstitial()
                    }
                    NativeSection()
                }.listStyle(GroupedListStyle())
                AdvertisingProvider.Banner()
                    .frame(
                        minWidth: 320,
                        idealWidth: .infinity,
                        minHeight: ad.bannerHeight,
                        maxHeight: ad.bannerHeight
                )
            }
            .navigationBarTitle("SwiftUI Sample")
        }
    }
    
    struct FullscreenSection<T>: View where T: ObservableObject {
        typealias Action = () -> Void
        let text: String
        @ObservedObject var ad: T
        var keyPath: ReferenceWritableKeyPath<T,Bool>
        var action: Action
        
        var body: some View {
            Section(header: Text(text.uppercased())) {
                HStack {
                    Text(ad[keyPath: keyPath] ? "Ready" : "Loading")
                    Spacer()
                    ActivityIndicator(isStopped: $ad[dynamicMember: keyPath])
                }
                if ad[keyPath: keyPath] {
                    Button(action: action) {
                        Text("Show \(text.lowercased())")
                    }.transition(.slide)
                }
            }
        }
    }
    
    struct NativeSection: View {
        var body: some View {
            Section(header: Text("NATIVE AD")) {
                NavigationLink("News feed sample", destination: NewsFeed())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
