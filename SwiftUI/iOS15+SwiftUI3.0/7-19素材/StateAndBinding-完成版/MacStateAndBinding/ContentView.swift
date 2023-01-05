//
//  ContentView.swift
//  MacStateAndBinding
//
//  Created by Lebus on 2022/4/9.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    var body: some View {
        Form {
            TextField("收货人", text: $name, prompt: Text("请输入收货人姓名"))
                    .font(.title).padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
