//
//  RoundButton.swift
//  AppodealSwiftDemo
//
//  Copyright © 2018 dtlbox. All rights reserved.
//

import UIKit
import ASExtentions

class RoundButton: UIButton {
    override func draw(_ rect: CGRect) {
        self.setTitleColor(UIColor.asxMain(), for:.normal)
        self.layer.borderColor = self.titleLabel?.textColor.cgColor
        self.layer.borderWidth = 1.0;
        self.layer.cornerRadius = 3.0;
    }
    
}
