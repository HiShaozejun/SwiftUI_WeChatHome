//
//  ContentView.swift
//  Expense
//
//  Created by Lebus on 2022/5/1.
//

import SwiftUI
//Combine--负责在SwiftUI中处理数据的框架,已被默认包含在SwiftUI框架中了

struct ContentView: View {
    @State private var isUnread = true
    //@State private var showDetailView = false
    @EnvironmentObject var expense: Expense
    
    var body: some View {
        NavigationView {
            List(expense.expenseItems, id: \.id) { expenseItem in
                NavigationLink {
                    //相当于复制了一份用作草稿,之后用户在这个草稿上修改
                    //1.若点击保存,则让草稿item覆盖掉原件中的某个item(editItem方法)
                    //2.若点击返回,则让UI刷新一下,以便在此处按照当前最新原件重新复制一份,作为新一轮的草稿.
                    EditView(draftExpenseItem: DraftExpenseItem(expenseItem))
                } label: {
                    ExpenseItemView(expenseItem: expenseItem)
                }
                .swipeActions(edge: .leading) {
                    Button { print("切换未读已读") } label: {
                        if isUnread {
                            Label("标记为已读", systemImage: "envelope.open")
                        } else {
                            Label("标记为未读", systemImage: "envelope.badge")
                        }
                    }.tint(.blue)
                }
                .swipeActions {
                    Button(role: .destructive) {
                        expense.deleteItem(item: expenseItem)
                    } label: {
                        Label("删除账单", systemImage: "trash")
                    }
                    Button { print("标记账单") } label: {
                        Label("标记账单", systemImage: "flag")
                    }.tint(.orange)
                }
            }
            .navigationTitle("账单")
            .toolbar {
                NavigationLink {
                    AddView()
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.secondary)
                }.padding(.horizontal)
            }
        }
        .navigationViewStyle(.stack)
        //.sheet(isPresented: $showDetailView) { DetailView() }
        //.fullScreenCover(isPresented: $showDetailView) { DetailView() } //全屏
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Expense())
    }
}
