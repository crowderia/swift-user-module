//
//  User+CoreDataProperties.swift
//  login
//
//  Created by Crowderia on 10/24/16.
//  Copyright © 2016 Crowderia. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension User {

    @NSManaged var address: String?
    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var phoneNumber: String?
    @NSManaged var profilePicture: String?
    @NSManaged var userName: String?
    @NSManaged var id: String?

}
