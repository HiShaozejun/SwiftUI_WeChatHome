//
//  ListRowView.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/5.
//

import SwiftUI

/**
    抽离每一行cell
 */
struct ListRowView: View {
    
    let message: MessageInfoModel
    
    var body: some View {
        HStack(alignment: .top,spacing: 10, content: {
            
            //Image使用
            Image(message.iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 80,height: 80)
                .cornerRadius(10)
                
            //垂直方向布局容器类似column
            VStack (alignment: .leading, spacing: 10,content: {
                Text(message.title).font(.system(size: 23)).foregroundColor(.primary)
                     Text(message.subTitle).font(.system(size: 18)).foregroundColor(.secondary)
            })
            // 填充间隙
            Spacer()
            
            Text(message.date).foregroundColor(.secondary).font(.footnote)
            
        })
        .padding([.top,.bottom],8)
        .onAppear {
            //类似 viewdidload
//            print(message)
        }
    }
}
