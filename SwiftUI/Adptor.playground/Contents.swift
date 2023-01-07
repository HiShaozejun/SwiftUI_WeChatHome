import UIKit
import SwiftUI


struct Person {
    
    var newName: String
    
    //在结构体中需要修改属性值，函数前添加mutating，
    mutating func setPersonName(name: String) -> Void {
        newName = name
    }
}

//需要使用 var定义变量
var p = Person(newName: "jason")
p.setPersonName(name: "lisi")
print(p.newName)

//在SwiftUI中，都是以结构体定义的view，声明的变量 在body中也是无法直接修改的,所以需要State和Binding属性包装器
struct ContentView: View {
    
    let a = 10
    
    var body: some View {
        Text("body")
        // 编译错误
//        a = 10
    }
}


