//
//  DetailView.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/5.
//

import SwiftUI

struct DetailView: View {
    
    let navTitle: String
    var body: some View {
        
        NavigationLink {
            
        } label: {
            Text("Hello, World!").navigationTitle(navTitle)
        }
    }
}

