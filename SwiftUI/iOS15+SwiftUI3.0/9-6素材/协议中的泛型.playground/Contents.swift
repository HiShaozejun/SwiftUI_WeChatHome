import SwiftUI

protocol ModelProtocol {
    associatedtype Item
    var count: Int { get }
    mutating func add(_ item: Item)
}

struct Model: ModelProtocol {
    
    var items: [Int] = []
    
//    typealias Item = Int
    var count: Int { items.count }
    mutating func add(_ item: Int) {
        items.append(item)
    }
}



