//
//  Plan.swift
//  shenzhouDemo
//
//  Created by shaozejun on 2023/1/11.
//

import Foundation

struct PlanModel: Codable, Identifiable {
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

/**
    解析遵循: Codable
    循环遵循: Identifiable
*/
struct Plan: Codable, Identifiable {

    let id: Int
    let name: String
    let launchDate: String
    let description: String
    let hasBadge: Bool
    var members: [Member]?

    var imageName: String { hasBadge ? "shenzhou\(id)" : "placeholder"}
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case launchDate
        case description
        case hasBadge
        case members
     }

    struct Member: Codable, Identifiable {
        let id = 1
        let name: String
        let birth: String

        enum CodingKeys: String, CodingKey {
            case name
            case birth
         }

        init(from decoder: Decoder) throws {
            let container: KeyedDecodingContainer<Plan.Member.CodingKeys> = try decoder.container(keyedBy: Plan.Member.CodingKeys.self)
            self.name = try container.decode(String.self, forKey: .name)
            self.birth = try container.decode(String.self, forKey: .birth)
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.launchDate = try container.decode(String.self, forKey: .launchDate)
        self.description = try container.decode(String.self, forKey: .description)
        self.hasBadge = try container.decode(Bool.self, forKey: .hasBadge)
//        self.members = try container.decode([Member].self, forKey: .members)
        self.members = try container.decodeIfPresent([Member].self, forKey: .members)
    }
    
    
    
}

