//
//  NativeViewController.swift
//  AppodealSwiftDemo
//
//  Copyright © 2017 appodeal. All rights reserved.
//

import UIKit
import Appodeal
import ASExtentions

class NativeViewController: UITableViewController {
    let defaultCellName = "kASDefaultCell"
    let nativeCellName  = "kASNativeCell"
    let nativePeriod    = 5
    
    @IBOutlet weak var nativeAdContainer: UIView!
    
    let nativeAdStack: NSMapTable <NSIndexPath, APDNativeAd> = NSMapTable(keyOptions: .strongMemory, valueOptions: .strongMemory)
    
    
    lazy var nativeAdQueue : APDNativeAdQueue = {
        return APDNativeAdQueue(sdk: nil,
                                settings: self.nativeAdSettings,
                                delegate: self,
                                autocache: true)
    }()
    
    var nativeAdSettings: APDNativeAdSettings! {
        get {
            let instance = APDNativeAdSettings()
            instance.adViewClass = NativeView.self
            return instance;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nativeAdQueue.loadAd()
    }
    
    func presentNative(onView view: UIView, fromIndex index: NSIndexPath) {
        var nativeAd: APDNativeAd?;
        
        if nativeAdStack.object(forKey: index) != nil {
            nativeAd = nativeAdStack.object(forKey: index)
        } else if nativeAdQueue.currentAdCount > 0 {
            nativeAd = nativeAdQueue.getNativeAds(ofCount: 1).first
        }
        
        guard nativeAd == nil else {
            let nativeView = nativeAd!.getViewFor(self)
            view.addSubview(nativeView!)
            nativeView!.asxEdgesEqualView(view)
            return
        }
    }
}


extension NativeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        if indexPath.row != 0 && (indexPath.row % nativePeriod == 0){
            cell = UITableViewCell(style: .default, reuseIdentifier: nativeCellName)
            presentNative(onView: cell.contentView, fromIndex: indexPath as NSIndexPath)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: defaultCellName)
            cell.contentView.asxRound()
        }
        return cell
    }
}


extension NativeViewController : APDNativeAdQueueDelegate {
    func adQueueAdIsAvailable(_ adQueue: APDNativeAdQueue, ofCount count: UInt) {}
    func adQueue(_ adQueue: APDNativeAdQueue, failedWithError error: Error) {}
}
