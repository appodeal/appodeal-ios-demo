//
//  NativeView.swift
//  AppodealSwiftDemo
//
//  Copyright © 2017 appodeal. All rights reserved.
//

import UIKit
import Appodeal
import ASExtentions

class NativeView: UIView {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var callToAction: UILabel!

    @IBOutlet weak var descr: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var mediaContainer: UIView!
    @IBOutlet weak var adChoices: UIView!
    
    override func draw(_ rect: CGRect) {
        self.asxRound()

        self.icon.layer.cornerRadius = 10.0
        self.icon.layer.masksToBounds = true

        self.callToAction.layer.cornerRadius = 10.0
        self.callToAction.layer.masksToBounds = true
    }
}

extension NativeView : APDNativeAdView {
    func titleLabel() -> UILabel {
        return title
    }
    
    func callToActionLabel() -> UILabel {
        return callToAction
    }
    
    func descriptionLabel() -> UILabel {
        return descr
    }
    
    func iconView() -> UIImageView {
        return icon
    }
    
    func mediaContainerView() -> UIView {
        return mediaContainer
    }
    
    func adChoicesView() -> UIView {
        return adChoices
    }
    
    static func nib() -> UINib {
        return UINib.init(nibName: "Native", bundle: Bundle.main)
    }
}

