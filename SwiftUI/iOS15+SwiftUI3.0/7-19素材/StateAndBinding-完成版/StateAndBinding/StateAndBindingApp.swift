//
//  StateAndBindingApp.swift
//  StateAndBinding
//
//  Created by Lebus on 2022/4/5.
//

import SwiftUI

@main
struct StateAndBindingApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    var body: some Scene {
        WindowGroup {
            TextFieldView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        UIScrollView.appearance().keyboardDismissMode = .onDrag
        
        return true
    }
}
