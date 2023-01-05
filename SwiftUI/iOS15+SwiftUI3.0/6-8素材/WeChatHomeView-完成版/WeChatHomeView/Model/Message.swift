//
//  Message.swift
//  WeChatHomeView
//
//  Created by Lebus on 2022/3/26.
//

import Foundation

struct Message: Identifiable {
    let id: Int //UUID()
    let imageName: String
    let nickName: String
    let messageText: String
    let messageDate: String
    
}
