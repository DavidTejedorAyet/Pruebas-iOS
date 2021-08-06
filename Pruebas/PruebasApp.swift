//
//  PruebasApp.swift
//  Pruebas
//
//  Created by David on 4/8/21.
//

import SwiftUI

@main
struct PruebasApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
