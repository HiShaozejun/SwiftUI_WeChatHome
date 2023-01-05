//
//  ExpenseItem.swift
//  Expense-Present
//
//  Created by Lebus on 2022/5/10.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    var name: String
    var type: String
    var price: String
}
