//
//  PlanVM.swift
//  ShenZhou
//
//  Created by Lebus on 2022/5/21.
//

import Foundation
class PlanVM {
    var plans: [Plan]
    init() {
        plans = Bundle.main.decode(kPlansJSONFile)
    }
}

//let xx: [Plan] = Bundle.main.decode("plans")
