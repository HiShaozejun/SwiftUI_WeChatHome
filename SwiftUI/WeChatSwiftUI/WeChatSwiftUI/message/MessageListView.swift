//
//  MessageListView.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/5.
//

import SwiftUI

/**
    MessageListView遵循View的协议
 */
struct MessageListView: View {
    
    @EnvironmentObject private var stateBar: TabViewState
    
    @State private var isShowDetail = false
    // 测试数据
    var message: [MessageInfoModel] = {
        var list = [MessageInfoModel]();
        for i in 0...20 {
            let model = MessageInfoModel(id:i,iconName: "hanbook", title: "我叫jason\(i)", subTitle: "我从事iOS开发已经\(i)年", date: "2023-1-7")
            list.append(model)
        }
        return list
    }()
    
    var body: some View {
        
        // 添加导航
        if #available(iOS 16.0, *) {
            NavigationView {
                
                List(message) { message in
                    // push事件，NavigationLink包裹之后，会存在箭头，
                    //                NavigationLink {
                    //                    // 分离详情页
                    //                    DetailView(navTitle: message.title)
                    //                } label: {
                    //                    // view抽离
                    //                    ListRowView(message: message)
                    //                }
                    
                    //移除row右侧的箭头,三维空间堆叠，设置opacity
                    ZStack {
                        
                        NavigationLink(isActive: $stateBar.taBarHidden) {
                            DetailView(navTitle: message.title)
                        } label: {
                            EmptyView()
                        }.opacity(0)
                        
                        ListRowView(message: message)
                    }
                } //设置List的样式，默认是卡片的样式，两边留有间距
                .listStyle(.plain)
                .navigationTitle(Text("WeChat"))//设置导航标题，默认为大标题，居左
                .navigationBarTitleDisplayMode(.inline)//调整为居中的小标题
                
                //导航添加右侧按钮item
                .toolbar {
                    //带图标的button
                    Button {
                        print("button被点击了")

                        
                    } label: {
                        //存放button内容,例如使用系统图标库
                        Image(systemName: "plus.circle").foregroundColor(.primary)
                        
                    }.padding(.horizontal,5)
                }
            }
            .toolbar(stateBar.taBarHidden ? .hidden : .automatic, for: .tabBar)
        }
    }
}

/**
    用来预览使用
 */
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MessageListView()
    }
}
