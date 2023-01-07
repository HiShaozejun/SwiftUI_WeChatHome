//
//  SwiftUI_TextField.swift
//  WeChatSwiftUI
//
//  Created by shaozejun on 2023/1/6.
//

import SwiftUI


/**
    Textfield的基本使用
 */
struct SwiftUI_TextField: View {
    
    @State private var textFieldVal: String = ""
    @State private var textFieldVal2: String = ""
    @State private var textFieldVal3: String = ""
    @State private var textFieldVal4: String = ""
    var body: some View {
        
        Form {
            
            // 常用
            TextField("请输入电话", text: $textFieldVal)
            
            // 指定视图，可以修改占位文字的属性和样式
            if #available(iOS 15.0, *) {
                TextField(text: $textFieldVal2) {
                    
                    Text("请输入单据张数")
                }.onChange(of: textFieldVal2) { val in
                    print(val)
                }
            } else {
                // Fallback on earlier versions
            }
            
            // Mac和iOS端区别
            if #available(iOS 15.0, *) {
                // prompt：提示； 在mac端与iOS端该方法显示有区别。mac端title默认有标题，prompt为占位提示内容，iOS端title为占位提示
                TextField("请输入地址", text:$textFieldVal3, prompt: Text("我是地址"))
            }
            
            //密码输入框
            SecureField("请输入密码", text: $textFieldVal4)
        }
    }
}

/**
    TextField练习+ button校验
 */

struct MyTextField: View {
    
    @State private var name: String = ""
    @State private var phone: String = ""
    @State private var address: String = ""
    
    //让光标聚焦到绑定的textfield上
    @FocusState private var isNameFocus: Bool
    
    //控制button是否可以点击
    var invalidInput: Bool {
        return name.isEmpty || phone.isEmpty || address.isEmpty
    }
    
    var body: some View {
        
        NavigationView {
            
            Form{
                
                Section {
                    
                    HStack{
                        Text("姓名:")
                        TextField("请输入收件人姓名", text: $name)
                            // 绑定光标的聚焦
                            .focused($isNameFocus)
                    }
                    
                    HStack{
                        Text("电话:")
                        TextField("请输入收件人电话", text: $phone).keyboardType(.numberPad)
                    }
                    
                    HStack{
                        Text("地址:")
                        TextField("请输入收件人地址", text: $address)
                    }
                } header: {
                    Text("基本信息").foregroundColor(Color.black).font(.title2)
                }
                
                Section {
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            print("\(name) -- \(phone) -- \(address)")
                            // 如果TextField为空，让光标自动定位到该textField
                            isNameFocus = name.isEmpty
                             
                        } label: {
                            Text("提交").font(Font.system(size: 26))
                        }
                        // 增加验证
//                        .disabled(invalidInput)
                        
                        Spacer()
                    }
                }
            }
            .navigationBarTitle("新增收货地址")
        }
        
    }
}


/**
    1. 多个TextField的光标定位
    2. textField默认初始化聚焦，采用延迟设置的方式
    3. 滚动列表收起键盘
    4. pickview使用
 */

struct FormDemo: View {
    
    @State private var name: String = ""
    @State private var phone: String = ""
    @State private var address: String = ""
    
    // 如果多个TextField需要定位光标，使用枚举，遵守Hashable协议
    enum FieldType: Hashable { case name,phone,address }
    
    //让光标聚焦到绑定的textfield上
    @FocusState private var isFocus: FieldType?
    
    var body: some View {
        
        NavigationView {
            
            Form{
                
                Section {
                    
                    HStack{
                        Text("姓名:")
                        TextField("请输入收件人姓名", text: $name)
                            // 绑定光标的聚焦
                            .focused($isFocus, equals: .name)
                    }
                    HStack{
                        Text("电话:")
                        TextField("请输入收件人电话", text: $phone).keyboardType(.numberPad)
                            .focused($isFocus, equals: .phone)
                    }
                    HStack{
                        Text("地址:")
                        TextField("请输入收件人地址", text: $address)
                            .focused($isFocus, equals: .address)
                    }
                } header: {
                    Text("基本信息").foregroundColor(Color.black).font(.title2)
                }
                
                Section {
                    
                    HStack {
                        Spacer()
                        Button {
                            
                            //光标定位切换
                            if name.isEmpty {
                                isFocus = .name
                            }else if phone.isEmpty {
                                isFocus = .phone
                            }else if address.isEmpty {
                                isFocus = .address
                            }else{
                                isFocus = nil
                                print(name,phone,address)
                            }
                             
                        } label: {
                            Text("提交").font(Font.system(size: 26))
                        }
                        Spacer()
                    }
                }
            }
            .navigationBarTitle("新增收货地址")
            // 为键盘添加二级键盘
            .toolbar(content: {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button {
                        isFocus = nil
                    } label: {
                        Text("完成")
                    }
                }
            })
            .onAppear(){
                //默认开始聚焦,延迟 0.2s
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
                    isFocus = .name
                })
            }
        }
    }
}

struct SwiftUI_TextField_Previews: PreviewProvider {
    static var previews: some View {
//        SwiftUI_TextField()
//        MyTextField()
        FormDemo()
        
    }
}
