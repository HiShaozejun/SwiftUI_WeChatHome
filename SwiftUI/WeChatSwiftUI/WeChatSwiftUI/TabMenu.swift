//
//  TabMenu.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/5.
//

import SwiftUI

struct TabMenu: View {
    
    init() {
        
    }
    
    var body: some View {
        
        TabView {
            
            MessageListView()
                .tabItem {
                    Label("消息", systemImage: "checkmark.message")
                }
            
            ContactsView().tabItem {
                Label("通讯录", systemImage: "contact.sensor")
            }
            
            FindView().tabItem {
                Label("发现", systemImage: "video")
            }
            
            MineView().tabItem {
                Label("我的", systemImage: "person")
            }
        }
    }
}

struct TabMenu_Previews: PreviewProvider {
    static var previews: some View {
        TabMenu()
    }
}
