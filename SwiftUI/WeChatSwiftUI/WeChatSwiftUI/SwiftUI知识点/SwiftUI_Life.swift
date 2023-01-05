//
//  SwiftUI_Life.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/5.
/**
    生命周期知识点学习
 */

import SwiftUI

struct SwiftUI_Life: View {
    
    var body: some View {
        List {
            Text("生命周期演示")
        }.onAppear(){
            print("onAppear")
        }.onDisappear(){
            print("onDisappear")
        }
    }
}

struct SwiftUI_Life_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUI_Life()
    }
}
