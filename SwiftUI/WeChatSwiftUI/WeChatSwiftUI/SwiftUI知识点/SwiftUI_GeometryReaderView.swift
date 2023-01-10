//
//  SwiftUI_GeometryReaderView.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/10.
/**
    GeometryReader
    屏幕适配，根据父视图设置子视图的宽高
 */

import SwiftUI

struct SwiftUI_GeometryReaderView: View {
    
    let row = [GridItem()]
    
    var body: some View {
        
        //proxy 父视图
        GeometryReader { proxy in
            
            // 水平滚动，高度跟随父视图，宽度需要设定
            ScrollView(.horizontal,showsIndicators: false) {
             
                LazyHGrid(rows: row, alignment: .center) {
                    
                    ForEach(0..<10) { index in
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: proxy.size.width * 0.3) //根据屏幕宽度适配
                            .foregroundColor(Color(hue: 0.03 * Double(index), saturation: 1, brightness: 1))
                            .overlay {
                                Text("\(index)").foregroundColor(.white).font(.title)
                            }
                    }
                    
                }.frame(height: proxy.size.width * 0.3)
            }
        }
    }
}

struct SwiftUI_GeometryReaderView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUI_GeometryReaderView()
    }
}
