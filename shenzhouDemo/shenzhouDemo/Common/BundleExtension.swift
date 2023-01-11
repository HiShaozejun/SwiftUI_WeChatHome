//
//  BundleExtension.swift
//  shenzhouDemo
//
//  Created by shaozejun on 2023/1/11.
//

import Foundation

/**
    bundle扩展方法,使用泛型抽离需要解码的绑定对象
 */
extension Bundle {
    
    func deCoderFile<T: Codable>(fileName: String) -> [T] {
     
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json")else{
            fatalError("\(fileName)文件没有找到")
        }
        
        guard let data = try? Data(contentsOf: url) else{
            fatalError("\(fileName)资源获取失败")
        }
        
        let decoder = JSONDecoder()
        guard let dataArray = try? decoder.decode([T].self, from: data) else{
            fatalError("\(fileName)数据解析失败")
        }
        return dataArray
    }
}
