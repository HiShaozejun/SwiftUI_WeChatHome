//
//  FindView.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/5.
//

import SwiftUI

struct FindView: View {
    var body: some View {
        
        NavigationView {
            Text("发现页面")
                .navigationTitle("发现")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FindView_Previews: PreviewProvider {
    static var previews: some View {
        FindView()
    }
}
