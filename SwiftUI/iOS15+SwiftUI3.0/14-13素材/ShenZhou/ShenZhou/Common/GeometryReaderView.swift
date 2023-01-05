//
//  GeometryReaderView.swift
//  ShenZhou
//
//  Created by Lebus on 2022/5/20.
//

import SwiftUI

struct GeometryReaderView: View {
    var body: some View {
        VStack {
            GeometryReader { proxy in
                Rectangle()
                    .foregroundColor(.pink)
                    .frame(width: proxy.size.width / 2, height: proxy.size.height / 2)
            }
        }
//        .frame(width: 300, height: 300)
        .background(.green)
//        .ignoresSafeArea()
    }
}

struct GeometryReaderView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderView()
    }
}
