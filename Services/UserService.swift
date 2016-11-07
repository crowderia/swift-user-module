//
//  UserService.swift
//  login
//
//  Created by Crowderia on 10/22/16.
//  Copyright © 2016 Crowderia. All rights reserved.
//

import UIKit

class UserService: NSObject {
    
    static var user: UserService = {
        return UserService()
    }()
    
    func login(userName: String, password: String, callbackResponse: (success: Bool, result: [String: AnyObject]) -> Void) {
        
        let url = Configurations.userAuthenticate
        let urlParams = ["username":userName,
                         "password":password
            ] as [String:AnyObject]
        
        let cr = RequestResponseHandler(cUrl: url, cMethod: .POST, cParameters:  urlParams)
        
        RequestResponseHandler.performOperation(cr, callbackResponse: { (success, statuCode) in
            
            }, callbacResult: { (result) in
                
                callbackResponse(success: true, result: result! as! [String : AnyObject])
                
        }) { (error) in
            callbackResponse(success: false, result: ["Title":(error?.domain)!,"Message":(error?.userInfo["message"])!])
        }
        
    }
    
    func registration(user: ApUser, callbackResponse: (success: Bool, result: [String: AnyObject]) -> Void) {
        
        let url = Configurations.registerUser
        let urlParams = user.objectRepresentation()
        
        let urlHeader = Configurations.loginParameters
        
        let cr = RequestResponseHandler(cUrl: url, cMethod: .POST, cParameters:  urlParams, cHeader: urlHeader)
        
        RequestResponseHandler.performOperation(cr, callbackResponse: { (success, statuCode) in
            
            }, callbacResult: { (result) in
                
                callbackResponse(success: true, result: result! as! [String : AnyObject])
                
        }) { (error) in
            callbackResponse(success: false, result: ["Title":(error?.domain)!,"Message":(error?.userInfo["message"])!])
        }
        
    }
    
    func getUser(callbackResponse: (success: Bool, result: [String: AnyObject]) -> Void) {
        
        let url = Configurations.requestUser
        let cr = RequestResponseHandler(cUrl: url, cMethod: .GET)
        
        RequestResponseHandler.performOperation(cr, callbackResponse: { (success, statuCode) in
            
            }, callbacResult: { (result) in
                
                callbackResponse(success: true, result: result! as! [String : AnyObject])
                
        }) { (error) in
            callbackResponse(success: false, result: ["Title":(error?.domain)!,"Message":(error?.userInfo["message"])!])
        }
        
    }
    
    func updateUser(user: ApUser, callbackResponse: (success: Bool, result: [String: AnyObject]) -> Void) {
        
        let url = Configurations.updateUser
        let urlParams = user.objectRepresentation()
        
        let urlHeader = Configurations.loginParameters
        
        let cr = RequestResponseHandler(cUrl: url, cMethod: .PUT, cParameters:  urlParams, cHeader: urlHeader)
        
        RequestResponseHandler.performOperation(cr, callbackResponse: { (success, statuCode) in
            
            }, callbacResult: { (result) in
                
                callbackResponse(success: true, result: result! as! [String : AnyObject])
                
        }) { (error) in
            callbackResponse(success: false, result: ["Title":(error?.domain)!,"Message":(error?.userInfo["message"])!])
        }
    }
    
    func deleteUser(callbackResponse: (success: Bool, result: [String: AnyObject]) -> Void) {
        
        let url = Configurations.requestUser
        let cr = RequestResponseHandler(cUrl: url, cMethod: .DELETE)
        
        RequestResponseHandler.performOperation(cr, callbackResponse: { (success, statuCode) in
            
            }, callbacResult: { (result) in
                
                callbackResponse(success: true, result: result! as! [String : AnyObject])
                
        }) { (error) in
            callbackResponse(success: false, result: ["Title":(error?.domain)!,"Message":(error?.userInfo["message"])!])
        }
        
    }

}
