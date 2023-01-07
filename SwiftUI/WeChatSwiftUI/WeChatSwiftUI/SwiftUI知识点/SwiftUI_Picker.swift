//
//  SwiftUI_Picker.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/6.

/**
    Picker学习
 */

import SwiftUI

struct SwiftUI_Picker: View {
    
    @State private var toolList = ["飞机","高铁","轮船"]
    
    //Picker
    @State private var pickVal: Int = 0
    @State private var pickVal2: Int = 0
    
    // 在获取数据的时候，确保selection和 id对应，方便取值
    @State private var pickVal3: Int = 0
    @State private var pickVal4: String = "飞机"
    
    var body: some View {
        
        NavigationView {
            
            Form {
                Section("ForEach") {
                    Picker("请选择交通工具", selection: $pickVal3) {
                        // 使用$pickVal3
                        ForEach(toolList.indices,id: \.self) { index in
                            Text(toolList[index])
                        }
                        // 使用$pickVal4
//                        ForEach(toolList,id: \.self) { element in
//                            Text(element)
//                        }
                    }
                    .pickerStyle(.inline)
                }
                
                Section("默认样式") {
                   Picker(selection: $pickVal) {
                       Text("飞机").tag(0)
                       Text("火车").tag(1)
                       Text("轮船").tag(2)
                   } label: {
                       Text("选择交通工具")
                   }
               }
            
                Section("segmented类型") {
                    Picker("请选择交通工具", selection: $pickVal2) {
                        Text("飞机").tag(0)
                        Text("火车").tag(1)
                        Text("轮船").tag(2)
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("inline类型") {
                   Picker("请选择交通工具", selection: $pickVal2) {
                       Text("飞机").tag(0)
                       Text("火车").tag(1)
                       Text("轮船").tag(2)
                   }
                   .pickerStyle(.inline)
               }
               
                
                
            }.navigationTitle("Picker")
        }
    }
}

struct SwiftUI_Picker_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUI_Picker()
    }
}
