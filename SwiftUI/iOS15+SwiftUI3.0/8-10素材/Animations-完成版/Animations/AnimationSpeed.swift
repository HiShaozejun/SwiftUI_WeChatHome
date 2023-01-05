//
//  AnimationSpeed.swift
//  Animations
//
//  Created by Lebus on 2022/4/16.
//

import SwiftUI

struct AnimationSpeed: View {
    @State private var moveDistance: CGFloat = 0
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Image(systemName: "heart")
                    .font(.system(size: 50))
                    .offset(x: moveDistance, y: 0)
                    //缓进缓出easeInOut
                    .animation(.easeIn(duration: 4), value: moveDistance)
                Spacer()
            }
            Button("点击移动爱心") {
                moveDistance += 80
            }.font(.title)
        }
    }
}

struct AnimationSpeed_Previews: PreviewProvider {
    static var previews: some View {
        AnimationSpeed()
    }
}
