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
    @StateObject var tabbarController: TabbarViewController = TabbarViewController()

    @Environment(\.scenePhase) var scenePhase
    enum Screen: Hashable {
        case home, settings, profile
    }

    var body: some Scene {
        WindowGroup {
            CTBMain(tabbarController: tabbarController)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { (newScenePhase) in
            switch newScenePhase {
            case .active:
                print("Scene is active")
            case .background:
                print("Scene is in background")
                persistenceController.save()
            case .inactive:
                print("Scene is inactive")
            @unknown default:
                print("")
            }
        }
        
    }
    
}
