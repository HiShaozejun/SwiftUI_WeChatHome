//
//  BillViewModel.swift
//  BillDemo
//
//  Created by shaozejun on 2023/1/9.
/**
 ViewModel  定义为 class类型,并且需要遵守 ObservableObject协议
 属性的定义使用 @Published包装器，存储的数据或者定义的变量类型必须是值类型
 */

import Foundation

class BillViewModel: ObservableObject{
    //使用Published包装器,主要是负责视图的刷新操作，也可以手动刷新 objectWillChange.send()
    @Published
    var listData: [BillModel] = [BillModel]()
    
    @Published
    var page: Int = 0
    
    func addData(source: String,category:String,money: String) -> Void {
        let bill = BillModel(billName: source,billType: category,billMoney: money)
        listData.append(bill)
        //通知视图刷新
        objectWillChange.send()
    }
    
    func delete(indexSet: IndexSet) -> Void {
        listData.remove(atOffsets: indexSet)
        //通知视图刷新
//        objectWillChange.send()
    }
    
}
