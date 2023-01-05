//
//  SwiftUIView-Image.swift
//  WeChatHomeView
//
//  Created by Lebus on 2022/3/25.
//

import SwiftUI

struct SwiftUIView_Image: View {
    var body: some View {
        //UIKit中图片视图写法:UIImageView(image: UIImage(named: "JackMa"))
        //SwiftUI中的View默认是弹性的--flexible
        
        Image("JackMa")
            .resizable()
            .scaledToFill() //另一种写法.aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 300)
            .clipped() //裁剪掉超出视图的部分
            //.clipShape(Circle()) //裁剪成圆形
            //.border(.orange, width: 5) //加边框
 
    }
}

struct SwiftUIView_Image_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_Image()
    }
}
