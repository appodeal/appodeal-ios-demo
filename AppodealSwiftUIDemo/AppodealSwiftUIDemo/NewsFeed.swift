//
//  NewsFeed.swift
//  AppodealSwiftUIDemo
//
//  Created by Stas Kochkin on 02.03.2020.
//  Copyright © 2020 com.appodeal. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import Appodeal


struct NewsFeed: View {
    @ObservedObject private var coordinator: Coordinator = Coordinator()
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView(.vertical) {
                if self.coordinator.content.isEmpty {
                    ActivityIndicator(isStopped: .constant(false))
                }
                VStack {
                    ForEach(self.coordinator.content, id: \.id) {
                        $0.view.padding()
                    }
                }.frame(width: proxy.size.width)
            }
        }
        .navigationBarTitle("Feed sample")
        .onAppear {
            self.coordinator.addContent()
        }
    }
    
    fileprivate class Coordinator: NSObject, ObservableObject {
        @Published var content: [FeedContent] = []
        
        private var subscriptions: Set<AnyCancellable> = Set()
        
        private lazy var adQueue: APDNativeAdQueue = {
            let settings = APDNativeAdSettings()
            settings.adViewClass = NativeView.self
            
            let queue = APDNativeAdQueue(
                sdk: nil,
                settings: settings,
                delegate: self,
                autocache: false
            )
            return queue
        }()
        
        
        deinit {
            subscriptions.forEach { $0.cancel() }
        }
        
        func addContent(_ size: Int = 10) {
            
            let newContent = FeedEntity.generate(size).map(FeedContent.init)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                self?.adQueue.loadAd()
                self?.content.append(contentsOf: newContent)
            }
        }
    }
}


extension NewsFeed.Coordinator: APDNativeAdQueueDelegate {
    func adQueueAdIsAvailable(_ adQueue: APDNativeAdQueue, ofCount count: UInt) {
        let placedAdCount = content.filter { $0.data is APDNativeAd }.count
        guard placedAdCount == 0 || content.count / placedAdCount > 4 else { return }
        let ads = adQueue.getNativeAds(ofCount: Int(count))
        ads.map(FeedContent.init).forEach {
            content.insert($0, at: Int.random(in: (0..<content.count)))
        }
    }
}

struct FeedEntity {
    var title: String
    var description: String
    var image: String
    
    var view: AnyView {
        AnyView(
            GeometryReader { proxy in
                ZStack(alignment: .top) {
                    Image(self.image).resizable()
                    VStack(alignment: .leading) {
                        Text(self.title).font(.headline).padding([.leading, .top], 16)
                        Text(self.description).font(.subheadline).padding([.leading, .bottom], 16)
                    }
                    .frame(width: proxy.size.width)
                    .background(Color.red.opacity(0.2))
                }.frame(width: proxy.size.width)
            }.frame(height: 300)
        )
    }
    
    static func `default`() -> FeedEntity {
        return FeedEntity(
            title: "Title",
            description: "Lorem ipsum dolor sit amet...",
            image: "Placeholder"
        )
    }
    
    static func generate(_ size: Int) -> [FeedEntity] {
        return (0..<size).map { _ in FeedEntity.default() }
    }
}


struct FeedContent: Identifiable {
    typealias ID = UUID
    let id: UUID
    var view: AnyView {
        switch data {
        case is FeedEntity: return (data as! FeedEntity).view
        case is APDNativeAd: return (data as! APDNativeAd).view
        default: return AnyView(EmptyView())
        }
    }
    
    fileprivate var data: Any
    
    init(data: Any) {
        self.data = data
        self.id = UUID()
    }
}


struct NewsFeed_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeed()
    }
}

