//
//  BillAddView.swift
//  BillDemo
//
//  Created by shaozejun on 2023/1/9.
//

import SwiftUI

struct BillAddView: View {
    
    //dismiss 和 pop操作
    @Environment(\.dismiss) private var dismissAction
    
    @FocusState private var isFocus: Bool
    @State private var tf_sources: String = ""
    @State private var tf_money: String = ""
    @State private var tf_picker: String = "日用百货"
    private let types = ["日用百货","餐饮美食","数码电器","教育培训","充值话费"];
    
    //普通的传值处理
//    @Binding var listData: [BillModel]
    
    //传值的时候需要使用ObservedObject包装器修饰viewmodel
    @ObservedObject var viewModel: BillViewModel
    
    //全局的环境中获取viewmodel，前提保证已经被注入
//    @EnvironmentObject var viewModel: BillViewModel
    
    var editModel: BillModel?
    // 是否编辑状态
    var isEditState:Bool {
        return editModel != nil
    }
    
    //model在集合中的索引
    var modelIndex: Int? {
        viewModel.listData.firstIndex { item in
            return item.id == editModel?.id
        }
    }
    
    var body: some View {
        
        Form {
            Section("账单名") {
                TextField("收入或者支出来源", text: $tf_sources).focused($isFocus)
            }
            Section("账单分类") {
                
                Picker("选择一个分类", selection: $tf_picker) {
                    ForEach(types,id: \.self) { val in
                        Text(val)
                    }
                }
            }
            
            Section("账单金额") {
                TextField("收入或者支出金额", text: $tf_money).keyboardType(.numberPad)
            }
        }.toolbar {
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    // dismiss
                    dismissAction()
                    
                } label: {
                    Image(systemName: "arrow.left").foregroundColor(.primary)
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                //保存或者编辑
                Button {
                    
                    if(isEditState){
                        
                        viewModel.listData[modelIndex!].billName = tf_sources;
                        viewModel.listData[modelIndex!].billType = tf_picker;
                        viewModel.listData[modelIndex!].billMoney = tf_money;
                        dismissAction()
                        
                    }else{
                        if (isValidData()){
                            viewModel.addData(source: tf_sources, category: tf_picker, money: tf_money)
                            dismissAction()
                        }
                    }
                    
                } label: {
                    Text(isEditState ? "编辑保存" : "保存").font(.system(size: 16))
                        .foregroundColor(.primary)
                        .fontWeight(.bold)
                }
            }
        }
        .onAppear(){
            isFocus = true
            
            //编辑初始值方法一：
            if(isEditState){
                tf_sources = (editModel?.billName)!
                tf_picker = (editModel?.billType)!
                tf_money = (editModel?.billMoney)!
            }
        }
        .navigationTitle(isEditState ? "编辑账单": "添加账单")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
    
    
    func isValidData() -> Bool {
        
        if (tf_sources.isEmpty || tf_picker.isEmpty || tf_money.isEmpty){
            return false
        }
        return true
    }
}

//struct BillAddView_Previews: PreviewProvider {
//    static var previews: some View {
//        BillAddView()
//    }
//}
