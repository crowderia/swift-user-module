//
//  Networkmanager.swift
//  login
//
//  Created by Crowderia on 10/21/16.
//  Copyright © 2016 Crowderia. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class RequestResponseHandler: NSObject {
    var url :String!
    var method :Alamofire.Method!
    var parameters :[String:AnyObject]!
    var header :[String:String]!
    
    init(cUrl :String, cMethod :Alamofire.Method, cParameters :[String:AnyObject], cHeader :[String:String]) {
        super.init()
        url = cUrl
        method = cMethod
        parameters = cParameters
        header = cHeader
        
    }
    
    init(cUrl :String, cMethod :Alamofire.Method, cParameters :[String:AnyObject]) {
        super.init()
        url = cUrl
        method = cMethod
        parameters = cParameters
        if CacheHelper.accessToken == nil {
            header = [:]
        } else {
            header = Configurations().authenticatedHeader
        }
        
    }
    
    init(cUrl :String, cMethod :Alamofire.Method, cHeader :[String:String]) {
        super.init()
        url = cUrl
        method = cMethod
        parameters = [:]
        if CacheHelper.accessToken == nil {
            header = [:]
        } else {
            header = Configurations().authenticatedHeader
        }
        
    }
    
    init(cUrl :String, cMethod :Alamofire.Method) {
        super.init()
        url = cUrl
        method = cMethod
        parameters = [:]
        if CacheHelper.accessToken == nil {
            header = [:]
        } else {
            header = Configurations().authenticatedHeader
        }
    }
    
    class func performOperation(request :RequestResponseHandler, callbackResponse :(success :Bool, statuCode :Int)->Void, callbacResult :(result :AnyObject?)->Void, callbackError :(error :NSError?)->Void) {
        
        let reqUrl = request.url
        let reqParams = request.parameters as [String:AnyObject]
        let reqMethod:Alamofire.Method = request.method
        let reqHeaders = request.header
        
        if reqUrl == nil {
            callbackError (error: NSError(domain: "Invalid request URL", code: 2001, userInfo:["Title":"Request Error"]))
        }

        let Arequest = Alamofire.request(reqMethod, request.url, parameters: reqParams, headers: reqHeaders)
        
        Arequest.responseJSON { response in
            
            //parsed the request success condition
            
            if response.response?.statusCode == nil {
                callbackResponse(success: false, statuCode: 2002)
            } else {
                callbackResponse(success: response.result.isSuccess, statuCode: (response.response?.statusCode)!)
            }
            
            if response.response?.statusCode == 200 {
                callbacResult(result: response.result.value)
            } else {
                callbackError (error: NSError(domain: "Error Title", code: 2001, userInfo:["message":"Error Message"]))
            }
        }
    }
    
}
