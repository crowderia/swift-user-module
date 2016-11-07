//
//  Configurations.swift
//  login
//
//  Created by Crowderia on 10/24/16.
//  Copyright © 2016 Crowderia. All rights reserved.
//

import UIKit

class Configurations: NSObject {
    
    //credential types - grant types
    static let CREDENTIAL = "application"
    static let FACEBOOK = "facebook"
    
    //secret codes
    static let CLIENT_SECRET = "12r3g4h5789a"
    
    //compulsary parameter to auth request
    static let API_ADMIN = "ios"
    
    //initial user setup registration parameters
    static let authParameters = [
        "client_secret": CLIENT_SECRET,
        "client_id": API_ADMIN
    ]
    
    static let loginParameters = [
        "client_secret": CLIENT_SECRET,
        "client_id": API_ADMIN,
        "grant_type": CREDENTIAL
    ]
    
    static let facebookLoginParameters = [
        "client_secret": CLIENT_SECRET,
        "client_id": API_ADMIN,
        "grant_type": FACEBOOK
    ]
    
    //return authtoken
    let authenticatedHeader = [
        "X-Access-Token": CacheHelper.accessToken!
    ]
    
    static let root = "http://localhost:3000/"
    static let base = root+"api/v1/"
    static let imageBase = root+"images/"
    
    //authenticate
    static var userAuthenticate :String! {
        get {
            return "\(self.base)authenticate"
        }
    }
    //register User
    static var registerUser :String! {
        get {
            return "\(self.base)user"
        }
    }
    //request User
    static var requestUser :String! {
        get {
            return "\(self.base)user"
        }
    }
    //update User
    static var updateUser :String! {
        get {
            return "\(self.base)user"
        }
    }
    //delete User
    static var deleteUser :String! {
        get {
            return "\(self.base)user"
        }
    }

}
