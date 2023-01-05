//
//  MeView.swift
//  WeChatTest
//
//  Created by shaozejun on 2023/1/5.
//

import SwiftUI

struct MeView: View {
    var body: some View {
        NavigationView {
            Text("我的")
                .navigationTitle("我的")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
