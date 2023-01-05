//
//  ContentView.swift
//  Expense-Present
//
//  Created by Lebus on 2022/5/10.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expense = Expense()
    var body: some View {
        NavigationView {
            List {
                ForEach(expense.expenseItems) { expenseItem in
                    Button {
                        
                    } label: {
                        ExpenseItemView(expenseItem: expenseItem)
                    }
                }
            }.navigationTitle("账单")
        }
        .navigationViewStyle(.stack)
        //.sheet(isPresented: $showDetailView) { DetailView() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
