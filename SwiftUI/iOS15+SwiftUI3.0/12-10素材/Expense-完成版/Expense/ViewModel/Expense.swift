//
//  Expense.swift
//  Expense
//
//  Created by Lebus on 2022/5/4.
//

import Foundation

//ViewModel
class Expense: ObservableObject {
    @Published //向外发布,其他地方有人订阅(监测/观察)他的变化,一旦变化则刷新相关视图--State升级版
    var expenseItems = [
        ExpenseItem(name: "Lebus的教程", type: "教育培训", price: "800"),
        ExpenseItem(name: "MacBook", type: "数码电器", price: "15000"),
        ExpenseItem(name: "iPhone", type: "数码电器", price: "5000")
    ]
    
    func addItem(item: ExpenseItem) {
        expenseItems.append(item)
    }
    
    func deleteItem(item: ExpenseItem) {
        let index = expenseItems.firstIndex{ $0.id == item.id }!
        expenseItems.remove(at: index)
    }
    
    func editItem(draftItem: DraftExpenseItem) {
        
        let index = expenseItems.firstIndex { $0.id == draftItem.id }!
        let expenseItem = ExpenseItem(name: draftItem.name, type: draftItem.type, price: draftItem.price)
        expenseItems[index] = expenseItem
    }
    
    func updateHomeUI() {
        objectWillChange.send()
    }
}
