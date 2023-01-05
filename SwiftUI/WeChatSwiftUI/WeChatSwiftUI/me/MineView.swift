//
//  MineView.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/5.
//

import SwiftUI

struct MineView: View {
    var body: some View {
        
        NavigationView {
            Text("我的页面")
                .navigationTitle("我的")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MineView_Previews: PreviewProvider {
    static var previews: some View {
        MineView()
    }
}
