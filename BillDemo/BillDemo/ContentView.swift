//
//  ContentView.swift
//  BillDemo
//
//  Created by shaozejun on 2023/1/9.


/**
  账单App
 
    
 @StateObject, 在实例化viewmodel时，使用改包装器，当视图重新初始化时，viewmodel并不会再次初始化，保证数据的正确性
 
 @ObservedObject，传值使用
 兄弟视图的State属性变化时，触发他的重新初始化构造，viewmodel类会重新初始化一次
 
 cell的删除 在ForEach中使用
*/

import SwiftUI

struct ContentView: View {
    
    // viewmodel定义
    @StateObject private var viewModel = BillViewModel()
    
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
                    print(indexSet)
                    viewModel.delete(indexSet: indexSet)
                }
            }
            .navigationBarTitle("账单")
            .toolbar {
                //添加账单
                NavigationLink {
                    BillAddView(viewModel: viewModel)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
