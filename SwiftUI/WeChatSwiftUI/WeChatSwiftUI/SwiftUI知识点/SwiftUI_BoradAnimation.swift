//
//  SwiftUI_BoradAnimation.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/7.
/**
    按钮边框水波纹的动画
 */

import SwiftUI

struct SwiftUI_BoradAnimation: View {
    
    @State private var animationVal : CGFloat = 1
    
    var body: some View {
        
        //方形
        Rectangle()
            // 勾勒，
            .stroke(.green, style: StrokeStyle(lineWidth: 12,lineJoin: .bevel))
            .foregroundColor(.red)
//            .clipShape(Circle())
            .frame(width: 100, height: 100)
        
        //圆形
        Circle()
            .stroke(.red,lineWidth: 4)
            .frame(width: 100, height: 100)
        
        /**
            overlay: 覆盖到指定的视图上面，属于父子视图关系，
            ZStack的视图不是父子视图，可以调整层级的上下关系
         */
        Button {
            
            //显示动画
            withAnimation(
                .easeOut(duration: 2.0) //动画效果和执行时间
                .repeatCount(2,autoreverses: false)) // 是否重复和反转
            {
                animationVal = 0
            }
            
        } label: {
            Text("开始录音")
                .font(.system(size: 28))
        }
        .frame(width: 100, height: 100)
        .padding(40)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        // 覆盖到button
        .overlay {
            Circle()
                .stroke(.green,lineWidth: 1)
                .scaleEffect(2 - animationVal)//缩放为自己的2倍
                .opacity(Double(animationVal)) //透明度
        }
        
    }
}

struct SwiftUI_BoradAnimation_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUI_BoradAnimation()
    }
}
