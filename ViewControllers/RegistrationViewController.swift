//
//  RegistrationViewController.swift
//  login
//
//  Created by Crowderia on 10/22/16.
//  Copyright © 2016 Crowderia. All rights reserved.
//

import UIKit
import SwiftValidator

class RegistrationViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(sender: UIButton) {
        
        if txtUsername.text?.characters.count == 0 || txtPassword.text?.characters.count == 0 {
            return
        }
        
        UserService.user.login(txtUsername.text!, password: txtPassword.text!) { (success, result) in
            
            if success {
                AlertView.showMessages("Info", message: "Successfuly Logged", view: self)
                CacheHelper.accessToken = result["token"] as? String
            } else {
                AlertView.showMessages(result["Title"] as! String, message: result["Message"] as! String, view: self)
            }
            
        }
        
    }

}
