//
//  Home.swift
//  WeChatHomeView
//
//  Created by Lebus on 2022/3/31.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
            
            MessageList()
            
            Text("通讯录页面")
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("通讯录")
                }
            Text("发现页面")
                .tabItem {
                    Image(systemName: "location.circle")
                    Text("发现")
                }
            Text("我页面")
                .tabItem {
                    Image(systemName: "person")
                    Text("我")
                }
        }
        //生命周期
        .onAppear { }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
