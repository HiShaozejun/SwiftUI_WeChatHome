//
//  Transitions.swift
//  Animations
//
//  Created by Lebus on 2022/4/20.
//

import SwiftUI

struct Transitions: View {
    @State private var show = false
    var body: some View {
        VStack(spacing: 100) {
            Button {
                withAnimation { show.toggle() }
            } label: {
                Text(show ? "隐藏图片" : "展示图片")
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 15, leading: 30, bottom: 15, trailing: 30))
                    .background(.pink)
                    .cornerRadius(8)
            }
            
            VStack {
                if show {
                    Image(systemName: "sun.max.fill")
                        .font(.system(size: 250))
                        .foregroundColor(.yellow)
                        //淡入fade
                        //.transition(.slide.combined(with: .opacity))
                        .transition(
                            .asymmetric(
                                insertion: .slide.combined(with: .opacity),
                                removal: .move(edge: .bottom).combined(with: .opacity))
                        )
                }
                Spacer()
            }
           
        }
        //.animation(.linear(duration: 2), value: show)

    }
}

struct Transitions_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Transitions()
        }
    }
}
