//
//  SwiftUIView-ForEach.swift
//  WeChatHomeView
//
//  Created by Lebus on 2022/3/26.
//

import SwiftUI

struct SwiftUIView_ForEach: View {
    
    var arr = [1,2,3,4]
    
    var messages: [Message] = {
        var messages: [Message] = []
        for i in 1...3 {
            let message = Message(
                id: i,
                imageName: "JackMa",
                nickName: "马云\(i)",
                messageText: "花呗还了吗\(i)",
                messageDate: "上午 6:00"
            )
            messages.append(message)
        }
        return messages
    }()
    
    var body: some View {
        
        //ForEach-对半闭区间循环
//        VStack(alignment: .leading) {
//            ForEach(1..<5) { i in
//                Text("\(i)").font(.largeTitle)
//            }
//        }
        
        //ForEach-对数组循环
        //需给数组中每个元素指定一个唯一标识符
        //1.若数组中元素为Swift简单类型(需遵循Hashable协议,即可算出哈希值的),则可指定\.self,即本身作为唯一标识符
        //2.若数组中元素为复杂的对象类型,则可指定\.xx(xx为他下面的简单类型的属性),或在model处遵循identifiable协议
        
//        VStack {
//            ForEach(arr, id: \.self) { i in
//                Text("\(i)").font(.largeTitle)
//            }
//        }
        
        VStack {
            ForEach(messages) { message in
                Text("\(message.nickName)").font(.largeTitle)
            }
        }
      
    }
}

struct SwiftUIView_ForEach_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_ForEach()
    }
}
