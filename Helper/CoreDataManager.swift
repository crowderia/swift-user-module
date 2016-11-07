//
//  CoreDataManager.swift
//  login
//
//  Created by Crowderia on 10/21/16.
//  Copyright © 2016 Crowderia. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
    static var manager: CoreDataManager!
    
    static var defaultManager :CoreDataManager {
        if manager == nil {
            manager = CoreDataManager()
        }
        return manager
    }
    
    /*
     *Login managed object context static instance to access from NSManagedObject's sub classess
     */
    static var context :NSManagedObjectContext {
        get {
            return defaultManager.managedObjectContext
        }
    }
    
    // MARK: - Core Data stack
    lazy var applicationDocumentsDirectory: NSURL = {
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = NSBundle.mainBundle().URLForResource("Login", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let storeOptions = [NSMigratePersistentStoresAutomaticallyOption: true, NSInferMappingModelAutomaticallyOption: true]
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("Login.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: storeOptions)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()
    
    /*
     *insert given entity in to managed object context return it as a NSManagedObject
     */
    static func insertEntity(name :String) -> NSManagedObject {
        assert(!name.isEmpty, "Entity name can not be nil")
        return NSEntityDescription.insertNewObjectForEntityForName(name, inManagedObjectContext: CoreDataManager.context)
    }
    
    /*
     *allocate given entity and return it as a NSManagedObject
     *it will not save in to core data context until you call insertObject in manageObjectContext
     */
    static func unsavedEntity(name :String) -> NSManagedObject {
        assert(!name.isEmpty, "Entity name can not be nil")
        return NSManagedObject.init(entity: NSEntityDescription.entityForName(name, inManagedObjectContext: CoreDataManager.context)!, insertIntoManagedObjectContext: nil)
    }
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    // MARK: - Core Data Saving support
    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    
    /**
     save the core data context
     **/
    class func saveContext() {
        dispatch_async(dispatch_get_main_queue()) {
            CoreDataManager.defaultManager.saveContext()
        }
    }
    
    /**
     read last object of event
     **/
    class func lastIndex(entityName :String) -> NSManagedObject? {
        do {
            return try self.context.executeFetchRequest(NSFetchRequest(entityName: entityName)).last as? NSManagedObject
        } catch {}
        return NSManagedObject()
    }
    
    /**
     read objects from event for request
     **/
    class func fetchObjects(entityName :String, request :NSFetchRequest) -> [NSManagedObject]? {
        do {
            return try self.context.executeFetchRequest(NSFetchRequest(entityName: entityName)) as? [NSManagedObject]
        } catch {}
        return []
    }
}
