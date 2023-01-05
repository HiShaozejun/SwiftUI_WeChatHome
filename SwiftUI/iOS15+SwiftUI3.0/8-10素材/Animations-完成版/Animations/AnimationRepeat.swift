//
//  AnimationRepeat.swift
//  Animations
//
//  Created by Lebus on 2022/4/18.
//

import SwiftUI

struct AnimationRepeat: View {
    @State private var amount: CGFloat = 1
    
    var body: some View {
        //stroke:勾勒/描边--得到一个边框视图,中间是空的那种
        //Circle().stroke(.purple).frame(width: 300, height: 300)
        
        Button("抢红包") {}
        .foregroundColor(.white)
        .padding(50)
        .background(.red)
        .clipShape(Circle())
        .overlay {
            Circle().stroke(.red)
                .scaleEffect(amount)
                .opacity(Double(2 - amount))
                .animation(.easeOut(duration: 1).repeatForever(autoreverses: false), value: amount)
        }
        .onAppear { amount = 2 }
        
    }
}

struct AnimationRepeat_Previews: PreviewProvider {
    static var previews: some View {
        AnimationRepeat()
    }
}
