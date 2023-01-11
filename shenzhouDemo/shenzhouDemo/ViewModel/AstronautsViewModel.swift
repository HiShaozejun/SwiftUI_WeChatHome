//
//  AstronautsViewModel.swift
//  shenzhouDemo
//
//  Created by shaozejun on 2023/1/11.
//

import Foundation

class AstronautsViewModel {
    
    var astronautsData: [AstronautsModel]
    
    init() {
        self.astronautsData = Bundle.main.deCoderFile(fileName: KAstronautsFileName)
    }
}
