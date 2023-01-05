//
//  ContentView.swift
//  Animations
//
//  Created by Lebus on 2022/4/16.
//

import SwiftUI

//.animation--隐式动画Implicit Animations
//withAnimation--显式动画Explicit Animations
struct LikeBtn: View {
    
    @State private var isLike = false
    var body: some View {
        Image(systemName: isLike ? "heart.fill" : "heart")
            .font(.system(size: 100))
            .foregroundColor(isLike ? .red : .black)
            .scaleEffect(isLike ? 1.5 : 1)
            .animation(.spring(response: 0.2, dampingFraction: 0.2), value: isLike)
            .onTapGesture {
                //withAnimation {
                    isLike.toggle()
                //}
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LikeBtn()
    }
}
