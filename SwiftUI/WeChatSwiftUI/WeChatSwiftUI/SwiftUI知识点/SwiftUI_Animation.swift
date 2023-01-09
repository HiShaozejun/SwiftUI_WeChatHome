//
//  SwiftUI_Animation.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/7.
/**
    动画学习
    如果只是监测一个属性的改变，可以使用隐式动画
    如果需要监听多个值的变化，使用显示动画，可以写多行代码
    
    animation的参数一，可以设置动画的执行时间，
*/

import SwiftUI

/**缩放动画**/
struct SwiftUI_Animation: View {
    
    //点击状态绑定
    @State private var isLike = false
    
    var body: some View {
        
        Image(systemName: isLike ? "heart.fill" : "heart")
            .font(.system(size: 80))
            .foregroundColor(isLike ? .red : .black)
        
             /**
              隐式动画 .animation(<#T##animation: Animation?##Animation?#>, value: <#T##Equatable#>)
              参数1： 动画的表现形式，可以设置动画的执行时间
              参数2：遵循Equatable协议的属性
              */
//            .animation(.default, value: isLike)
            
            /** 缩放动画 */
            .scaleEffect(isLike ? 1.5 : 1.0)
            
            /**图片添加点击事件**/
            .onTapGesture {
                
                //显示动画，明确告知系统需要执行动画
                withAnimation(.linear(duration: 3.0)) {
                    isLike.toggle()
                }
                
            }
    }
}

/** 偏移动画*/
struct SwiftUI_OffSetAnimation: View {
    @State private var offset: CGFloat = 0
    var body: some View {
        
        VStack(spacing: 40) {
            
            HStack {
                Image(systemName: "heart")
                    .font(.title)
                    .offset(x:offset,y: 0) //偏移
                    .animation(.easeOut(duration: 1.5), value: offset) //偏移添加动画
                Spacer()
            }
            
            Button {
                offset += 80
            } label: {
                Text("开始动画")
            }
        }
    }
}

/** 弹簧效果*/
struct SwiftUI_SpringAnimation: View {
    
    @State private var offset: CGFloat = 0
    @State private var isScale = false
    var body: some View {
        VStack(spacing: 40) {
            
            // 平移弹簧效果
            HStack {
                Image(systemName: "heart")
                    .font(.largeTitle)
                    .offset(x:offset,y: 0) //偏移
                    /**
                     参数说明
                     response: 动画的柔和度 值越小 动画越激烈
                     dampingFraction:摩擦阻尼值，阻尼越大效果越不明显
                     blendDuration:混合时间，在多个弹簧动画的时候回使用到
                     value:监听属性变化的值
                     */
                    // 弹簧效果
                    .animation(.spring(response: 1.5, dampingFraction: 0.5, blendDuration: 0.6), value: offset)
                Spacer()
            }
            
            Button {
                offset += 80
            } label: {
                Text("开始平移弹簧动画")
            }
            
            // 缩放弹簧效果
            Image(systemName: isScale ? "heart.fill" : "heart")
                .font(.largeTitle)
                .foregroundColor(isScale ? .red : .black)
                .scaleEffect(isScale ? 1.5 : 1.0)
                .onTapGesture {
                    //显示动画
                    withAnimation(.spring(response: 1.0, dampingFraction: 0.4)) {
                        isScale.toggle()
                    }
                }
        }
    }
}

//
//struct SwiftUI_Animation_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUI_Animation()
//        SwiftUI_OffSetAnimation()
//
//    }
//}
