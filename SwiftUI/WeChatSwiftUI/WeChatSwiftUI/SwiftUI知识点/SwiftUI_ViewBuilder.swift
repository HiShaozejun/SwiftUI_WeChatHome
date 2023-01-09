//
//  SwiftUI_ViewBuilder.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/9.
/**
    @ViewBuilder 学习
    @viewbuilder定义的 可以返回多个视图，可以在内部定义局部变量、switch语句，if else语句
 */

import SwiftUI

struct SwiftUI_ViewBuilder: View {
    var body: some View {
//        @ViewBuilder
        
        //定义变量
        var name: String = ""
        
        //条件语句
        if name.isEmpty {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }else{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        
        // 多个视图
        Text("")
        Text("")
        Text("")
    }
    
    
}

struct SwiftUI_ViewBuilder_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUI_ViewBuilder()
    }
}
