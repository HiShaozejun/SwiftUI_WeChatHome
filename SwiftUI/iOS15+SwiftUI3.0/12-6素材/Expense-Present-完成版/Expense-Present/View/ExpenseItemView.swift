//
//  ExpenseItemView.swift
//  Expense-Present
//
//  Created by Lebus on 2022/5/10.
//

import SwiftUI

struct ExpenseItemView: View {
    var expenseItem: ExpenseItem
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(expenseItem.name).font(.headline)
                Text(expenseItem.type)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(expenseItem.price)
        }
    }
}

struct ExpenseItemView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseItemView(expenseItem: ExpenseItem(name: "Lebus的教程", type: "教育培训", price: "800"))
    }
}
