//
//  BillModel.swift
//  BillDemo
//
//  Created by shaozejun on 2023/1/9.
//

import Foundation

struct BillModel: Identifiable {
    
    var id = UUID()
    var billName: String?
    var billType:String?
    var billMoney: String?
    
}
