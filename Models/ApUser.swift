/*
 Copyright (c) 2016 Swift Models Generated from JSON powered by http://www.json4swift.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import Foundation

/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class ApUser {
    public var _id : String?
    public var updatedAt : String?
    public var createdAt : String?
    public var firstName : String?
    public var lastName : String?
    public var password : String?
    public var mobile : Int?
    public var userName : String?
    public var __v : Int?
    public var address : String?
    public var image : String?
    
    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let ApUser_list = ApUser.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of ApUser Instances.
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [ApUser]
    {
        var models:[ApUser] = []
        for item in array
        {
            models.append(ApUser(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    /**
     Constructs the object based on the given dictionary.
     
     Sample usage:
     let User = User(someDictionaryFromJSON)
     
     - parameter dictionary:  NSDictionary from JSON.
     
     - returns: User Instance.
     */
    required public init?(dictionary: NSDictionary) {
        _id = dictionary["_id"] as? String
        updatedAt = dictionary["updatedAt"] as? String
        createdAt = dictionary["createdAt"] as? String
        firstName = dictionary["firstName"] as? String
        lastName = dictionary["lastName"] as? String
        password = dictionary["password"] as? String
        mobile = dictionary["mobile"] as? Int
        userName = dictionary["userName"] as? String
        __v = dictionary["__v"] as? Int
        address = dictionary["address"] as? String
        image = dictionary["image"] as? String
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.updatedAt, forKey: "updatedAt")
        dictionary.setValue(self.createdAt, forKey: "createdAt")
        dictionary.setValue(self.firstName, forKey: "firstName")
        dictionary.setValue(self.lastName, forKey: "lastName")
        dictionary.setValue(self.password, forKey: "password")
        dictionary.setValue(self.mobile, forKey: "mobile")
        dictionary.setValue(self.userName, forKey: "userName")
        dictionary.setValue(self.__v, forKey: "__v")
        dictionary.setValue(self.address, forKey: "address")
        dictionary.setValue(self.image, forKey: "image")
        
        return dictionary
    }
    
    public func objectRepresentation() -> [String: AnyObject] {
        
        let param: [String: AnyObject]!
        
        param = [
            "id": self._id!,
            "firstName": self.firstName!,
            "lastName": self.lastName!,
            "mobile": self.mobile!,
            "userName": self.userName!,
            "address": self.address!,
            "image": self.image!
        ]
        
        return param
    }
    
    
}