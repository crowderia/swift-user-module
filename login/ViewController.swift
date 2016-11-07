//
//  ViewController.swift
//  login
//
//  Created by Crowderia on 10/12/16.
//  Copyright © 2016 Crowderia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImageView = UIImageView(image: UIImage(named: "InvestorLoginPage"))
        backgroundImageView.frame = view.frame
        backgroundImageView.contentMode = .ScaleAspectFill
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

