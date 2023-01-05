//
//  Message.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/5.
//

import Foundation

struct MessageInfoModel: Identifiable {
    
    let id: Int
    let iconName: String
    let title: String
    let subTitle: String
    let date: String
    
}


struct ForEachModel:Identifiable {
    var id = UUID()
}
