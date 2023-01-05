//
//  DraftExpenseItem.swift
//  Expense
//
//  Created by Lebus on 2022/5/8.
//

import Foundation

class DraftExpenseItem: ObservableObject {
    @Published var id: String
    @Published var name: String
    @Published var type: String
    @Published var price: String
    
    init(_ expenseItem: ExpenseItem) {
        //print("xx")
        id = expenseItem.id!
        name = expenseItem.name!
        type = expenseItem.type!
        price = expenseItem.price!
    }
}
