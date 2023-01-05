//
//  EditView.swift
//  Expense
//
//  Created by Lebus on 2022/5/8.
//

import SwiftUI

struct EditView: View {
    //private
    private let types = ["日用百货","餐饮美食","数码电器","教育培训","充值缴费"]
    @Environment(\.dismiss) var dismiss
    
    //可以被传过来的数据
    //@ObservedObject var expense: Expense
    @ObservedObject var draftExpenseItem: DraftExpenseItem
    @EnvironmentObject var expense: Expense
    
    //计算属性
    var body: some View {
        Form {
            Section("账单名") {
                TextField("收入或支出来源", text: $draftExpenseItem.name)
            }
            Section("账单分类") {
                Picker("选择一个分类", selection: $draftExpenseItem.type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
            }
            Section("账单金额") {
                TextField("收入或支出了多少", text: $draftExpenseItem.price)
                    .keyboardType(.numberPad)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("编辑账单")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    expense.updateHomeUI()
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left").foregroundColor(.primary)
                }
                .padding(.horizontal)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    expense.editItem(draftItem: draftExpenseItem)
                    
                    dismiss() //同时具备pop
                } label: { Text("保存").foregroundColor(.primary) }
                .padding(.horizontal)
            }
            
        }
    }
}
