//
//  EditView.swift
//  Expense-Present
//
//  Created by Lebus on 2022/5/10.
//

import SwiftUI

struct EditView: View {
    private let types = ["日用百货","餐饮美食","数码电器","教育培训","充值缴费"]
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var expense: Expense
   
    
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
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                    
                    dismiss() //同时具备pop
                } label: { Text("保存").foregroundColor(.primary) }
                .padding(.horizontal)
            }
            
        }
    }
}
