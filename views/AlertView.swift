//
//  AlertView.swift
//  login
//
//  Created by Crowderia on 11/3/16.
//  Copyright © 2016 Crowderia. All rights reserved.
//

import UIKit

class AlertView: UIView {

    static func showMessages(title: String, message: String, view: UIViewController) {
        let alertView = UIAlertController(title: title.localizedString, message: message.localizedString, preferredStyle: .Alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        view.presentViewController(alertView, animated: true, completion: nil)
    }

}
