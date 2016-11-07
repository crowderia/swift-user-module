//
//  CacheHelper.swift
//  login
//
//  Created by Crowderia on 10/24/16.
//  Copyright © 2016 Crowderia. All rights reserved.
//

import UIKit

class CacheHelper: NSObject {
    
    static let ACCESS = "accessToken"
    static let ISAUTH = "isAuthenticated"
    
    //retrieve the saved access token
    static var accessToken :String? {
        get {
            return cacheRead(ACCESS) as? String
        }
        set (newToken) {
            cacheSave(newToken!, key: ACCESS)
        }
    }
    
    static var isAuth :Bool {
        get {
            let value = cacheRead(ISAUTH) as? Bool
            if value == nil {
                return false
            } else {
                return value!
            }
        }
        set (id) {
            cacheSave(id, key: ISAUTH)
        }
    }
    
}

extension NSObject {
    static func cacheSave(object :AnyObject, key :String) {
        NSUserDefaults.standardUserDefaults().setValue(object, forKey: key)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    static func cacheRead(key :String) -> AnyObject? {
        return NSUserDefaults.standardUserDefaults().valueForKey(key)
    }
}
