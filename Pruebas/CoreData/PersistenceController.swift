//
//  PersistenceController.swift
//  Pruebas
//
//  Created by David on 7/8/21.
//

import Foundation
import CoreData

struct PersistenceController {
    
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Pruebas")
        container.loadPersistentStores{ (description, error) in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
        
    }
    
    func save(completion: @escaping (Error?) -> () = {_ in}) {
        let content  = container.viewContext
        if content.hasChanges {
            do {
                try content.save()
                completion(nil)
            } catch  {
                completion(error)
            }
        }
    }
    
    func delete(_ object: NSManagedObject, completion: @escaping (Error?) -> () = {_ in}) {
        let context = container.viewContext
        context.delete(object)
        save(completion: completion)
    }
    
    
}
