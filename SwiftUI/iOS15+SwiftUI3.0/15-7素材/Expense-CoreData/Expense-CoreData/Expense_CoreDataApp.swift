//
//  Expense_CoreDataApp.swift
//  Expense-CoreData
//
//  Created by Lebus on 2022/5/28.
//

import SwiftUI

@main
struct Expense_CoreDataApp: App {
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
