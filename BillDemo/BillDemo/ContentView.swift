//
//  ContentView.swift
//  BillDemo
//
//  Created by shaozejun on 2023/1/9.


/**
  账单App
 
    
 @StateObject, 在实例化viewmodel时，使用该包装器，当视图重新初始化时，viewmodel并不会再次初始化，保证数据的正确性
 
 @ObservedObject，传值使用
 兄弟视图的State属性变化时，触发他的重新初始化构造，viewmodel类会重新初始化一次
 
 cell的删除 在ForEach中使用 onDelete
 
 swipeActions使用
 
 在 .environmentObject(viewModel),注入对象到系统环境中，通过NavigationLink push到的所有子视图可以通过 @EnvironmentObject全局系统环境中获取到，如果获取不到容易导致 crash，所以在获取的时，要保证在父视图中已经注入了该对象。
 .environmentObject（）主要是针对 NavigationView、TabView、present弹出
 在最新版本的SwiftUI中，present弹出视图也可以通过 @EnvironmentObject获取上个页面注入的对象
 
*/

import SwiftUI

/**账单App**/
struct ContentView: View {
    
    // viewmodel定义
    @StateObject private var viewModel = BillViewModel()
    
    //启动App注入，在这从环境中获取
//    @EnvironmentObject var viewModel: BillViewModel
    
    @State private var present: Bool = false
    
    var body: some View {
        
        NavigationView {
         
            List() {
                
                ForEach(viewModel.listData) { datum in
                    //cell点击
                    NavigationLink {
                        //编辑
                        BillAddView(viewModel: viewModel,editModel: datum)
                        
                    } label: {
                        BillRowView(billName: datum.billName!, billType: datum.billType!, billMoney: datum.billMoney!)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                }.onDelete { indexSet in
                    //删除
                    viewModel.delete(indexSet: indexSet)
                }
            }
            .navigationBarTitle("账单")
            .toolbar {
                //添加账单
                NavigationLink {
                    //普通传值
                    BillAddView(viewModel: viewModel)
                    
                    //全局注入方式,子页面从环境中获取不在需要传值
//                    BillAddView()
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.primary)
                }
            }
            .foregroundColor(.primary)
            .font(.system(size: 24))
            
        }
        // 全局环境中注入对象，push后面的所有子视图都可以使用到，避免了层层的传递
//        .environmentObject(viewModel)
    }
}

/**
    演示Present弹出方式
 */
struct PresentContentView:View {
    
    @State private var listData: [BillModel] = [BillModel]()
    @State private var present: Bool = false
    
    var body: some View {
        
        NavigationView {
         
            List(listData) { datum in
                
                BillRowView(billName: datum.billName!, billType: datum.billType!, billMoney: datum.billMoney!)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            .navigationBarTitle("账单")
            .toolbar {
                // 模态化控制
                Button {
                    present = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .foregroundColor(.primary)
            .font(.system(size: 24))
        }
        // 模态化弹出vc
//        .sheet(isPresented: $present) {
//            BillAddView()
//        }
        //全屏模态化弹出
        .fullScreenCover(isPresented: $present) {
//            BillAddView(listData: $listData)
        }
    }
}

/*
    通过Swipe添加删除功能
 */
struct SwipeContentView: View {
    
    // viewmodel定义
    @StateObject private var viewModel = BillViewModel()
    
    @State private var present: Bool = false
    
    var body: some View {
        
        NavigationView {
         
            List(viewModel.listData) { item in
                //cell点击
                NavigationLink {
                    
                } label: {
                    BillRowView(billName: item.billName!, billType: item.billType!, billMoney: item.billMoney!)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
                //删除
                .swipeActions(edge: .trailing, allowsFullSwipe: false, content: {
                    
                    Button {
                        print("delete")
                    } label: {
                        Image(systemName: "trash")
                    }.tint(.red)
                })
                
                .swipeActions(edge: .leading, allowsFullSwipe: false) {
                    Button {
                        
                    } label: {
                        Label("标记为已读", systemImage: "envelope.open")
                    }.tint(.orange)
                }
                
            }
            
            .navigationBarTitle("账单")
            .toolbar {
                //添加账单
                NavigationLink {
//                    BillAddView(viewModel: viewModel)
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.primary)
                }
            }
            .foregroundColor(.primary)
            .font(.system(size: 24))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
        
        //全局环境注入的方式
//        ContentView().environmentObject(BillViewModel())
    }
}
