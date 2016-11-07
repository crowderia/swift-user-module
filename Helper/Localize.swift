//
//  Localize.swift
//  login
//
//  Created by Crowderia on 10/24/16.
//  Copyright © 2016 Crowderia. All rights reserved.
//

import UIKit

extension UITextField {
    @IBInspectable var localizedPlaceholder : String? {
        set (newValue) {
            if !(newValue!.isEmpty) {
                self.placeholder = newValue!.localizedString
            } else {
                self.placeholder = ""
            }
        }
        get {
            return self.placeholder
        }
    }
}

extension UILabel {
    @IBInspectable var localizedText : String? {
        set (newValue) {
            if !(newValue!.isEmpty) {
                self.text = newValue!.localizedString
            } else {
                self.text = ""
            }
        }
        get {
            return self.text
        }
    }
}

extension UITabBarItem {
    @IBInspectable var localizedText : String? {
        set (newValue) {
            if !(newValue!.isEmpty) {
                self.title = newValue!.localizedString
            } else {
                self.title = ""
            }
        }
        get {
            return self.title
        }
    }
}


extension UIButton {
    @IBInspectable var localizedText : String? {
        set (newValue) {
            if !(newValue!.isEmpty) {
                self.setTitle(newValue!.localizedString, forState: UIControlState.Normal)
            } else {
                self.setTitle("", forState: UIControlState.Normal)
            }
        }
        get {
            return self.titleLabel?.text
        }
    }
}

extension UITextView {
    @IBInspectable var localizedText : String? {
        set (newValue) {
            if !(newValue!.isEmpty) {
                self.text = newValue!.localizedString
            } else {
                self.text = ""
            }
        }
        get {
            return self.text
        }
    }
}


extension UIBarButtonItem {
    @IBInspectable var localizedText : String? {
        set (newValue) {
            if !(newValue!.isEmpty) {
                self.title = newValue!.localizedString
            } else {
                self.title = ""
            }
        }
        get {
            return self.title
        }
    }
}

extension UINavigationItem {
    @IBInspectable var localizedText : String? {
        set (newValue) {
            if !(newValue!.isEmpty) {
                self.title = newValue!.localizedString
            } else {
                self.title = ""
            }
        }
        get {
            return self.title
        }
    }
}

class Localize: NSObject {

}
