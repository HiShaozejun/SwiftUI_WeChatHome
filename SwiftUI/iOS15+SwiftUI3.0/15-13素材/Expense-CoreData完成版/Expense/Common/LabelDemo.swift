//
//  LabelDemo.swift
//  Expense
//
//  Created by Lebus on 2022/5/11.
//

import SwiftUI

struct LabelDemo: View {
    var body: some View {
        VStack(spacing: 20) {
            Label("晴天", systemImage: "sun.max")
                .font(.largeTitle)
                .labelStyle(.titleAndIcon)
            
            Label {
                Text("Lebus").font(.title)
                Text("iOS开发工程师").font(.body).foregroundColor(.secondary)
            } icon: {
                Circle()
                    .fill(.green)
                    .frame(width: 55, height: 55)
                    .overlay(
                        Text("L")
                            .font(.title)
                            .foregroundColor(.white)
                    )
            }

        }
        
    }
}

struct LabelDemo_Previews: PreviewProvider {
    static var previews: some View {
        LabelDemo()
    }
}
