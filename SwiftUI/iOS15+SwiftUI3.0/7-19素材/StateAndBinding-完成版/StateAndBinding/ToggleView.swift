//
//  ToggleView.swift
//  StateAndBinding
//
//  Created by Lebus on 2022/4/8.
//

import SwiftUI

struct ToggleView: View {
    //数据-->视图
    //视图-->数据
    @State private var isOn = false
    var body: some View {
        Toggle("深色模式", isOn: $isOn).padding()
    }
}

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView()
    }
}
