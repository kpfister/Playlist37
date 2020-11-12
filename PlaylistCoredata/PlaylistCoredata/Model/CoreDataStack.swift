//
//  CoreDataStack.swift
//  PlaylistCoredata
//
//  Created by Cameron Stuart on 11/11/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {
    
    /// Creating a static computed property of type `NSPersistentContainer`
    static let container: NSPersistentContainer = {
        /// create our container, note that the name has to be identical to our application name
        let container = NSPersistentContainer(name: "PlaylistCoredata")
        /// load our persistent store
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Failed to load data from persistent store.")
            }
        }
        return container
    }()
    
    /// Creating a static `NSManagedObjectContext` that we can use for our objects context.
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
}
