//
//  ContactsView.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/5.
//

import SwiftUI

struct ContactsView: View {
    var body: some View {
        
        NavigationView {
            Text("通讯录页面")
                .navigationTitle("通讯录")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
