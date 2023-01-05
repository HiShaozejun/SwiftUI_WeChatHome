//
//  ExpenseApp.swift
//  Expense
//
//  Created by Lebus on 2022/5/1.
//

import SwiftUI

@main
struct ExpenseApp: App {
    let persistenceController = PersistenceController.shared
    //实例化ViewModel的时候用StateObject,子页面接受传值那边用ObservedObject
    @StateObject var expense = Expense()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(expense)
                .onChange(of: scenePhase) { newScenePhase in
                    switch newScenePhase {
                    case .background:
                        print("App进入后台了")
                        persistenceController.saveViewContextIfChanged()
                    case .inactive:
                        print("App变成非活跃状态")
                    case .active:
                        print("App变成活跃状态")
                    @unknown default:
                        print("其余在未来系统追加的生命周期")
                    }
                }
        }
    }
}
