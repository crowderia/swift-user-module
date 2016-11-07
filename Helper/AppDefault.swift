//
//  AppDefault.swift
//  login
//
//  Created by Crowderia on 10/21/16.
//  Copyright © 2016 Crowderia. All rights reserved.
//

import UIKit

class AppDefault: NSObject {
    
    var user :ApUser?
    
    static var appDefault: AppDefault = {
        return AppDefault()
    }()
    
    func loadStorage() {
        // check user alrady logged or not
        if CacheHelper.isAuth == true {
            self.loadStorageOne()
        } else {
            self.loadStorageTwo()
        }
    }
    
    func loadStorageOne() {
        // if user alrady logged, user can load these storage
        UserService.user.getUser { (success, result) in
            if success {
                self.user = ApUser(dictionary: result)
            } else {
                
            }
        }
    }
    
    func loadStorageTwo() {
        // user can load these storage without login
    }
    

}
