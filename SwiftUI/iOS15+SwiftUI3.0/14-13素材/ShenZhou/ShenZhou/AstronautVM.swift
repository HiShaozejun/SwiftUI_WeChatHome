//
//  AstronautVM.swift
//  ShenZhou
//
//  Created by Lebus on 2022/5/25.
//

import Foundation

class AstronautVM {
    var astronauts: [Astronaut]
    init() {
        astronauts = Bundle.main.decode(kAstronautsJSONFile)
    }
}
