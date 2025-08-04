//
//  AppRotinaApp.swift
//  AppRotina
//
//  Created by Ângelo Mendes on 30/07/25.
//

import SwiftUI
import CoreData

@main
struct AppRotinaApp: App {
    let persistence = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistence.container.viewContext)
        }
    }
}
