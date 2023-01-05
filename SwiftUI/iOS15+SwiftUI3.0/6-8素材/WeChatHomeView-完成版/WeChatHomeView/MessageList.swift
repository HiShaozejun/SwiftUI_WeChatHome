//
//  MessageList.swift
//  WeChatHomeView
//
//  Created by Lebus on 2022/3/20.
//

import SwiftUI

//SwiftUI使用的是声明式语法(UIKit中是命令式语法)
//修饰符modifier(可以设定属性,添加手势等)--可链式调用(有些需注意顺序)
//像Text,Button,Image等这种有内容的视图,如不设定宽高,则宽高由里面的内容决定.可把这类视图理解成现实中的相框,里面的内容就是照片

//初步了解一下协议protocol

struct MessageList: View {
    
    var messages: [Message] = {
        var messages: [Message] = []
        for i in 1...20 {
            let message = Message(
                id: i,
                imageName: "JackMa",
                nickName: "马云\(i)",
                messageText: "花呗还了吗\(i)",
                messageDate: "上午 6:00"
            )
            messages.append(message)
        }
        
        return messages
    }()
    
    var body: some View {
        
        //NavigationView本身只是个容器,不渲染页面,由他里面的页面进行UI的展示
        //NavigationView上面的bar叫做navigationBar,里面每个子视图上面的bar叫做navigationItem(SwiftUI中称作toolbar)
        //故要调整navigationItem里面的东西的话需要给里面的视图加修饰符,而不是外面的NavigationView
        NavigationView {
            List(messages) { message in
                
                ZStack {
                    NavigationLink {
                        MessageDetail(title: message.nickName)
                    } label: {
                        EmptyView()
                    }.opacity(0)
                    MessageRow(message: message)
                }
                
//                NavigationLink {
//                    MessageDetail(title: message.nickName)
//                } label: {
//                    MessageRow(message: message)
//                }
            }
            .listStyle(.plain)
            .navigationTitle("微信")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                //默认放在navigationItem的右边(手机里的设置是从左往右的阅读习惯的国家的时候)
                Button {
                    print("popover弹出框")
                } label: {
                    Image(systemName: "plus.circle").foregroundColor(.primary)
                }.padding(.horizontal)
                
                //如需在navigationItem左右放单个视图则用ToolbarItem包起来(可写多个ToolbarItem)
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Text("xx")
//                }
                //如需在navigationItem左右放多个视图则用ToolbarItemGroup包起来(可写多个ToolbarItemGroup)
//                ToolbarItemGroup(placement: .navigationBarLeading) {
//                    Text("xx")
//                    Image(systemName: "plus.circle")
//                }
            }
            
        }
        //强制指定所有的设备上都使用堆叠style,此处用来去除布局约束冲突的提示
        .navigationViewStyle(.stack)
        .tabItem {
            Image(systemName: "message.fill")
            Text("微信")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MessageList()
    }
}



