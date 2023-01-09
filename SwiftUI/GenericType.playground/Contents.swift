import UIKit
import SwiftUI

/**
    泛型
 */

//Equatable: == !=
//Comparable: > <

func simpleMax<T: Comparable>(a: T,b: T) -> T {
    return a > b ? a :b
}

simpleMax(a: 10, b: 20)

/**
    自定义泛型类
 */
struct Model<Element>{
    
    var items: [Element] = [Element]()
    mutating func add(val: Element) -> Void {
        items.append(val)
    }
}

var model = Model<Int>()
model.add(val: 12)

var model2 = Model<String>()
model2.add(val: "12")

/**
    函数泛型
    简单的泛型约束：让泛型是某一个父类的子类，或者是遵循某种协议
    复杂的泛型需要使用where关键字定义约束
 */
func generic1<T: Comparable>(a: T, b: T) {
    
}


/**
    自定义类泛型
 */
protocol TearchProtocol {
    var age:Int {get}
}

struct TearchModel<Element:TearchProtocol> {}
struct TearchModel2<Element> where Element: TearchProtocol {}


/**
    协议泛型，使用associatedtype定义泛型
 */
protocol ModelProtocol {
    //定义泛型类
    associatedtype GenericItem
    
    var val: GenericItem {set get}
    
    func addItem(item:GenericItem) -> Void;

}

struct MyModel: ModelProtocol {
    
    func addItem(item: String) {
        print("实现协议方法")
    }
    // 确定泛型类型，也可以省略，自动类型推断
    typealias GenericItem = String
    
    //实现协议属性
    var val: String
    
}

/**
    不透明类型: some，等完全渲染完成后就会知道该类型
 */
struct ContentView:  View{
    
    var body: some View {
        Button("come 类型") {
            
        }
    }
}

