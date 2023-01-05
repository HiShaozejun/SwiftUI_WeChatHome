import UIKit

//闭包Closure--函数类型的数据

//在Swift中,函数也可以作为一种类型,就跟Int,String,Array,Dictionary一样,所以也可以把函数类型的数据赋给一个变量
let a = 1

//func b() {
//    print("跟Lebus学iOS开发")
//}

//基本语法
let staticTodo: () -> () = {
    print("跟Lebus学iOS开发")
}
staticTodo() //因为变量是函数类型,所以使用这个变量的话就需要调用他


//既然是函数类型,自然本质上也和之前的func一样,可以有参数和返回值

//形式参数
func xx(para1: String, para2: String) -> String {
    //使用其中的参数做一些处理等...
    return ""
}
//传入实际参数
//xx(para1: "x", para2: "y")

//形式参数
let dynamicTodo: (String, String) -> String = { (who: String, course: String) -> String in
    "跟\(who)学\(course)"
}
//传入实际参数
dynamicTodo("Lebus", "iOS开发")

//仅有参数的闭包(返回值也可写做Void)
//let todo: (String) -> () = { (course: String) in
//    print(course)
//}
//todo("Lebus")

//仅有返回值的闭包
//let todo: () -> String = { () -> String in "跟Lebus学iOS开发" }
//todo()


//闭包也可直接调用,比如在UIKit中用代码写一个View(之前在进阶版中也有讲).此时两边至少要有一个地方写返回的类型
let titleLabel: UILabel = { () -> UILabel in
    let titleLabel = UILabel()
    titleLabel.text = "Lebus"
    return titleLabel
}()
