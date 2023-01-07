//
//  SwiftUI_Animation.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/7.
/**
    动画学习
*/

import SwiftUI

struct SwiftUI_Animation: View {
    
    //点击状态绑定
    @State private var isLike = false
    
    var body: some View {
        
        Image(systemName: isLike ? "heart.fill" : "heart")
            .font(.system(size: 80))
            .foregroundColor(isLike ? .red : .black)
            .animation(.default, value: isLike)
            .onTapGesture {
                isLike.toggle()
            }
    }
}

//struct SwiftUI_Animation_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUI_Animation()
//    }
//}
