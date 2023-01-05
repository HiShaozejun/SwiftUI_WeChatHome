//
//  AppStorageDemo.swift
//  Expense
//
//  Created by Lebus on 2022/5/28.
//

import SwiftUI

struct AppStorageDemo: View {
    //@State var nickName = ""
    @AppStorage("nickName") var nickName = ""
    @AppStorage("isDarkMode") var isDarkMode = false
    var body: some View {
        Form {
            Section {
                TextField("输入昵称", text: $nickName)
                Text(nickName)
            }
            Section {
                Toggle("深色模式", isOn: $isDarkMode)
            }
        }
    }
}

struct AppStorageDemo_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageDemo()
    }
}
