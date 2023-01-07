//
//  SwiftUI_Adaptor.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/6.

/**
     SwiftUI属性包装器的知识点
     处理数据和视图同步
     @State
     @Binding
 */

import SwiftUI

struct SwiftUI_Adaptor: View {
    
    /**
     属性包装器，可以在body里面修改定义的属性，
     当修改完成之后，系统会重新刷新当前的body视图，只有使用到 @State包装的属性的视图，才会进行刷新，底层出发的是@State中的didSet，系统触发UI的刷新
     
     @State一般都是包装struct类型，如果是Class类型，修改了属性不会刷新UI，
     @State包装的属性，并不是存放在当前的SwiftUI_Adaptor中，由系统管理该属性
     @State包装的属性，需要添加private，以防止在外部使用构造函数访问值，因为是由系统管理的属性，跟初始化构造入参没有关系
     
     */
    @State private var isPlaying = false
    
    // 如果函数中修改属性，函数前加 mutating
    mutating func updatePlayingState(state: Bool) -> Void {
        isPlaying = state
    }
    
    var body: some View {
        
        ZStack {
            
            ZStack(alignment: .bottomLeading){
                
                Rectangle().frame(width: UIScreen.main.bounds.size.width, height: 300, alignment: .center).foregroundColor(Color.black)
                
                // 传值
                PlayerButton(isPlaying: $isPlaying)
            }
            
            Text(isPlaying ? "播放中" : "暂停").foregroundColor(.white).font(.largeTitle);
        }
    }
}

/**
    @Binding 使用：
    如果夸父子视图，需要属性传值的时，需要使用 @Binding进行绑定，使用的是父视图中同一个属性变量
 */

struct PlayerButton: View {
    // 单一数据源（SSOT）
    //传值定义
    @Binding var isPlaying: Bool
    
    var body: some View {
        
        Button {
            isPlaying = !isPlaying
        } label: {
            Image(systemName: isPlaying ? "pause.circle":"play.circle")
        }
        .font(.largeTitle)
        .foregroundColor(.white)
        .padding()
    }
}


/**------------------------------------*/
/**
    Toggle使用
 */
struct ToggleView: View {
    
    // 数据 --> 视图
    // 视图 --> 数据
    @State private var isOn = false
    
    var body: some View {
        
        VStack{
            
            Toggle("手机模式", isOn: $isOn)
                .padding()
                .onChange(of: isOn) { val in
                    print(val)
                }
            
            Button {
                isOn.toggle()
                
            } label: {
                Text(isOn ? "开关打开了" : "开关关闭了")
                    .font(.largeTitle)
            }

        }
        
    }
}

//预览
struct SwiftUI_Adaptor_Previews: PreviewProvider {
    static var previews: some View {
//        SwiftUI_Adaptor()
        ToggleView()
    }
}
