//
//  PlanViewModel.swift
//  shenzhouDemo
//
//  Created by shaozejun on 2023/1/11.
//

import Foundation

class PlanViewModel {
    
    var plans: [PlanModel] = [PlanModel]()
    
    init () {
        
        self.plans = Bundle.main.deCoderFile(fileName: KPlansFileName)
        
    }
    
}
