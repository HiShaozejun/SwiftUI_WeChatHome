//
//  ContentView.swift
//  ViewBuilder
//
//  Created by Lebus on 2022/4/27.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
//        Group {
//            if isLoggedIn {
//                WelcomeView()
//            } else {
//                LoginView()
//            }
//        }
        
        VStack {
            Group {
                Text("1")
                Text("2")
                Text("3")
                Text("4")
                Text("5")
                Text("6")
                Text("7")
                Text("8")
                Text("9")
                Text("10")
            }
            Text("11")
        }
        
    }
    
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
