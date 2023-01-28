//
//  TabMenu.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/5.
//

import SwiftUI

struct TabMenu: View {
    
    @EnvironmentObject private var tabBarState: TabViewState
    
    //修改默认选中的tab
    @State private var selectIndex = 0
    
    var body: some View {
        
        TabView(selection: $selectIndex) {
            
            if #available(iOS 16.0, *) {
                MessageListView().environmentObject(tabBarState)
                    .tabItem {
                        Label("消息", systemImage: "checkmark.message")
                    }
                    .tag(0)
            } else {
                // Fallback on earlier versions
            }
                
            ContactsView().tabItem {
                Label("通讯录", systemImage: "contact.sensor")
            }.tag(1)
            
            FindView().tabItem {
                Label("发现", systemImage: "video")
            }.tag(2)
            
            MineView().tabItem {
                Label("我的", systemImage: "person")
            }.tag(3)
        }
    }
}

struct TabMenu_Previews: PreviewProvider {
    static var previews: some View {
        TabMenu()
    }
}
