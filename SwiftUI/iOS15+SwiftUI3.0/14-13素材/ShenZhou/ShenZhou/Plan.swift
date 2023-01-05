//
//  Plan.swift
//  ShenZhou
//
//  Created by Lebus on 2022/5/21.
//

import Foundation

struct Plan: Codable, Identifiable {
    let id: Int
    let name: String
    let launchDate: String
    let description: String
    let hasBadge: Bool
    
    let members: [Member]?
    
    struct Member: Codable {
        let name: String
        let birth: String
    }
    
    var imageName: String { hasBadge ? "shenzhou\(id)" : "placeholder"}
}

