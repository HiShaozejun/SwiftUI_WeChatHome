//
//  Expense.swift
//  Expense-Present
//
//  Created by Lebus on 2022/5/10.
//

import Foundation

class Expense: ObservableObject {
    @Published
    var expenseItems = [
        ExpenseItem(name: "Lebus的教程", type: "教育培训", price: "800"),
        ExpenseItem(name: "MacBook", type: "数码电器", price: "15000"),
        ExpenseItem(name: "iPhone", type: "数码电器", price: "5000")
    ]
    
    func editItem(draftItem: ExpenseItem) {
        let index = expenseItems.firstIndex { $0.id == draftItem.id }!
        expenseItems[index] = draftItem
    }
    
}
