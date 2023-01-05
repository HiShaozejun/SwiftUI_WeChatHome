//
//  MessageRow.swift
//  WeChatHomeView
//
//  Created by Lebus on 2022/3/27.
//

import SwiftUI

struct MessageRow: View {
    
    let message: Message
     
    var body: some View {
        HStack(spacing: 10) {
            Image(message.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(3)
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(message.nickName)
                        .font(.system(size: 17))
                    Text(message.messageText)
                        .font(.system(size: 15))
                        .foregroundColor(.secondary)
                }
                Spacer()
                Text(message.messageDate)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }.padding([.top, .bottom], 8)
    }
}


