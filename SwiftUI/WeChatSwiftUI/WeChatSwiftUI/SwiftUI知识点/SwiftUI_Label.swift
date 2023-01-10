//
//  SwiftUI_Label.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/10.
/**
    Label学习
 */

import SwiftUI

struct SwiftUI_Label: View {
    var body: some View {
        
        VStack(spacing: 20){
            
            //基本用法 一
            Label("删除", systemImage: "trash")
                .font(.largeTitle)
                .foregroundColor(.red)
                // label的样式，是否文字和图标都展示
                .labelStyle(.iconOnly)
            
            //基本用法 二
            Label {
              //可以添加多个视图
                Text("Jason").font(.largeTitle).foregroundColor(.primary)
                Text("iOS开发工程师").foregroundColor(.secondary).font(.title2)
            } icon: {
                Circle().frame(width: 50,height: 50).foregroundColor(.green)
                    .overlay {
                        Text("J").foregroundColor(.white).font(.title)
                    }
            }
        }
    }
}

struct SwiftUI_Label_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUI_Label()
    }
}
