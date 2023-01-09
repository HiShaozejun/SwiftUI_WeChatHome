//
//  SwiftUI_Group.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/9.
/**
    Group只是负责包裹视图，不负责子视图的布局展示
 
 */

import SwiftUI

struct SwiftUI_Group: View {
    
    @State private var isLogin = false
    
    var body: some View {
        
        //规范写法
        Group {
            if isLogin {
                HomeView()
            }else{
                LoginView()
            }
        }
        
        // 一个Group最多只能放10个子视图
    }
}

struct HomeView: View {
    var body: some View {
        Text("首页")
    }
}

struct LoginView: View {
    var body: some View {
        Text("登陆")
    }
}

struct SwiftUI_Group_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUI_Group()
    }
}
