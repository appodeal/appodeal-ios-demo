//
//  RootViewController.swift
//  AppodealSwiftDemo
//
//  Copyright © 2017 appodeal. All rights reserved.
//

import UIKit


class RootViewController: UIViewController {
    @IBAction func tapOnView(_ sender: UITapGestureRecognizer) {
        view.viewWithTag(10)?.resignFirstResponder()
    }
}
