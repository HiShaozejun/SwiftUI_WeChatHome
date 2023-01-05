//
//  AnimationSpring.swift
//  Animations
//
//  Created by Lebus on 2022/4/16.
//

import SwiftUI

struct AnimationSpring: View {
    @State private var moveDistance: CGFloat = 0
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Image(systemName: "heart")
                    .font(.system(size: 50))
                    .offset(x: moveDistance, y: 0)
                    //response--刚度/柔和度,dampingFraction--阻尼/摩擦力
                    .animation(.spring(response: 0.2, dampingFraction: 0.2), value: moveDistance)
                    //.animation(.interpolatingSpring(mass: 2, stiffness: 170, damping: 10, initialVelocity: 10), value: isLike)
                Spacer()
            }
            Button("点击移动爱心") {
                moveDistance += 80
            }.font(.title)
        }
    }
}

struct AnimationSpring_Previews: PreviewProvider {
    static var previews: some View {
        AnimationSpring()
    }
}
