//
//  SwiftUI_DisplayAndDismiss.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/9.


/**
    SwiftUI 没有addSubView方式，通过变量来控制视图的展示还是隐藏,
    transition 设置自定义动画效果
    
    原则：
    执行动画，前提是视图已经被加载到视图上，可以通过添加显示动画，也可以在外层视图上添加隐式动画
    
    padding点击无效的问题，
    padding并不会改变原有button的样式，如果需要padding区域也可以点击，需要给Text添加padding
 */

import SwiftUI

struct SwiftUI_DisplayAndDismiss: View {
    
    @State private var isShow = false
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Button {
                //解决方式一：添加显示动画
//                withAnimation(.easeOut(duration: 2.0)) {
//                    isShow.toggle()
//                }
                isShow.toggle()
                
            } label: {
                Text(isShow ? "隐藏动画" : "展示动画")
                //这样的padding可以响应点击事件
                    .padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40))
            }
            // 这样的padding，padding区域不可以响应点击事件
//            .padding(EdgeInsets(top: 20, leading: 40, bottom: 20, trailing: 40))
            .foregroundColor(.white)
            .background(.red)
            .cornerRadius(10)
            
            VStack {
                if isShow {
                    Image(systemName: "sun.max.fill")
                        .font(.system(size: 250))
                        .foregroundColor(.yellow)
                        // 添加的隐式动画无效，以为视图未被提前加载，两种解决方式
    //                    .animation(.default, value: isShow)
                    
                        // 添加transition动画,进行动画组合,滑动动画+透明度渐变动画
//                        .transition(.slide.combined(with: .opacity))
                    
                        // 开始动画和结束动画不一样
                        .transition(.asymmetric(
                            insertion: .slide.combined(with: .opacity),//开始动画
                            removal: .move(edge: .bottom).combined(with: .opacity)))//结束动画
                        
                }
                Spacer()
            }
        }
        // 解决方式二: 最外层的添加隐式动画，链式调用speed，默认速度的几倍
        .animation(.linear(duration: 1.0).speed(2), value: isShow)
    }
}

struct SwiftUI_DisplayAndDismiss_Previews: PreviewProvider {
    static var previews: some View {
        
        //如果动画执行没效果可以包裹一个VStack
        SwiftUI_DisplayAndDismiss()
    }
}
