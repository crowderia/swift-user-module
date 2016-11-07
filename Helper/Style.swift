//
//  Style.swift
//  login
//
//  Created by Crowderia on 10/21/16.
//  Copyright © 2016 Crowderia. All rights reserved.
//

import UIKit

extension UITextField {
    @IBInspectable var theme : String? {
        set (newValue) {
            if newValue!.containsString("default") {
                self.textColor = Style.Color.info
                self.font = Style.Default.font
            }
        }
        get {
            return self.textColor?.description
        }
    }
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSForegroundColorAttributeName: newValue!])
        }
    }
}

extension UILabel {
    @IBInspectable var theme : String? {
        set (newValue) {
            if newValue!.containsString("default") {
                self.textColor = Style.Color.label
                self.font = Style.Default.font
            } else if newValue!.containsString("highlight") {
                self.textColor = Style.Color.label
                self.font = Style.Default.font
            } else if newValue!.containsString("dark") {
                self.textColor = Style.Color.info
                self.font = Style.Default.font
            } else if newValue!.containsString("description") {
                self.textColor = Style.Color.info
                self.font = Style.Font14.font
            } else if newValue!.containsString("title") {
                self.textColor = Style.Color.info
                self.font = Style.Font18.font
            } else if newValue!.containsString("info") {
                self.textColor = Style.Dark.textColor
                self.font = Style.Info.font
            }
        }
        get {
            return self.textColor?.description
        }
    }
}

extension UIButton {
    @IBInspectable var theme : String? {
        set (newValue) {
            if newValue!.containsString("default") {
                self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
                self.titleLabel?.font = Style.Default.font
                self.layer.cornerRadius = 2.0
            } else if newValue!.containsString("text_only") {
                self.setTitleColor(UIColor(hexCode: 0xACE3FA), forState: UIControlState.Normal)
                self.titleLabel?.font = Style.Default.font
            }
        }
        get {
            return self.titleLabel?.text
        }
    }
}

extension UIView {
    @IBInspectable var backgroundTheme : String? {
        set (newValue) {
            if newValue!.containsString("default") {
                //self.backgroundColor = CStyle.Color.label
            } else if newValue!.containsString("dark") {
            } else if newValue!.containsString("light") {
            }
        }
        get {
            return self.description
        }
    }
}

extension UITextView {
    @IBInspectable var theme : String? {
        set (newValue) {
            if newValue!.containsString("default") {
                self.textColor = Style.Default.textColor
                self.font = Style.Default.font
            } else if newValue!.containsString("description") {
                self.layer.borderColor = Style.Color.label.CGColor
                self.layer.cornerRadius = 0.5
                self.layer.borderWidth = 1.0
                self.backgroundColor = UIColor.whiteColor()
                self.textColor = Style.Color.info
                self.font = Style.Description.font
            } else if newValue!.containsString("title") {
                self.textColor = Style.Dark.textColor
                self.font = Style.Description.font
            } else if newValue!.containsString("info") {
                self.textColor = Style.Dark.textColor
                self.font = Style.Info.font
            }
        }
        get {
            return self.textColor?.description
        }
    }
}

class Style: NSObject {
    static let baseFont = "Helvetica Neue"
    
    //Styling Default
    struct Default {
        static var font = UIFont(name: baseFont, size: 16)
        static var fontName = baseFont
        static var textColor = UIColor(hexCode: 0x2C2C2C)
        static var backgroundColor = UIColor.blackColor()
        static var tintColor = UIColor(hexCode: 0x1D7AFA)
    }
    
    //Styling Default
    struct Description {
        static var font = UIFont(name: baseFont, size: 16)
        static var fontName = baseFont
        static var textColor = UIColor(hexCode: 0x757575)
    }
    
    //Styling Default
    struct Font18 {
        static var font = UIFont(name: baseFont, size: 18)
        static var fontName = baseFont
    }
    
    //Styling Default
    struct Font16 {
        static var font = UIFont(name: baseFont, size: 16)
        static var fontName = baseFont
    }
    
    //Styling Default
    struct Font14 {
        static var font = UIFont(name: baseFont, size: 14)
        static var fontName = baseFont
    }
    
    //Styling Default
    struct Title {
        static var font = UIFont(name: baseFont, size: 20)
        static var fontName = baseFont
        static var textColor = UIColor(hexCode: 0x2C2C2C)
    }
    
    //Styling Default
    struct Info {
        static var font = UIFont(name: baseFont, size: 28)
        static var fontName = baseFont
        static var textColor = UIColor(hexCode: 0x000000)
    }
    
    //Styling Default
    struct Light {
        static var font = UIFont(name: baseFont, size: 20)
        static var fontName = baseFont
        static var textColor = UIColor.lightGrayColor()
        static var backgroundColor = UIColor.lightGrayColor()
        static var tintColor = UIColor(hexCode: 0x1D7AFA)
    }
    
    //Styling Dark
    struct Dark {
        static var font = UIFont(name: baseFont, size: 14)
        static var fontName = baseFont
        static var textColor = UIColor(hexCode: 0x781F44)
        static var backgroundColor = UIColor.blackColor()
        static var tintColor = UIColor(hexCode: 0x1D7AFA)
    }
    
    //601336
    struct Color {
        static var info = UIColor(hexCode: 0x601336)
        static var label = UIColor(hexCode: 0xCE1F74)
        static var background = UIColor(hexCode: 0xFBE4EC)
    }
    
    //Font
    struct FontSize {
        static var fontSmall = UIFont(name: baseFont, size: 14)
        static var fontMiddle = UIFont(name: baseFont, size: 16)
        static var fontLarge = UIFont(name: baseFont, size: 18)
        static var fontExLarge = UIFont(name: baseFont, size: 20)
    }
    
    //Font
    struct FontWeight {
        static var fontSmall = UIFont(name: baseFont, size: 14)
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    //0xFFFFFF
    convenience init(hexCode:Int) {
        self.init(red:(hexCode >> 16) & 0xff, green:(hexCode >> 8) & 0xff, blue:hexCode & 0xff)
    }
}
