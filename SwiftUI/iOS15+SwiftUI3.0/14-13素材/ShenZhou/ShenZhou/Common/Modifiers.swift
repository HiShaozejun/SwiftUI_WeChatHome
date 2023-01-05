//
//  Modifiers.swift
//  ShenZhou
//
//  Created by Lebus on 2022/5/25.
//

import SwiftUI

struct BoldTitleWithPadding: ViewModifier {
    let edges: Edge.Set
    func body(content: Content) -> some View {
        content
            .font(.title.bold())
            .padding(edges, 5)
    }
}

extension View {
    func boldTitleWithPadding(_ edges: Edge.Set = .bottom) -> some View {
        modifier(BoldTitleWithPadding(edges: edges))
    }
}
