//
//  SZDivider.swift
//  ShenZhou
//
//  Created by Lebus on 2022/5/22.
//

import SwiftUI

struct SZDivider: View {
    var color = kLightBGColor
    var width: CGFloat = 2
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: width)
            .padding(.vertical)
    }
}

struct SZDivider_Previews: PreviewProvider {
    static var previews: some View {
        SZDivider()
    }
}
