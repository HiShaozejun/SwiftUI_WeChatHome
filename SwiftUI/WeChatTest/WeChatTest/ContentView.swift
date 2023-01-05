//
//  ContentView.swift
//  WeChatTest
//
//  Created by shaozejun on 2023/1/5.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {

        //底部tabBar
        TabView {
            MessageView().tabItem {
//                Image(systemName: "message")
//                Text("消息")
                Label("消息", systemImage: "message")
            }
            ContactView().tabItem {
                Image(systemName: "phone")
                Text("通讯录")
            }
            FindView().tabItem {
                Image(systemName: "video")
                Text("发现")
            }
            MeView().tabItem {
                Image(systemName: "target")
                Text("我的")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
