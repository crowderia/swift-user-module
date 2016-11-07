//
//  User.swift
//  login
//
//  Created by Crowderia on 10/24/16.
//  Copyright © 2016 Crowderia. All rights reserved.
//

import Foundation
import CoreData


class User: NSManagedObject {

    static let entityName = "User"
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        
        userName = ""
        firstName = ""
        phoneNumber = ""
        lastName = ""
        address = ""
        profilePicture = ""
        id = ""
    }
    
    

}
