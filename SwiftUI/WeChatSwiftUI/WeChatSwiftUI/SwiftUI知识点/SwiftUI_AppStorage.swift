//
//  SwiftUI_AppStorage.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/11.
/**
    @AppStorage 包装器，将视图和本地存储绑定，当值有改变时，会主动存储在本地沙盒中
 */

import SwiftUI

struct SwiftUI_AppStorage: View {
    
    init() {
        print(NSHomeDirectory())
    }
    
//    @State private var content = ""
    @AppStorage("content") private var content  = ""
    var body: some View {
        
        Form {
            
            Section {
                TextField("输入存储的内容", text: $content)
                Text(content)
            }
        }
    }
}

struct SwiftUI_AppStorage_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUI_AppStorage()
    }
}
