//
//  SwiftUI_ForEach.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/5.
/**
    ForEach学习
 
    在使用
    ForEach(<#T##data: Range<Int>##Range<Int>#>, content: <#T##(Int) -> View#>)
    Range为半开区间 例如：0..<10
 */

import SwiftUI


struct SwiftUI_ForEach: View {
    
    let array:[Int] = [1,2,3,4]
    
    // 自定义类1
    var message: [MessageInfoModel] = {
        var list = [MessageInfoModel]();
        for i in 0...20 {
            let model = MessageInfoModel(id:i,iconName: "hanbook", title: "我叫jason\(i)", subTitle: "我从事iOS开发已经\(i)年", date: "2023-1-7")
            list.append(model)
        }
        return list
    }()
    
    //自定义类2
    var foreach: [ForEachModel] = {
        var list = [ForEachModel]();
        for i in 0...20 {
            let model = ForEachModel()
            list.append(model)
        }
        return list
    }()
    
    var body: some View {
        
        VStack(alignment: .leading, content: {
            
            //ForEach的基本使用
//            ForEach(0..<10) { index in
//                Text("Hello, World!")
//            }
            
//            Referencing initializer 'init(_:content:)' on 'ForEach' requires that 'Int' conform to 'Identifiable', 需要数组中的每一个Int类型的元素，遵循Identifiable协议
            
            // 解决方式一： \. 表示集合中的每一个元素； \.self 表示让集合中的每一个元素自己作为唯一表示符id，swift中的数据类型遵循了Hasable协议
            ForEach(array,id: \.self) { element in
                Text("Hello, World!")
            }
            
            //解决方式二 如果是自定义类型的集合，是不可以使用\.self,需要自定义元素，遵循hashable协议,可以是使用自定义元素中的属性作为id标识
            ForEach(message,id: \.title) { message in
                Text(message.iconName)
            }
            
            //解决方式三： 自定义model遵循Identifiable协议，实现id属性
            ForEach(foreach) { model in
                Text("我是自定义类")
            }
            
        })
    }
}

struct SwiftUI_ForEach_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUI_ForEach()
    }
}
