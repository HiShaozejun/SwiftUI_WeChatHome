import SwiftUI

//泛型generic

//func simpleMax(x: Int, y: Int) -> Int { x < y ? y : x }
//
//simpleMax(x: 1, y: 2)
//
//func simpleMax(x: Double, y: Double) -> Double { x < y ? y : x }
//
//simpleMax(x: 1.2, y: 2.4)

//泛型函数-generic function
func simpleMax<T: Comparable>(x: T, y: T) -> T { x < y ? y : x }
simpleMax(x: 3, y: 4)
simpleMax(x: 2.4, y: 3.6)

//-----------------------------------

//泛型类型-generic type
//1.系统标准库里面的
let a: Array<Int> = [1,2]
let b: Dictionary<Int, Int> = [1:2]

//2.自定义的
struct IntModel {
    var items: [Int] = []
    mutating func add(_ item: Int) {
        items.append(item)
    }
}
var intModel = IntModel()
intModel.add(3)

struct Model<Element> where Element: Comparable {
    var items: [Element] = []
    mutating func add(_ item: Element) {
        items.append(item)
    }
}
var model = Model<Int>()
model.add(3)

var model2 = Model<Double>()
model2.add(2.4)

//-----------------------------------

//类型约束-让泛型是某个父类的子类,或者是遵循某种协议
//简单的类型约束--直接加冒号
//复杂的类型约束--where子句(放在函数或struct/class/枚举的大括号前面)
struct ModelX1<S: Sequence> where S.Iterator.Element: Equatable {}

struct ModelX2<S1: Sequence, S2: Sequence> where S1.Iterator.Element == S2.Iterator.Element {}

//-----------------------------------

//类型参数-type parameter
//上述的T,Element,Key,Value,S等都被称作是类型参数

//-----------------------------------
