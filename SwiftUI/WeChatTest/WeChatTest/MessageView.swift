//
//  MessageView.swift
//  WeChatTest
//
//  Created by shaozejun on 2023/1/5.
//

import SwiftUI

struct MessageView: View {
    
//    mock数据
    var listData:[MessageListModel] = {
        var list = [MessageListModel]()
        for i in 0...20 {
            let msg = MessageListModel(id: i,imageName: "hanbook", title: "我是\(i)行", detail: "我学习了\(i)年", date: "2023-1-1")
            list.append(msg)
        }
        return list
    }()
    
    var body: some View {
        
        //增加导航
        NavigationView {
            
            List {
                
                ForEach(listData) { element in
                   
                    ZStack{
                     
                        NavigationLink {
                            Text("我是\(element.title)")
                            
                        } label: {
                            EmptyView()
                        }.opacity(0)
                        
                        HStack(alignment: .top) {
                            
                            Image(element.imageName)
                                .resizable().scaledToFit()
                                .frame(width: 80,height: 80)
                                .cornerRadius(15)
                            
                            VStack(alignment: .leading) {
                                Text(element.title).font(.system(size: 20)).foregroundColor(.primary)
                                Text(element.detail).font(.system(size: 17)).foregroundColor(.secondary)
                            }.padding([.top],3)
                            
                            Spacer(minLength: 10)
                            
                            Text(element.date).foregroundColor(.secondary).font(.system(size: 14))
                        }
                    }
                }
                
            }.listStyle(.plain)
            .navigationTitle("微信")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button {
                    } label: {
                        Image(systemName: "plus.circle").foregroundColor(.primary)
                    }
                }
            }
        }
        
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
