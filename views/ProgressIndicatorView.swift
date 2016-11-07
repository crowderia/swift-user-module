//
//  ProgressIndicatorView.swift
//  login
//
//  Created by Crowderia on 11/3/16.
//  Copyright © 2016 Crowderia. All rights reserved.
//

import UIKit

class ProgressIndicatorView: UIView {

    @IBOutlet weak var txtLabel: UILabel!
    
    static func setLocalProgress(title: String, view: UIView) {
        let bundle = NSBundle.mainBundle()
        let nib = UINib(nibName: "ProgressIndicatorView", bundle: bundle)
        let pview = nib.instantiateWithOwner(nil, options: nil)[1] as! ProgressIndicatorView
        pview.frame = UIScreen.mainScreen().bounds
        pview.layoutIfNeeded()
        pview.txtLabel.text = title.localizedString
        view.addSubview(pview)
    }
    
    static func setGlobelProgress(title: String) {
        let bundle = NSBundle.mainBundle()
        let nib = UINib(nibName: "ProgressIndicatorView", bundle: bundle)
        let pview = nib.instantiateWithOwner(nil, options: nil)[1] as! ProgressIndicatorView
        pview.frame = UIScreen.mainScreen().bounds
        pview.layoutIfNeeded()
        pview.txtLabel.text = title.localizedString
        (UIApplication.sharedApplication().keyWindow?.rootViewController?.view!)!.addSubview(pview)
    }
    
    static func hideGlobelProgress () {
        for view in (UIApplication.sharedApplication().keyWindow?.rootViewController?.view!)!.subviews {
            if view.isKindOfClass(self) {
                UIView.animateWithDuration(0.25, animations: {
                    view.alpha = 0.0
                    }, completion: { (success) in
                        view.removeFromSuperview()
                });
            }
        }
    }
    
    static func hideInView (view :UIView) {
        for view in view.subviews {
            if view.isKindOfClass(self) {
                UIView.animateWithDuration(0.25, animations: {
                    view.alpha = 0.0
                    }, completion: { (success) in
                        view.removeFromSuperview()
                });
            }
        }
    }
    

}
