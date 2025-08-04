//
//  PersistenceController.swift
//  AppRotina
//
//  Created by Ângelo Mendes on 04/08/25.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "AppRotina")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Erro ao carregar o CoreData: \(error)")
            }
        }
    }
}

