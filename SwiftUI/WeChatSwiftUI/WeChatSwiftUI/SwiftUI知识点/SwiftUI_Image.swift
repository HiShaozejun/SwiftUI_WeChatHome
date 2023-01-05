//
//  SwiftUI_Image.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/5.

/**
    Image学习
 */

import SwiftUI

struct SwiftUI_Image: View {
    var body: some View {
        // Image加载图片,图片过大，只是设置image的frame，是无效的,需要设置image的resizable(压缩)，其次在设置frame的size，在规定的尺寸内显示
//        Image("JackMa").resizable().frame(width: 200,height: 200)
        
        //图片的显示模式, aspectRatio设置宽高比，和图片填充模式
//        Image("JackMa").resizable().aspectRatio(0.7, contentMode: .fit).frame(width: 200,height: 200)
//        Image("JackMa").resizable().aspectRatio(contentMode: .fit).frame(width: 200,height: 200)
        
        // 直接设置scaledToFit
//        Image("JackMa").resizable().scaledToFill().frame(width: 200,height: 200)
        
//        修饰符顺序错误，报错，因为resizable输入Image的实例方法，先调用frame返回的是 some view，无法调用resizable
//        Image("JackMa").frame(width: 200,height: 200).resizable()
        
        // 图片的裁剪,超出frame外的进行裁剪
//        Image("JackMa").resizable().scaledToFill().frame(width: 200,height: 200).clipped()
        
        // 裁剪为圆形,添加边框
        Image("JackMa")
            .resizable()
            .scaledToFill()
            .frame(width: 200,height: 200)
            .clipShape(Circle())
            .border(.orange, width: 5)
        
        
    }
}

struct SwiftUI_Image_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUI_Image()
    }
}
