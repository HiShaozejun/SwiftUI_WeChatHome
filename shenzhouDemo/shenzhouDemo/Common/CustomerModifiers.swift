//
//  CustomerModifiers.swift
//  shenzhouDemo
//
//  Created by shaozejun on 2023/1/11.
//

import SwiftUI

/**自定义修饰符**/
struct CustomerModifiers: ViewModifier {
    
    let cornerRadius: Double
    let lineWidth: Double
    let color: Color
    
    func body(content: Content) -> some View {
        return content
            .cornerRadius(cornerRadius)
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(color,lineWidth: lineWidth)
            }
    }
}

/** 仿照系统修饰符： 其实修饰符底层就是方法的链式调用*/
extension View {
    
    func customerModifiers(cornerRadius: Double = 5,lineWidth:Double = 1,color: Color) -> some View {
        return modifier(CustomerModifiers(cornerRadius: cornerRadius, lineWidth: lineWidth, color: color))
    }
}

