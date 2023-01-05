//
//  ExpenseApp.swift
//  Expense
//
//  Created by Lebus on 2022/5/1.
//

import SwiftUI

@main
struct ExpenseApp: App {
    //实例化ViewModel的时候用StateObject,子页面接受传值那边用ObservedObject
    @StateObject var expense = Expense()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(expense)
        }
    }
}
