//
//  MessageListModel.swift
//  WeChatTest
//
//  Created by shaozejun on 2023/1/5.
//

import Foundation


struct MessageListModel : Identifiable {
    var id: Int
    var imageName: String
    var title: String
    var detail: String
    var date: String
}
