//
//  Expense.swift
//  Expense
//
//  Created by Lebus on 2022/5/4.
//

import Foundation

let kExpenseItemsKey = "ExpenseItemsKey"

//ViewModel
class Expense: ObservableObject {
    let viewContext = PersistenceController.shared.container.viewContext
    
    @Published //向外发布,其他地方有人订阅(监测/观察)他的变化,一旦变化则刷新相关视图--State升级版
    var expenseItems: [ExpenseItem] = [
//        ExpenseItem(name: "Lebus的教程", type: "教育培训", price: "800"),
//        ExpenseItem(name: "MacBook", type: "数码电器", price: "15000"),
//        ExpenseItem(name: "iPhone", type: "数码电器", price: "5000")
    ]

    init() {
        print(NSHomeDirectory())

        getItems()
    }
    
    func getItems() {
        let request = ExpenseItem.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "updatedAt", ascending: false)]
        
        do {
            expenseItems = try viewContext.fetch(request)
        } catch {
            fatalError("从SQLite里面取数据失败: \(error)")
        }
    }

    func addItem(name: String, type: String, price: String) {
        //expenseItems.append(item)
        let expenseItem = ExpenseItem(context: viewContext)
        expenseItem.id = UUID().uuidString
        expenseItem.name = name
        expenseItem.type = type
        expenseItem.price = price
        expenseItem.updatedAt = Date()
        
        saveViewContext()
        
        getItems()
    }

    func deleteItem(item: ExpenseItem) {
        viewContext.delete(item)
        saveViewContext()
        getItems()
    }

    func editItem(draftItem: DraftExpenseItem) {

        let index = expenseItems.firstIndex { $0.id == draftItem.id }!
        let expenseItem = expenseItems[index]
        expenseItem.name = draftItem.name
        expenseItem.type = draftItem.type
        expenseItem.price = draftItem.price
        expenseItem.updatedAt = Date()
        
        saveViewContext()
        getItems()
        
    }

    func updateHomeUI() {
        objectWillChange.send()
    }
    
    
}


extension Expense {
    func saveViewContext() {
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
