//
//  HGridView.swift
//  ShenZhou
//
//  Created by Lebus on 2022/5/20.
//

import SwiftUI

struct HGridView: View {
    var body: some View {
//        let simpleRows = Array(repeating: GridItem(.fixed(70)), count: 6)
        let rows = [GridItem()]

        GeometryReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows) {
                    ForEach(0..<50) { index in
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color(hue: 0.03 * Double(index), saturation: 1, brightness: 1))
                            .frame(width: proxy.size.width * 0.3)
                            .overlay(Text("\(index)"))
                    }
                }
                .frame(height: proxy.size.width * 0.3)
            }
        }
        
    }
}

struct HGridView_Previews: PreviewProvider {
    static var previews: some View {
        HGridView()
    }
}
