//
//  Expense_PresentApp.swift
//  Expense-Present
//
//  Created by Lebus on 2022/5/10.
//

import SwiftUI

@main
struct Expense_PresentApp: App {
    @StateObject var expense = Expense()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(expense)
        }
    }
}
