//
//  Helper.swift
//  login
//
//  Created by Crowderia on 10/21/16.
//  Copyright © 2016 Crowderia. All rights reserved.
//

import UIKit

extension UIViewController {
    
}

extension Double {
    /// Rounds the double to decimal places value
    func roundToPlaces(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return round(self * divisor) / divisor
    }
}

extension UIImage {
    
    class func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect: CGRect = CGRectMake(0, 0, size.width, size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}

extension UIViewController {
    func addToolBar(textField :UITextField) {
        let numberToolbar = UIToolbar(frame: CGRectMake(0, 0, self.view.frame.size.width, 44))
        numberToolbar.barStyle = UIBarStyle.Default
        let button = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(self.doneWithNumberPad))
        button.tintColor = Style.Color.label
        numberToolbar.items = [button]
        textField.inputAccessoryView = numberToolbar
        numberToolbar.barTintColor = Style.Color.background
        numberToolbar.tintColor = UIColor.blueColor()
    }
    
    func doneWithNumberPad() {
        self.view.endEditing(true)
    }
}

extension String {
    var localizedString :String {
        get {
            return NSLocalizedString(self, comment: "")
        }
    }
}
