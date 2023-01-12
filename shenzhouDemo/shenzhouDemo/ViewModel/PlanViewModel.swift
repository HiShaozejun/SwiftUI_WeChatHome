//
//  PlanViewModel.swift
//  shenzhouDemo
//
//  Created by shaozejun on 2023/1/11.
//

import Foundation

class PlanViewModel {
    
    var plans: [PlanModel] = [PlanModel]()
//    var plans: [Plan] = [Plan]()
    
    init () {
        
        self.plans = Bundle.main.deCoderFile(fileName: KPlansFileName)
        print(self.plans)
    }
    
}
