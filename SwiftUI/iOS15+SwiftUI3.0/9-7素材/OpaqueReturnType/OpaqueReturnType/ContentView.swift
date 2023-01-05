//
//  ContentView.swift
//  OpaqueReturnType
//
//  Created by Lebus on 2022/4/27.
//

import SwiftUI

//some XX:不透明返回类型-OpaqueReturnType
struct ContentView: View {
    
    var body: some View {
        VStack {
            Button("xx") {
                print(type(of: self.body))
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
