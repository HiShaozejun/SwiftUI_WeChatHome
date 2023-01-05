//
//  Bundle-Decodable.swift
//  ShenZhou
//
//  Created by Lebus on 2022/5/25.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> [T] {
        
        guard let url = Bundle.main.url(forResource: file, withExtension: "json") else {
            fatalError("没有在项目里面找到\(file)文件")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("加载\(file)文件失败")
        }
        
        let decoder = JSONDecoder()
        guard let datas = try? decoder.decode([T].self, from: data) else {
            fatalError("\(file)文件JSON解码失败")
        }
        
        return datas
    }
}

