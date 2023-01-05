//
//  MessageDetail.swift
//  WeChatHomeView
//
//  Created by Lebus on 2022/3/28.
//

import SwiftUI

struct MessageDetail: View {
    let title: String
    
    var body: some View {
        Text("聊天页面")
            .navigationTitle(title)
    }
}
