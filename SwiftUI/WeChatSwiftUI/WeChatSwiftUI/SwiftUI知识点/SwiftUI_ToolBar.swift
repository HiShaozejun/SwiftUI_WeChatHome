//
//  SwiftUI_ToolBar.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/5.
//

import SwiftUI

struct SwiftUI_ToolBar: View {
    var body: some View {
        
        NavigationView {
            List {
                Text("1111")
                Text("1111")
                Text("1111")
                Text("1111")
                Text("1111")
                Text("1111")
            }
            .listStyle(.plain)
            // 导航设置
            .navigationTitle("导航标题")
            .navigationBarTitleDisplayMode(.inline)
            
            // 默认居右显示
//            .toolbar {
//                //设置item
//                ToolbarItem {
//                    Button("Add") {
//
//                    }
//                }
//
//                ToolbarItem {
//                    Button {
//
//                    } label: {
//                        Image(systemName: "plus.circle")
//                    }
//                }
//            }
            
            // 设置居左或者居右item
//            .toolbar {
//
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button("居左按钮") {
//
//                    }
//                }
//
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button("居右按钮") {
//
//                    }
//                }
//            }
            
            // 设置多个item,ToolbarItemGroup
            .toolbar {
                
                ToolbarItemGroup {
                    Button("11") {
                        
                    }
                    Button("22") {
                        
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button("33") {
                        
                    }
                    Button("44") {
                        
                    }
                }
                
            }
        }
        
    }
}

struct SwiftUI_ToolBar_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUI_ToolBar()
    }
}
